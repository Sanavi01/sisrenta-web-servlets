<%-- 
    Document   : landing
    Created on : Aug 6, 2025, 2:05:07 PM
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

    <div class="wrapper" style="height: 100%;">
        <div class="row flex-nowrap gx-0 " style="height: 100%;">
            <!-- Menú lateral -->
            <div class="col-1 collapsed show sidebar" style="min-width: 120px; height: 100%;" id="menu-container"></div>

            <!-- Rightside -->
            <div class="col" id="content" style="height: 100%;">
                <!-- Aquí se inyectará el contenido específico -->
            </div>
        </div>
        <!-- Footer -->
        <div class="row gx-0 footer" style="width: 100%;" id="footer">
            <!-- Aquí se inyectará el footer -->
        </div>
    </div>

    <script>
        // Cargar menú
        fetch('../Componentes/menu.html')
            .then(res => res.text())
            .then(html => {
                document.getElementById('menu-container').innerHTML = html;
            });

        // Cargar contenido específico de la vista
        fetch('../content-pages/landing-content.jsp')
            .then(res => res.text())
            .then(html => {
                document.getElementById('content').innerHTML = html;
            });
        //Cargar Footer
        fetch('../Componentes/footer.html')
            .then(res => res.text())
            .then(html => {
                document.getElementById('footer').innerHTML = html;
            });


    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>

</body>

</html>