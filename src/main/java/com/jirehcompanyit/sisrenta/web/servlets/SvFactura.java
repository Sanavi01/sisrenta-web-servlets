package com.jirehcompanyit.sisrenta.web.servlets;

import com.jirehcompanyit.sisrenta.web.logica.Cliente;
import com.jirehcompanyit.sisrenta.web.logica.Factura;
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
@WebServlet(name = "SvFactura", urlPatterns = {"/pages/SvFactura"})
public class SvFactura extends HttpServlet {

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

        Factura factura = new Factura();
        LogicController logicController = new LogicController();

        int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
        String description = request.getParameter("descripcion");
        String recomendaciones = request.getParameter("recomendaciones");
        int rentValue = Integer.parseInt(request.getParameter("valor"));
        int creditValue = Integer.parseInt(request.getParameter("creditValue"));
        int depositValue = Integer.parseInt(request.getParameter("depositValue"));
        String status = request.getParameter("status");

        Cliente cliente = logicController.findClienteById(cliente_id);
        
        factura.setCliente(cliente);
        factura.setDescription(description);
        factura.setExtraInfoRent(recomendaciones);
        factura.setRentValue(rentValue);
        factura.setCreditValue(creditValue);
        factura.setDepositValue(depositValue);
        factura.setState(status);

        logicController.createFactura(factura);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
