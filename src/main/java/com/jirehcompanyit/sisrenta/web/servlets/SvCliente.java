package com.jirehcompanyit.sisrenta.web.servlets;

import com.jirehcompanyit.sisrenta.web.logica.Employee;
import com.jirehcompanyit.sisrenta.web.logica.LogicController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sanavi
 */
@WebServlet(name = "SvCliente", urlPatterns = {"/pages/SvCliente"})
public class SvCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {     

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String username = request.getParameter("usuario");
         String password = request.getParameter("contrasena");
         LogicController logicController = new LogicController();
         Employee employee = logicController.findEmployeeByUsername(username);
         if(employee == null){
             request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
         }else {
             if(employee.getUsername().equals(username) != employee.getPassword().equals(password)){
                 request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
                 System.out.println("El usuario o la contraseña no son correctos");
             } else if(employee.getUsername().equals(username) == employee.getPassword().equals(password)) {
                 request.getRequestDispatcher("/pages/landing.jsp").forward(request, response);
             }
         }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
