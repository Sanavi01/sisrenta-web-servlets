<%-- 
    Document   : CrearFacturaContenido
    Created on : Aug 9, 2025, 2:43:18 PM
    Author     : sanavi
--%>

<%@page import="com.jirehcompanyit.sisrenta.web.logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <h1 class="mb-4">Crear Factura</h1>
        <div class="card shadow p-4 mb-4">
            <form action="${pageContext.request.contextPath}/pages/SvFactura" method="POST">
                <input name="cliente_id" value="<%= cliente.getClient_id() %>">
                <div class="mb-3">
                    <label for="descripcion" class="form-label"><strong>Descripción</strong></label>
                    <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="recomendaciones" class="form-label"><strong>Recomendaciones</strong></label>
                    <textarea class="form-control" id="recomendaciones" name="recomendaciones" rows="2"></textarea>
                </div>

                <div class="row mb-3">
                    <div class="col-md">
                        <label for="valor" class="form-label"><strong>Valor de Renta</strong></label>
                        <input type="number" class="form-control" id="valor" name="valor" required />
                    </div>
                     <div class="col-md">
                        <label for="valor" class="form-label"><strong>Credito</strong></label>
                        <input type="number" class="form-control" id="creditValue" name="creditValue" required />
                    </div>
                    <div class="col-md">
                        <label for="depositValue" class="form-label"><strong>Depósito</strong></label>
                        <input type="number" class="form-control" id="depositValue" name="depositValue" />
                    </div>
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label"><strong>Status</strong></label>
                    <select class="form-select" id="status" name="status" required>
                        <option value="por_entregar" selected>Por Entregar</option>
                        <option value="entregado">Entregado</option>
                        <option value="devuelto">Devuelto</option>
                    </select>
                </div>

                <div class="text-end">
                    <a href=""><button class="btn btn-success" type="submit">Crear Factura</button> </a>
                </div>
            </form>
        </div>
    </div>
</div>