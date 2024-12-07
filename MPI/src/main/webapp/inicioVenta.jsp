<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="logica.Articulo" %>
<%@ page import="logica.Controladora" %>

<% 
    Controladora control = new Controladora();
    List<Articulo> productos= control.getArticulos();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Catálogo - Rehobot</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
            <li class="nav-item d-flex align-items-center">
                <a class="nav-link active me-2" href="#!">Catálogo</a>
                <button class="btn btn-outline-secondary btn-sm" onclick="window.location.href='index.html';">
                    Volver al inicio
                </button>
            </li>
        </ul>
        <div class="d-flex">
            <button class="btn btn-outline-primary me-2" type="button" data-bs-toggle="modal" data-bs-target="#loginModal">
                Iniciar sesión
            </button>
            <button class="btn btn-outline-success me-2" type="button" data-bs-toggle="modal" data-bs-target="#registerModal">
                Registrarse
            </button>
            <button class="btn btn-outline-dark" type="button" data-bs-toggle="modal" data-bs-target="#shoppingCartModal">
                <i class="bi-cart-fill me-1"></i>
                Carrito
                <span class="badge bg-dark text-white ms-1 rounded-pill" id="cart-count">0</span>
            </button>
        </div>
    </div>
</nav>

    <!-- Header -->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Catálogo</h1>
                <p class="lead fw-normal text-white-50 mb-0">Los mejores productos del mercado</p>
            </div>
        </div>
    </header>
    
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-3 justify-content-center">
                <!-- Inicio del bucle para generar productos dinámicamente -->
                <%
                   
                    if (productos != null && !productos.isEmpty()) {
                        for (Articulo producto : productos) {
                            double precioArticulo = producto.getPrecio_Articulo(); // Asegura que sea de tipo double
                %>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Imagen del producto -->
                        <img class="card-img-top" src="<%= producto.getLink_Imagen() %>" alt="<%= producto.getNombre_Articulo() %>" />
                        <!-- Detalles del producto -->
                        <div class="card-body p-4 text-center">
                            <h5 class="fw-bolder"><%= producto.getNombre_Articulo() %></h5>
                            <p>$<%= String.format("%,.0f", precioArticulo) %> CLP</p>
                        </div>
                        <!-- Acciones del producto -->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                            <button class="btn btn-outline-dark add-to-cart"
                                    data-name="<%= producto.getNombre_Articulo() %>"
                                    data-price="<%= precioArticulo %>"
                                    data-img="<%= producto.getLink_Imagen() %>">
                                Agregar al carrito
                            </button>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p class="text-center">No hay productos disponibles en este momento.</p>
                <%
                    }
                %>
            </div>
                </div>
                    <div class="modal fade" id="shoppingCartModal" tabindex="-1" aria-labelledby="shoppingCartModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg"> <!-- Aquí agregamos la clase modal-lg -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="shoppingCartModalLabel">Carrito de Compras</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <ul id="cart-items" class="list-unstyled">
                            <!-- Items del carrito -->
                        </ul>
                        <div class="text-end">
                            <h5>Total: $<span id="cart-total">0</span> CLP</h5>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-success" id="finalizePurchaseButton">Finalizar Compra</button>
                    </div>
                </div>
            </div>
        </div>
            <!-- Modal de Confirmación de Compra -->
        <div class="modal fade" id="transactionModal" tabindex="-1" aria-labelledby="transactionModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="transactionModalLabel">Confirmación de Compra</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h5>Transacción: <span id="transaction-id"></span></h5>
                        <p>Fecha y Hora: <span id="transaction-date-time"></span></p>
                        <ul id="transaction-items" class="list-unstyled">
                            <!-- Aquí se mostrarán los productos de la compra -->
                        </ul>
                        <div class="text-end">
                            <h5>Total: $<span id="transaction-total">0</span> CLP</h5>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeTransactionModal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Iniciar Sesión -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">Iniciar Sesión</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="SvLoginClient" method="POST">
                            <div class="mb-3">
                                <label for="loginEmail" class="form-label">Correo Electrónico</label>
                                <input type="text" name="mail" class="form-control" id="loginEmail" required>
                            </div>
                            <div class="mb-3">
                                <label for="loginPassword" class="form-label">Contraseña</label>
                                <input type="password" name="pass" class="form-control" id="loginPassword" required>
                            </div>
                            <input type="hidden" name="origen" value="inicioVenta" />
                            <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
            <!-- Modal de Éxito -->
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Registro Exitoso</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>¡Tu cuenta ha sido creada exitosamente! Ahora puedes iniciar sesión.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal de Registro -->

        <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registerModalLabel">Registrarse</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="SvCliente" method="POST" >
                            <div class="mb-3">
                                <label for="nombre_Persona" class="form-label">Nombre y Apellido</label>
                                <input type="text" name="nombre_Persona" class="form-control" id="nombre_Persona" required>
                            </div>
                            <div class="mb-3">
                                <label for="mail" class="form-label">Correo Electrónico</label>
                                <input type="email" name="mail" class="form-control" id="mail" required>
                            </div>
                            <div class="mb-3">
                                <label for="Contrasenia_Cliente" class="form-label">Contraseña</label>
                                <input type="password" name="Contrasenia_Cliente" class="form-control" id="Contrasenia_Cliente" required>
                            </div>
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="tel" name="telefono" class="form-control" id="telefono" required>
                            </div>
                            <div class="mb-3">
                                <label for="rut_Persona" class="form-label">RUT</label>
                                <input type="text" name="rut_Persona" class="form-control" id="rut_Persona" placeholder="Ej: 12345678-9" required>
                            </div>
                            <div class="mb-3">
                                <label for="direccion_cliente" class="form-label">Dirección</label>
                                <input type="text" name="direccion_cliente" class="form-control" id="direccion_cliente" required>
                            </div>
                            <input type="hidden" name="origen" value="inicioVenta" />
                            <button type="submit" class="btn btn-success w-100">Registrarse</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <script>
        let cart = [];
        let total = 0;

        $(".add-to-cart").on("click", function () {
            const name = $(this).data("name");
            const price = parseFloat($(this).data("price"));
            const img = $(this).data("img");

            const product = cart.find(item => item.name === name);
            if (product) {
                product.quantity += 1;
            } else {
                cart.push({ name, price, img, quantity: 1 });
            }

            total += price;
            renderCart();
        });

        function renderCart() {
            const $cartItems = $("#cart-items");
            if ($cartItems.length === 0) {
                console.error("El contenedor #cart-items no existe en el DOM.");
                return;
            }

            $cartItems.empty();

            cart.forEach((item, index) => {
                // Aseguramos que los datos existen y son válidos antes de renderizar
                const formattedPrice = (item.price * item.quantity).toLocaleString("es-CL");
                const productHTML = `
                    <li class="d-flex justify-content-between align-items-center border-bottom pb-2">
                        <div>
                            <img src="${item.img}" alt="${item.name}" width="50" class="me-2">
                            <span>${item.name}</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <input type="number" min="1" value="${item.quantity}" 
                                class="form-control form-control-sm me-2 quantity-input" 
                                data-index="${index}">
                            <span>$${formattedPrice} CLP</span>
                            <button class="btn btn-sm btn-danger ms-2 remove-item" data-index="${index}">Remover</button>
                        </div>
                    </li>
                `;
                $cartItems.append(productHTML);
            });
        }


            $("#cart-count").text(cart.reduce((sum, item) => sum + item.quantity, 0));
            $("#cart-total").text(total.toLocaleString("es-CL"));

            $(".quantity-input").on("input", function () {
                const index = $(this).data("index");
                let newQuantity = parseInt($(this).val());

                if (isNaN(newQuantity) || newQuantity < 1) {
                    $(this).val(1);
                    newQuantity = 1;
                }

                const item = cart[index];
                total += (newQuantity - item.quantity) * item.price;
                item.quantity = newQuantity;

                renderCart();
            });

            $(".remove-item").on("click", function () {
                const index = $(this).data("index");
                const item = cart[index];
                total -= item.price * item.quantity;
                cart.splice(index, 1);

                renderCart();
            });
        }
    </script>
</body>
</html>
