<%-- 
    Document   : CrearCliente
    Created on : Aug 8, 2025, 8:03:20 PM
    Author     : sanavi


    Descripción:
    ------------
    Página de contenido para la sección de "Crear Cliente" del sistema SISRENTA.
    Permite al usuario ingresar los datos de un cliente nuevo y registrarlo en la base de datos.

    Funcionalidad:
    ---------------
    - Contiene un formulario que envía los datos del cliente al servlet SvCrearCliente.
    - Campos del formulario:
        - Nombre
        - Apellidos
        - Número de celular
        - Dirección
    - Al enviar el formulario:
        - Se ejecuta la lógica para crear un nuevo cliente en la base de datos.
        - Se redirige a la página de búsqueda de cliente (BuscarCliente.html) después del registro.

    Estructura:
    -----------
    - Contenedor principal (.right-side) con barra superior y contenido principal.
    - Barra superior (.top-menu) con botón de menú y título "SISRENTA".
    - Contenido principal (.main-content) con:
        - Título de la sección "Crear Cliente".
        - Tarjeta (.card) que contiene el formulario de registro.
        - Botón para enviar los datos y crear el cliente.

    Tecnologías y dependencias:
    ---------------------------
    - JSP estándar para renderizar la página.
    - CSS inline para estilos específicos.
    - Bootstrap 5 para diseño y componentes visuales (cards, botones, grids, formularios).
    - Formulario HTML que envía datos al servlet SvCrearCliente mediante POST.
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

    .formulario-container{
        display: flex;
        justify-content: center;
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
        <h1 style="margin-bottom: 20px;">Crear Cliente</h1>
        <div class="formulario-container">
            <div class="card shadow p-3" style="width: 70%; min-width: 250px;">
                <form action="${pageContext.request.contextPath}/pages/SvCrearCliente" method="POST">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required />
                    <label for="apellido" class="form-label">Apellidos:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" required>
                    <label for="celular" class="form-label"># de Celular:</label>
                    <input type="number" class="form-control" id="celular" name="celular" required placeholder="321 XXX XXXX">
                    <label for="direccion" class="form-label">Direccion:</label>
                    <input type="text" name="direccion" id="direccion" class="form-control" required>
                    <div style="display: flex; justify-content: center;">  
                        <a href="""><button class="btn btn-primary">Crear Cliente</button></a>
                </form>
            </div>
        </div>
    </div>
</div>