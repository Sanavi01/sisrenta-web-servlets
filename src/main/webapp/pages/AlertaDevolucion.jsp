<%-- 
    Document   : AlertaDevolucion.jsp
    Created on : Aug 10, 2025, 6:22:15 PM
    Author     : Sanavi

    Descripción:
    ------------
    Página JSP del sistema SISRENTA encargada de mostrar alertas de devolución
    de productos o servicios alquilados.

    Estructura:
    ------------
    - Wrapper principal que ocupa toda la ventana del navegador.
    - Menú lateral reutilizable mediante <jsp:include page="../Componentes/menu.html" />.
    - Contenido dinámico principal cargado desde
      <jsp:include page="../content-pages/AlertaDevolucionContenido.jsp" />.
    - Footer reutilizable mediante <jsp:include page="../Componentes/footer.html" />.
    
    Tecnologías y dependencias:
    ---------------------------
    - HTML5 y Bootstrap 5.3.7 para maquetación y estilos.
    - CSS propio desde ../styles/global.css.
    - Scripts de Bootstrap desde CDN para funcionalidades interactivas.
    - Diseño responsive mediante meta viewport y clases de Bootstrap.
    
    Funcionamiento:
    ----------------
    1. El menú lateral permite navegación dentro del sistema.
    2. El contenido principal se genera dinámicamente a través del JSP
       incluido, mostrando la alerta de devolución correspondiente.
    3. El footer se mantiene constante en todas las páginas del sistema.
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SISRENTA</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link rel="stylesheet" href="../styles/global.css">
    </head>

    <body>

        <div class="wrapper">
            <div class="row flex-nowrap gx-0 " style="min-height: 100vh;" >
                <div class="row flex-nowrap gx-0" style="min-height: 100vh;">
                    <!-- Menu -->
                    <div class="col-1 collapsed show sidebar" style="min-width: 120px;">
                        <jsp:include page="../Componentes/menu.html"  />
                    </div>
                    <!-- Contenido -->
                    <div class="col">
                        <jsp:include page="../content-pages/AlertaDevolucionContenido.jsp" />
                    </div>
                </div>

                <!-- Footer -->
                <div class="row gx-0 footer" style="width: 100%;">
                    <jsp:include page="../Componentes/footer.html" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
            crossorigin="anonymous"></script>

    </body>

</html>