<%-- 
    Document   : landing-content
    Created on : Aug 8, 2025, 6:03:38 PM
    Author     : sanavi

    Descripción:
    ------------
    Página de contenido principal de bienvenida del sistema SISRENTA.
    Se muestra al iniciar sesión y sirve como landing page para orientar al usuario.

    Funcionalidad:
    ---------------
    - Contenedor principal de contenido derecho (.right-side) con barra superior.
    - Barra superior (.top-menu) con botón para colapsar el menú lateral y título "SISRENTA".
    - Contenido principal (.main-content) con mensaje de bienvenida:
        - Mensaje de saludo centralizado.
        - Breve descripción del sistema como software de renta online.
        - Indicaciones sobre el menú de navegación a la izquierda.

    Estructura:
    -----------
    - Contenedor principal (.right-side) con padding y fondo blanco.
    - Barra superior (.top-menu) consistente con otras páginas internas.
    - Contenido de bienvenida (.main-content) dentro de un card de Bootstrap con sombra y padding.
    - Texto centrado mediante flexbox (.welcome).

    Tecnologías y dependencias:
    ---------------------------
    - JSP estándar para renderizar la página.
    - CSS inline para estilos específicos.
    - Bootstrap 5 para diseño de card, sombras y layout.

    Consideraciones:
    ----------------
    - No interactúa con la base de datos ni con la sesión.
    - Sirve únicamente como guía visual y orientación inicial para el usuario.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .main-content{      
    }

    .welcome{
        display: flex;
        justify-content: center;
        align-items: center;
    }


</style>

<div class="right-side">
    <div class="top-menu">
        <button class="hamburger btn btn-toggle col-1" data-bs-target="#menu-container" data-bs-toggle="collapse"
            aria-controls="menu-container" aria-expanded="true"><img
                src="https://img.icons8.com/?size=100&id=8113&format=png&color=000000" alt="toggle" width="30"></button>
        <h3 style="margin-bottom: 0px;">
            SISRENTA
        </h3>
    </div>
    <!-- Aquí se inyectará el todo el contenido de la pagina -->
    <div class="main-content">
        <div class="container-fluid ">
            <div class="card shadow p-2 welcome" >
                <h1 style="text-align: center;">Bienvenido a SISRENTA</h1>
                <h2 style="margin-bottom: 30px; text-align: center;">Tu software de renta online</h2>
                <h3 style="text-align: center;">En el menu de navegacion a la izquierda podra acceder a las diferentes funciones del sistema</h3>
            </div>
        </div>
    </div>
</div>