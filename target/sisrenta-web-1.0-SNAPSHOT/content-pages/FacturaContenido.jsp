<%-- 
    Document   : FacturaContenido
    Created on : Aug 9, 2025, 7:18:11 PM
    Author     : sanavi
--%>

<%@page import="com.jirehcompanyit.sisrenta.web.logica.Cliente"%>
<%@page import="com.jirehcompanyit.sisrenta.web.logica.Factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Factura factura = (Factura) session.getAttribute("factura");
    Cliente clienteFactura = factura.getCliente();
%>
<!DOCTYPE html>
<style>
    .right-side {
        background-color: white;
        padding: 10px;
    }

    #menu-container.collapsing {
        transition: none !important;
        height: auto !important;
    }


    .top-menu {
        height: 5%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>

<div class="right-side">
    <div class="top-menu" style="margin-bottom: 20px;">
        <button class="hamburger btn btn-toggle col-1" data-bs-target="#menu-container" data-bs-toggle="collapse"
                aria-controls="menu-container" aria-expanded="true"><img
                src="https://img.icons8.com/?size=100&id=8113&format=png&color=000000" alt="toggle" width="30"></button>
        <h3 style="margin-bottom: 0px;">
            SISRENTA
        </h3>
    </div>
    <!-- Aquí se inyectará el todo el contenido de la pagina -->
    <div class="main-content">
        <h1 style="margin-bottom: 20px;">Facturas</h1>
        <div class="card shadow p-3">
            <div class="">
                <p><b>Cliente:</b> <%= clienteFactura.getName() + " " + clienteFactura.getLastName()%></p>
                <p><b>Celular:</b> <%= clienteFactura.getPhoneNumber()%></p>
            </div>
            <div class="border-bottom">
                <p><b>Descripcion:</b></p>
                <p><%= factura.getDescription()%></p>
            </div>
            <div class="border-bottom">
                <p><b>Recomendaciones</b></p>
                <%
                    String extraRecomendacion = "null";
                    if (factura.getExtraInfoRent() != null){
                        extraRecomendacion = factura.getExtraInfoRent();
                    }
                %>
                <p><%= extraRecomendacion%></p>
            </div>
            <div class="row border-bottom mb-2">
                <div class="col">
                    <p><b>Valor</b></p>
                    <p><%= factura.getRentValue() %></p>
                </div>
                <div class="col">
                    <p><b>Credito</b></p>
                    <p><%= factura.getCreditValue()%></p>
                </div>
                <div class="col">
                    <p><b>Deposito</b></p>
                    <p><%= factura.getDepositValue() %></p>
                </div>
            </div>
            <div class="row">
                <div class="col"><p><b>Fecha Creacion</b></p></div>
                <div class="col"><p><b>Fecha Entrega</b></p></div>
                <div class="col"><p><b>Fecha Devolucion</b></p></div>
            </div>
            <div class="row">
                <div class="col"><p><%= factura.getCreationDate()%></p></div>
                <div class="col"><p><%= factura.getDeliverDate() %></p></div>
                <div class="col"><p><%= factura.getDevolutionDate()%></b></div>
            </div>

            <div style="display: flex; align-items: center; justify-content: center; flex-direction: column;"  >
                <p><b>Status:</b></p>
                <button class="btn btn-primary" disabled><%= factura.getState() %></button>
            </div>

        </div>
    </div>
</div>