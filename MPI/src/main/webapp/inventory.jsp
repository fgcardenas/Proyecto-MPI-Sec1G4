<%@ page import="logica.Articulo" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="logica.Controladora" %>

<%
    // Obtener la sesión actual
    HttpSession sesion = request.getSession(false);
    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;

    // Redirigir si no hay sesión
    if (userName == null) {
        response.sendRedirect("inicioInventario.jsp");
        return;
    }
    
    Controladora control = new Controladora();

    // Asegúrate de que `SvMostrarProductos` cargue los productos
    List<Articulo> productos = control.getArticulos();
    

    if (productos == null) {
        // Redirigir al servlet para cargar datos
        response.sendRedirect("SvMostrarProductos");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inventory</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/sweetalert2.css">
    <link rel="stylesheet" href="css/material.min.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="js/material.min.js"></script>
    <script src="js/sweetalert2.min.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
    <!-- navLateral -->
    <%@ include file="component/lateralBar.jsp" %>
    <!-- pageContent -->
    <section class="full-width pageContent">
        <!-- navBar -->
        <%@ include file="component/navBarLogOut.jsp" %>
        <section class="full-width header-well">
            <div class="full-width header-well-icon">
                <i class="zmdi zmdi-store"></i>
            </div>
            <div class="full-width header-well-text">
                <p class="text-condensedLight">
                    Lista de productos actuales en exhibición de la página
                </p>
            </div>
        </section>
        <div class="full-width divider-menu-h"></div>

        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
                <div class="table-responsive">
                    <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                        <thead>
                            <tr>
                                <th class="mdl-data-table__cell--non-numeric">Nombre</th>
                                <th>Categoría</th>
                                <th>Stock</th>
                                <th>Precio</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            if (productos != null && !productos.isEmpty()) {
                                for (Articulo producto : productos) {
                            %>
                            <tr>
                                <td class="mdl-data-table__cell--non-numeric"><%= producto.getNombre_Articulo() %></td>
                                <td><%= producto.getCatergoria_Articulo() %></td>
                                <td><%= producto.getStock() %></td>
                                <td>$<%= producto.getPrecio_Articulo() %></td>
                                <td>
                                    <div class="options-container">
                                        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect" onclick="toggleOptionsMenu(event)">
                                            <i class="zmdi zmdi-more"></i>
                                        </button>
                                        <div class="options-menu">
                                            <button onclick="editProduct('<%= producto.getId_Articulo() %>')">Editar Producto</button>
                                            <button onclick="deleteProduct('<%= producto.getId_Articulo() %>')">Eliminar Producto</button>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5">No hay productos disponibles</td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
        <form id="deleteForm" method="get" action="SvEliminarProducto">
            <input type="hidden" name="id" id="productId">
        </form>
        <form id="editForm" method="get" action="editarProducto.jsp">
            <input type="hidden" name="id" id="editProductId">
        </form>

        
    <script>
        function toggleOptionsMenu(event) {
            // Previene que el clic cierre el menú al abrirlo
            event.stopPropagation();

            const container = event.target.closest('.options-container');
            const isActive = container.classList.contains('active');

            // Cierra otros menús abiertos
            document.querySelectorAll('.options-container.active').forEach(el => el.classList.remove('active'));

            // Activa o desactiva el menú actual
            if (!isActive) {
                container.classList.add('active');
                // Detecta clic fuera del menú para cerrarlo
                document.addEventListener('click', () => {
                    container.classList.remove('active');
                }, { once: true });
            }
        }

        function editProduct(productId) {
            // Almacena el ID del producto en un input oculto del formulario
            document.getElementById('editProductId').value = productId;
            // Enviar el formulario para redirigir a editarProducto.jsp
            document.getElementById('editForm').submit();
        }



        
        function deleteProduct(productId) {
            console.log('ID del producto:', productId); // Verificar el ID
            if (confirm('¿Estás seguro de que deseas eliminar este producto?')) {
                document.getElementById('productId').value = productId;
                document.getElementById('deleteForm').submit();  // Enviar el formulario
            }
        }
    </script>
    
    <style>
        .options-container {
            position: relative;
            display: inline-block;
        }

        .options-menu {
            position: absolute;
            top: 35px;
            right: 0;
            display: none;
            background: #ffffff;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            z-index: 10;
            min-width: 120px;
        }

        .options-menu button {
            display: block;
            padding: 8px 16px;
            width: 100%;
            background: none;
            border: none;
            text-align: left;
            cursor: pointer;
            font-size: 14px;
        }

        .options-menu button:hover {
            background-color: #f1f1f1;
        }

        .options-container.active .options-menu {
            display: block;
        }
    </style>                        
</body>
</html>

