package com.jirehcompanyit.sisrenta.web.servlets;

import com.jirehcompanyit.sisrenta.web.logica.Cliente;
import com.jirehcompanyit.sisrenta.web.logica.LogicController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet encargado de la gestión de creación y consulta de clientes en el
 * sistema.
 *
 * <p>
 * Este servlet permite dos operaciones principales:</p>
 * <ul>
 * <li><b>GET:</b> Busca un cliente en el sistema a partir de su número de
 * teléfono y lo almacena en la sesión para ser mostrado en la vista
 * <code>InfoCliente.jsp</code>.</li>
 * <li><b>POST:</b> Crea un nuevo cliente en la base de datos a partir de los
 * parámetros recibidos en el formulario y redirige a
 * <code>BuscarCliente.html</code>.</li>
 * </ul>
 *
 * <p>
 * URL de acceso: <b>/pages/SvCrearCliente</b></p>
 *
 * @author Sanavi
 */
@WebServlet(name = "SvCrearCliente", urlPatterns = {"/pages/SvCrearCliente"})
public class SvCrearCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    /**
     * Maneja las solicitudes HTTP de tipo GET.
     *
     * <p>
     * Busca un cliente existente en el sistema mediante el número de teléfono
     * recibido como parámetro (<code>phoneNumber</code>), lo guarda en la
     * sesión actual y redirige a la vista <code>InfoCliente.jsp</code>.</p>
     *
     * @param request Objeto {@link HttpServletRequest} con los parámetros de la
     * solicitud
     * @param response Objeto {@link HttpServletResponse} con la información de
     * la respuesta
     * @throws ServletException en caso de error en la ejecución del servlet
     * @throws IOException en caso de error de entrada/salida
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LogicController LogicController = new LogicController();

        String phoneNumber = request.getParameter("phoneNumber");
        Cliente cliente = LogicController.findClienteByPhoneNumber(phoneNumber);

        HttpSession session = request.getSession();

        session.setAttribute("cliente", cliente);

        request.getRequestDispatcher("/pages/InfoCliente.jsp").forward(request, response);
    }

    
    /**
     * Maneja las solicitudes HTTP de tipo POST.
     * 
     * <p>Crea un nuevo cliente en el sistema a partir de los datos enviados 
     * en el formulario: nombre, apellido, celular y dirección. 
     * Posteriormente, redirige al usuario a la vista <code>BuscarCliente.html</code>.</p>
     *
     * @param request  Objeto {@link HttpServletRequest} con los parámetros enviados desde el formulario
     * @param response Objeto {@link HttpServletResponse} con la información de la respuesta
     * @throws ServletException en caso de error en la ejecución del servlet
     * @throws IOException en caso de error de entrada/salida
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cliente cliente = new Cliente();
        LogicController logicController = new LogicController();

        String name = request.getParameter("nombre");
        String lastName = request.getParameter("apellido");
        String phoneNumber = request.getParameter("celular");
        String address = request.getParameter("direccion");

        cliente.setName(name);
        cliente.setLastName(lastName);
        cliente.setPhoneNumber(phoneNumber);
        cliente.setHomeAddress(address);

        logicController.createCliente(cliente);

        request.getRequestDispatcher("/pages/BuscarCliente.html").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
