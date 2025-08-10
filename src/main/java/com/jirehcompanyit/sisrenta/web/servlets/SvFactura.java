package com.jirehcompanyit.sisrenta.web.servlets;

import com.jirehcompanyit.sisrenta.web.logica.Cliente;
import com.jirehcompanyit.sisrenta.web.logica.Factura;
import com.jirehcompanyit.sisrenta.web.logica.LogicController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "SvFactura", urlPatterns = {"/pages/SvFactura"})
public class SvFactura extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

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
        
        
        
        List<Factura> listaFacturas = cliente.getListaFacturas();
        listaFacturas.add(factura);
        
        cliente.setListaFacturas(listaFacturas);

        logicController.createFactura(factura);
        logicController.editCliente(cliente);
        
        request.getRequestDispatcher("/pages/InfoCliente.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
