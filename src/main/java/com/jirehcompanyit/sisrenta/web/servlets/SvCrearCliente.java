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
 *
 * @author sanavi
 */
@WebServlet(name = "SvCrearCliente", urlPatterns = {"/pages/SvCrearCliente"})
public class SvCrearCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

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
