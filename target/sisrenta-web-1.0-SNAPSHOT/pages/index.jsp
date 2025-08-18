<%-- 
    Document   : index
    Created on : Aug 5, 2025, 12:33:58 PM
    Author     : sanavi

    Descripción:
    ------------
    Página principal de inicio de sesión del sistema SISRENTA.
    Permite a los usuarios autenticarse ingresando su nombre de usuario
    y contraseña.

    Estructura:
    ------------
    - División principal en dos columnas:
        1. Lado izquierdo con el logo de la empresa.
        2. Lado derecho con el formulario de login.
    - Formulario de login con campos:
        - Usuario
        - Contraseña
    - Botón para enviar credenciales al servlet SvCliente mediante POST.

    Tecnologías y dependencias:
    ---------------------------
    - HTML5 y Bootstrap 5.3.7 para maquetación y estilos.
    - CSS propio desde styles/global.css.
    - Diseño responsive mediante media queries y clases de Bootstrap.
    
    Funcionamiento:
    ----------------
    1. La página se divide en dos columnas adaptables según tamaño de pantalla.
    2. El lado izquierdo muestra el logo de SISRENTA.
    3. El lado derecho contiene el formulario de login, que envía los datos al
       servlet SvCliente para validar credenciales.
    4. Bootstrap y media queries aseguran diseño responsive en móviles y tabletas.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/global.css">
</head>
<style>
    .image-side,
    .login-side {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
    }

    .img{
        min-width: 200px;
        max-width: 400px;
      }

    @media (max-width: 768px) {
      .image-side {
        margin-top: 30px;
        max-height: 30%;
      }
      .login-side {
        max-height: 70%;
      }

      .img{
        max-width: 100px;
      }


    }

</style>


<body>
    <div class="row flex-column flex-md-row h-100 gx-0" style="height: 100%;">
        <div class="col image-side">
            <img src="images/logo-sisrenta.png" alt="logo-sisrenta" class="img">
        </div>
        <div class="col login-side">
            <div class="card shadow p-4" style="width: 100%; max-width: 400px;">
                <h2 class="text-center mb-4">Iniciar Sesión</h2>
                <form action="${pageContext.request.contextPath}/pages/SvCliente" method="POST">
                    <div class="mb-3">
                        <label for="usuario" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" required />
                    </div>
                    <div class="mb-3">
                        <label for="contrasena" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" required />
                    </div>
                     <a href=""> <button class="btn btn-primary w-100" type="submit">Ingresar</button></a> 
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>
</body>

</html>