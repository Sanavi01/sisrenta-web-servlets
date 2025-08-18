<%-- 
    Document   : AlertaPreparacionContenido
    Created on : Aug 10, 2025, 4:20:44 PM
    Author     : sanavi

 Descripción:
    ------------
    Página de contenido para la sección de "Alertas - Por Preparar" del sistema SISRENTA.
    Muestra todas las facturas que están pendientes de preparación para su entrega, con 
    información resumida y botones para acceder a los detalles de cada factura.

    Funcionalidad:
    ---------------
    - Obtiene la lista de facturas pendientes de preparar mediante LogicController.
    - Para cada factura:
        - Muestra ID de la factura.
        - Fecha de creación.
        - Estado actual.
        - Descripción / resumen de la factura.
        - Botón que redirige al servlet SvFactura para ver los detalles completos de la factura.

    Estructura:
    -----------
    - Contenedor principal (.right-side) que contiene la barra superior y el contenido principal.
    - Barra superior (.top-menu) con botón de menú y título "SISRENTA".
    - Contenido principal (.main-content) con:
        - Título de la sección.
        - Tarjetas (.card) para cada factura pendiente, usando borde verde para resaltar.
    - Cada tarjeta tiene dos columnas:
        1. Información general de la factura.
        2. Resumen y botón para ver detalles.

    Tecnologías y dependencias:
    ---------------------------
    - JSP estándar con scriptlets para iterar sobre la lista de facturas.
    - CSS inline para estilos específicos de la sección.
    - Bootstrap 5 para diseño y componentes visuales (cards, botones, grids).
    - Formularios GET para enviar el ID de la factura al servlet SvFactura.
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