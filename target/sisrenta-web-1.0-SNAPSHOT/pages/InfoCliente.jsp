<%-- 
    Document   : InfoCliente
    Created on : Aug 9, 2025, 11:33:02 AM
    Author     : sanavi

    Descripción:
    ------------
    Página JSP del sistema SISRENTA encargada de mostrar la información detallada
    de un cliente específico, incluyendo sus datos personales y las facturas
    asociadas.

    Estructura:
    ------------
    - Wrapper principal que ocupa toda la ventana del navegador.
    - Menú lateral reutilizable mediante <jsp:include page="../Componentes/menu.html" />.
    - Contenido principal cargado dinámicamente desde
      <jsp:include page="../content-pages/InfoClienteContenido.jsp" />.
    - Footer reutilizable mediante <jsp:include page="../Componentes/footer.html" />.
    
    Tecnologías y dependencias:
    ---------------------------
    - HTML5 y Bootstrap 5.3.7 para maquetación y estilos.
    - CSS propio desde ../styles/global.css.
    - Scripts de Bootstrap desde CDN para funcionalidades interactivas.
    - Diseño responsive mediante meta viewport y clases de Bootstrap.
    
    Funcionamiento:
    ----------------
    1. El menú lateral permite la navegación dentro del sistema.
    2. El contenido principal muestra la información detallada del cliente,
       incluyendo datos personales y facturas.
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
                        <jsp:include page="../Componentes/menu.html" />
                    </div>
                    <!-- Contenido -->
                    <div class="col">
                        <jsp:include page="../content-pages/InfoClienteContenido.jsp" />
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