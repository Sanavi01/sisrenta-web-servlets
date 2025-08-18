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
 * Servlet encargado de gestionar las solicitudes relacionadas con el inicio de sesión de clientes/empleados.
 * 
 * <p>Este servlet recibe los datos enviados desde el formulario de inicio de sesión
 * (usuario y contraseña), valida las credenciales a través de la clase 
 * {@link LogicController}, y redirige al usuario a la página correspondiente 
 * según el resultado de la autenticación.</p>
 *
 * <p>URL de acceso: <b>/pages/SvCliente</b></p>
 * 
 * <p>Comportamiento:</p>
 * <ul>
 *   <li>Si el usuario no existe, se redirige a <code>index.jsp</code>.</li>
 *   <li>Si las credenciales son incorrectas, se redirige a <code>index.jsp</code>
 *       mostrando un mensaje en consola.</li>
 *   <li>Si las credenciales son correctas, se redirige a <code>landing.jsp</code>.</li>
 * </ul>
 * 
 * @author Sanavi
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

     /**
     * Maneja las solicitudes HTTP de tipo POST.
     * 
     * <p>Se encarga de recibir los parámetros del formulario de inicio de sesión:
     * <code>usuario</code> y <code>contrasena</code>. 
     * Posteriormente, valida si el usuario existe en la base de datos y si las 
     * credenciales son correctas.</p>
     *
     * <ul>
     *   <li>Si el empleado no existe → redirige a <code>index.jsp</code>.</li>
     *   <li>Si las credenciales son incorrectas → redirige a <code>index.jsp</code>.</li>
     *   <li>Si las credenciales son correctas → redirige a <code>landing.jsp</code>.</li>
     * </ul>
     *
     * @param request  Objeto {@link HttpServletRequest} con los parámetros del formulario
     * @param response Objeto {@link HttpServletResponse} con la respuesta al cliente
     * @throws ServletException en caso de error en la ejecución del servlet
     * @throws IOException en caso de error de entrada/salida
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String username = request.getParameter("usuario");
         String password = request.getParameter("contrasena");
         LogicController logicController = new LogicController();
         Employee employee = logicController.findEmployeeByUsername(username);
         if(employee == null){
              // Usuario no encontrado → redirige al login
             request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
         }else {
              // Validación de credenciales
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
