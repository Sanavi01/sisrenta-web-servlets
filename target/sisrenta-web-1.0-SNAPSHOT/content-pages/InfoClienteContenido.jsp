<%-- 
    Document   : InfoClienteContenido
    Created on : Aug 8, 2025, 10:11:55 PM
    Author     : sanavi

    Descripción:
    ------------
    Página de contenido para la sección de "Información del Cliente" en el sistema SISRENTA.
    Permite visualizar los datos personales de un cliente y sus facturas asociadas.

    Funcionalidad:
    ---------------
    - Recupera el objeto Cliente desde la sesión.
    - Muestra la información personal del cliente:
        - Nombre
        - Apellidos
        - Número de celular
        - Dirección
    - Permite crear una nueva factura para el cliente mediante un botón que redirige a CrearFactura.jsp.
    - Lista todas las facturas asociadas al cliente, mostrando para cada una:
        - ID de la factura
        - Fecha de creación
        - Estado
        - Resumen/Descripción
        - Botón que redirige a la visualización de la factura específica (SvFactura).

    Estructura:
    -----------
    - Contenedor principal (.right-side) con barra superior y contenido principal.
    - Barra superior (.top-menu) con botón de menú y título "SISRENTA".
    - Contenido principal (.main-content) dividido en dos columnas:
        - Columna de Información del Cliente (.InfoCliente)
        - Columna de Facturas del Cliente (.FacturasCliente)
    - Cada factura se representa como una tarjeta (.card) con información distribuida en filas y columnas para mayor claridad.

    Tecnologías y dependencias:
    ---------------------------
    - JSP estándar para renderizar la página.
    - CSS inline para estilos específicos.
    - Bootstrap 5 para diseño y componentes visuales (cards, botones, grids).
    - Scriptlets JSP para iterar sobre las facturas del cliente y mostrar dinámicamente la información.
--%>

<%@page import="com.jirehcompanyit.sisrenta.web.logica.LogicController"%>
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
                            System.out.println(facturaCliente.getDescription());
                    %>
                    <div class="card p-2 factura">
                        <div class="row">
                            <div class="col-4 border-end">
                                <p>Factura <%= facturaCliente.getId()%></p>
                                <p>Fecha: <%= facturaCliente.getCreationDate()%></p>
                                <p>Status: <%= facturaCliente.getState()%></p>
                            </div>
                            <div class="col">
                                <p><b>Resumen</b></p>
                                <p><%= facturaCliente.getDescription()%></p>
                                <div style="display: flex; justify-content: center;">
                                    <form method="GET" action="${pageContext.request.contextPath}/pages/SvFactura">
                                        <button type="submit" class="btn btn-primary" value="<%= facturaCliente.getId()%>" name="factura_id">Factura</button>
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
    </div>
</div>