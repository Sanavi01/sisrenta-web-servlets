<%-- 
    Document   : BuscarClienteContenido
    Created on : Aug 8, 2025, 9:47:42 PM
    Author     : sanavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .right-side {
        background-color: white;
        padding: 10px;
        height: 100%;
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
    <div class="top-menu" style="margin-bottom: 20px;"">
        <button class=" hamburger btn btn-toggle col-1" data-bs-target="#menu-container" data-bs-toggle="collapse"
        aria-controls="menu-container" aria-expanded="true"><img
            src="https://img.icons8.com/?size=100&id=8113&format=png&color=000000" alt="toggle" width="30"></button>
        <h3 style="margin-bottom: 0px;">
            SISRENTA
        </h3>
    </div>
    <!-- Aquí se inyectará el todo el contenido de la pagina -->
    <div class="main-content">
        <h1 style="margin-bottom: 20px;">Buscar cliente</h1>
        <div class="card shadow p-2">
            <h5>Ingrese aquí el numero de celular del cliente</h5>
            <form class="d-flex" role="search" action="${pageContext.request.contextPath}/pages/SvCrearCliente" method="GET">
                <input class="form-control me-2" type="search" name="phoneNumber" placeholder="Buscar..." aria-label="Buscar" />
                <a href=""><button class="btn btn-outline-primary" type="submit">Buscar</button> </a>
            </form>
        </div>
    </div>
</div>