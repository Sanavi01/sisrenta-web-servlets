<%-- 
    Document   : BuscarClienteContenido
    Created on : Aug 8, 2025, 9:47:42 PM
    Author     : sanavi

    Descripción:
    ------------
    Página de contenido para la sección de "Buscar Cliente" del sistema SISRENTA.
    Permite al usuario ingresar un número de celular para buscar la información de un cliente
    existente en la base de datos.

    Funcionalidad:
    ---------------
    - Contiene un formulario que envía el número de celular ingresado al servlet SvCrearCliente.
    - Al enviar el formulario:
        - Se ejecuta la lógica para buscar el cliente por su número de celular.
        - Se redirige a la página de información del cliente (InfoCliente.jsp) si se encuentra.
    - Uso de método GET para enviar el parámetro "phoneNumber".

    Estructura:
    -----------
    - Contenedor principal (.right-side) con barra superior y contenido principal.
    - Barra superior (.top-menu) con botón de menú y título "SISRENTA".
    - Contenido principal (.main-content) con:
        - Título de la sección "Buscar cliente".
        - Tarjeta (.card) que contiene:
            - Indicaciones al usuario sobre cómo buscar.
            - Formulario de búsqueda con campo de texto y botón.

    Tecnologías y dependencias:
    ---------------------------
    - JSP estándar para renderizar la página.
    - CSS inline para estilos específicos.
    - Bootstrap 5 para diseño y componentes visuales (cards, botones, grids, formularios).
    - Formulario HTML que envía datos al servlet SvCrearCliente para procesamiento.
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