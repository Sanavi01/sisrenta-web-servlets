<%-- 
    Document   : AlertaPreparacionContenido
    Created on : Aug 10, 2025, 4:20:44 PM
    Author     : sanavi
--%>

<%@page import="java.util.List"%>
<%@page import="com.jirehcompanyit.sisrenta.web.logica.Factura"%>
<%@page import="com.jirehcompanyit.sisrenta.web.logica.LogicController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    LogicController logicController = new LogicController();
    List<Factura> facturasPorEntregar = logicController.findAllFacturasPorEntregar();
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
        <h1>Alertas - Por Preparar</h1>
        <div class="card shadow" style="gap: 20px;">
            <%
                for (Factura facturaPorEntregar : facturasPorEntregar) {
            %>

            <div class="card border-success p-3 factura border-start">
                <div class="row">
                    <div class="col-4 border-end">
                        <p><b>Factura</b> <%= facturaPorEntregar.getId()%></p>
                        <p><b>Fecha Creacion</b> <%= facturaPorEntregar.getCreationDate()%></p>
                        <p><b>Status:</b> <%= facturaPorEntregar.getState()%> </p>
                    </div>
                    <div class="col">
                        <p><b>Resumen</b></p>
                        <p><%= facturaPorEntregar.getDescription()%></p>
                        <div style="display: flex; justify-content: center;">
                            <form method="GET" action="${pageContext.request.contextPath}/pages/SvFactura">
                                <button type="submit" class="btn btn-success" value="<%= facturaPorEntregar.getId()%>" name="factura_id">Factura</button>
                            </form>
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