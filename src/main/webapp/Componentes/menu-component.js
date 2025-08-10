class MenuComponent extends HTMLElement {
  connectedCallback() {
    this.innerHTML = `
          <style>
        .sidebar {
            height: 100%;
            min-width: 120px;
            background-color: var(--color-primario);
            padding: 10px;
        }

        #sidebarCollapse.collapsing{
            transition: none !important;
            height: auto !important;
        }

        .navbar,
        .nav {
            justify-content: center;
        }

        .hamburger {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: white;
            padding-top: 10px;
        }

        .right-side{
            background-color: white;
            padding: 10px;
        }

    </style>

    <div class="wrapper">
        <div class="row gx-0" style="height: 100%;">
            <div class="sidebar collapse show col-1" id="sidebarCollapse">
                <!--Toggle -->
                <div class="navbar row gx-0">
                   
                    <!--Nav-->
                    <div class="nav">
                        <div class="sidebar-heading mb-3">Navegacion</div>

                        <ul class="list-unstyled">
                            <!--Customers-->
                            <li class="mb-1">
                                <button class="btn btn-toggle d-inline-flex align-items-center"
                                    data-bs-toggle="collapse" data-bs-target="#customersMenu" aria-expanded="false"
                                    aria-controls="customersMenu">
                                    <img src="https://img.icons8.com/?size=100&id=22396&format=png&color=000000"
                                        alt="Clientes" width="30">
                                    Clientes
                                </button>
                                <!--Collapsed List-->
                                <ul class="collapse " id="customersMenu">
                                    <li><a href="#"
                                            class="link-body-emphasis d-inline-flex text-decoration-none rounded mb-1">Crear
                                            Cliente</a></li>
                                    <li><a href="#"
                                            class="link-body-emphasis d-inline-flex text-decoration-none rounded mb-1">Buscar
                                            Cliente</a></li>
                                </ul>
                            </li>

                            <!--Notification System-->
                            <li class="mb-1">
                                <button class="btn btn-toggle" data-bs-toggle="collapse"
                                    data-bs-target="#alertCollapsed" aria-expanded="true"
                                    aria-controls="alertCollapsed">
                                    <img src="https://img.icons8.com/?size=100&id=40401&format=png&color=000000"
                                        alt="Notificaciones" width="24">
                                    Alertas</button>
                                <ul class="collapse" id="alertCollapsed">
                                    <li><a href="#"
                                            class="link-body-emphasis d-inline-flex text-decoration-none rounded mb-1">Alertas
                                            de Preparacion</a></li>
                                    <li><a href="#"
                                            class="link-body-emphasis d-inline-flex text-decoration-none rounded mb-1">Alertas
                                            de Entrega</a> </li>
                                    <li><a href="#"
                                            class="link-body-emphasis d-inline-flex text-decoration-none rounded mb-1">Alertas
                                            de Devolucion</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right-side col">
                <div class="top-menu">
                    <button class="hamburger btn btn-toggle" data-bs-target="#sidebarCollapse" data-bs-toggle="collapse" aria-controls="sidebarCollapse" aria-expanded="true"  ><img
                        src="https://img.icons8.com/?size=100&id=8113&format=png&color=000000" alt="toggle"
                        width="30"></button>
                </div>
                 </div>
        </div>
    </div>
    <



                <!--Continua en el content-component-->

    `;
  }
}

customElements.define('menu-component', MenuComponent);
