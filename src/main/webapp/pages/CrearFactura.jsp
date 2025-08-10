<%-- 
    Document   : CrearFactura
    Created on : Aug 9, 2025, 2:43:10 PM
    Author     : sanavi
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
                        <jsp:include page="../content-pages/CrearFacturaContenido.jsp" />
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