<%-- 
    Document   : InfoClienteContenido
    Created on : Aug 8, 2025, 10:11:55 PM
    Author     : sanavi
--%>

<%@page import="com.jirehcompanyit.sisrenta.web.logica.Factura"%>
<%@page import="com.jirehcompanyit.sisrenta.web.logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
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
        <h1>Informacion Cliente</h1>
        <div class="row flex-column flex-md-row">
            <div class="InfoCliente col">
                <div class="card shadow p-3">
                    <p><b>Nombre</b></p>
                    <p class="card p-1"><%= cliente.getName()%></p>
                    <p><b>Apellidos</b></p>
                    <p class="card p-1"><%= cliente.getLastName()%></p>
                    <p><b># de Celular</b></p>
                    <p class="card p-1"><%= cliente.getPhoneNumber()%></p>
                    <p><b>Direccion</b></p>
                    <p class="card p-1"><%= cliente.getHomeAddress()%> </p>
                    <div style="display: flex; justify-content: center;">
                        <a href="../pages/CrearFactura.jsp" class="btn btn-primary">Crear Factura</a>
                    </div>
                </div>
            </div>
            <div class="FacturasCliente col pb-3">
                <div class="card shadow p-3" style="gap: 20px;">
                    <h3>Facturas</h3>
                    <% for (Factura facturaCliente : cliente.getListaFacturas()) {


                    %>
                    <div class="card p-2 factura">
                        <div class="row">
                            <div class="col-4 border-end">
                                <p>Factura <%= facturaCliente.getId() %></p>
                                <p>Fecha: <%= facturaCliente.getCreationDate() %></p>
                                <p>Status: <%= facturaCliente.getState() %></p>
                            </div>
                            <div class="col">
                                <p><b>Resumen</b></p>
                                <p><%= facturaCliente.getDescription() %></p>
                                <div style="display: flex; justify-content: center;">
                                    <a href="Facturas.html" class="btn btn-primary">Factura</a>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>