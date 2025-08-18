package com.jirehcompanyit.sisrenta.web.servlets;

import com.jirehcompanyit.sisrenta.web.logica.Cliente;
import com.jirehcompanyit.sisrenta.web.logica.Factura;
import com.jirehcompanyit.sisrenta.web.logica.LogicController;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet encargado de la gestión de facturas en el sistema.
 *
 * <p>
 * Este servlet permite dos operaciones principales:</p>
 * <ul>
 * <li><b>GET:</b> Recupera una factura por su identificador y la almacena en la
 * sesión para ser mostrada en la vista <code>Factura.jsp</code>.</li>
 * <li><b>POST:</b> Crea una nueva factura a partir de los datos enviados desde
 * un formulario, la asocia a un cliente existente, actualiza la lista de
 * facturas del cliente y persiste los cambios en la base de datos.</li>
 * </ul>
 *
 * <p>
 * URL de acceso: <b>/pages/SvFactura</b></p>
 *
 * @author Sanavi
 */
@WebServlet(name = "SvFactura", urlPatterns = {"/pages/SvFactura"})
public class SvFactura extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Maneja las solicitudes HTTP de tipo GET.
     *
     * <p>
     * Recupera una factura de la base de datos a partir del parámetro
     * <code>factura_id</code>, la almacena en la sesión y redirige a la vista
     * <code>Factura.jsp</code> para su visualización.</p>
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
        LogicController logicController = new LogicController();

        int factura_id = Integer.parseInt(request.getParameter("factura_id"));
        Factura factura = logicController.findFacturaById(factura_id);

        HttpSession session = request.getSession();

        session.setAttribute("factura", factura);
        request.getRequestDispatcher("/pages/Factura.jsp").forward(request, response);
    }

    /**
     * Maneja las solicitudes HTTP de tipo POST.
     *
     * <p>
     * Crea una nueva factura a partir de los parámetros recibidos en el
     * formulario: descripción, recomendaciones, valores económicos y estado.
     * Luego, la asocia al cliente correspondiente, actualiza su lista de
     * facturas y persiste los cambios en la base de datos.</p>
     *
     * <p>
     * Finalmente, redirige a la vista <code>InfoCliente.jsp</code> para mostrar
     * la información actualizada del cliente.</p>
     *
     * @param request Objeto {@link HttpServletRequest} con los parámetros
     * enviados desde el formulario
     * @param response Objeto {@link HttpServletResponse} con la información de
     * la respuesta
     * @throws ServletException en caso de error en la ejecución del servlet
     * @throws IOException en caso de error de entrada/salida
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Factura factura = new Factura();
        LogicController logicController = new LogicController();

         // Parámetros del formulario
        int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
        String description = request.getParameter("descripcion");
        String recomendaciones = request.getParameter("recomendaciones");
        int rentValue = Integer.parseInt(request.getParameter("valor"));
        int creditValue = Integer.parseInt(request.getParameter("creditValue"));
        int depositValue = Integer.parseInt(request.getParameter("depositValue"));
        String status = request.getParameter("status");

        // Buscar cliente asociado
        Cliente cliente = logicController.findClienteById(cliente_id);
       
        
        // Asignar valores a la factura
        factura.setCliente(cliente);
        factura.setDescription(description);
        factura.setExtraInfoRent(recomendaciones);
        factura.setRentValue(rentValue);
        factura.setCreditValue(creditValue);
        factura.setDepositValue(depositValue);
        factura.setState(status);

         // Asociar factura al cliente
        List<Factura> listaFacturas = cliente.getListaFacturas();
        listaFacturas.add(factura);
        cliente.setListaFacturas(listaFacturas);

        // Guardar en la base de datos
        logicController.createFactura(factura);
        logicController.editCliente(cliente);

        request.getRequestDispatcher("/pages/InfoCliente.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
