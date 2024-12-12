<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="logica.Articulo" %>
<%@ page import="logica.Controladora" %>

<%
    HttpSession sesion = request.getSession(false); // Obtiene la sesión si existe
    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;

    if (userName == null) {
        response.sendRedirect("inicioInventario.jsp"); // Redirige al login si no hay sesión
    }

    // Obtiene el ID del producto desde los parámetros de la URL
    String idProducto = request.getParameter("id");
    Controladora control = new Controladora();
    Articulo producto = null;

    if (idProducto != null) {
        try {
            // Obtiene el producto a editar desde la base de datos
            producto = control.obtenerArticulo(Integer.parseInt(idProducto));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Producto no encontrado.");
        }
    } else response.sendRedirect("inventory.jsp");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Editar Producto</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/sweetalert2.css">
    <link rel="stylesheet" href="css/material.min.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="js/material.min.js" ></script>
    <script src="js/sweetalert2.min.js" ></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
    <script src="js/main.js" ></script>
    <style>   
        .pageContent {
            background-color: #ffc683; /* Color de fondo anaranjado */
        }
    </style>
    <script>
            history.pushState(null, '', window.location.href);
            window.onpopstate = function() {
                history.pushState(null, '', window.location.href);
            };
    </script>
</head>
<body>
    <!-- navLateral -->
    <%@include file="component/lateralBar.jsp" %>
    <!-- pageContent -->
    <section class="full-width pageContent">
        <!-- navBar -->
        <%@include file="component/navBarLogOut.jsp" %>
        <section class="full-width header-well">
            <div class="full-width header-well-icon">
                <i class="zmdi zmdi-washing-machine"></i>
            </div>
            <div class="full-width header-well-text">
                <p class="text-condensedLight">
                    Edita los detalles del producto
                </p>
            </div>
        </section>
        <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
            <div class="mdl-tabs__tab-bar">
                <a href="#tabEditProduct" class="mdl-tabs__tab is-active">EDITAR</a>
            </div>
            <div class="mdl-tabs__panel is-active" id="tabEditProduct">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="full-width panel mdl-shadow--2dp">
                            <div class="full-width panel-tittle bg-primary text-center tittles">
                                Editar Producto
                            </div>
                            <div class="full-width panel-content">
                                <form action="SvEditarProducto" method="POST">
                                    <input type="hidden" name="id_Articulo" value="<%= producto.getId_Articulo() %>">
                                    <div class="mdl-grid">
                                        <div class="mdl-cell mdl-cell--12-col">
                                            <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i> &nbsp; INFORMACIÓN BÁSICA</legend><br>
                                        </div>
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="nombre_Articulo" name="nombre_Articulo" value="<%= producto.getNombre_Articulo()%>" required>
                                                <label class="mdl-textfield__label" for="nombre_Articulo">Nombre del Artículo</label>
                                            </div>
                                        </div>
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <select class="mdl-textfield__input" id="categoria_Articulo" name="categoria_Articulo" >
                                                          <option value="" disabled selected></option>
                                                          <option value="Harinas">Harinas</option>
                                                          <option value="Quesos">Quesos</option>
                                                          <option value="Aditivos Pastelería">Aditivos Pastelería</option>
                                                          <option value="Mantecas y Grasas">Mantecas y Grasas</option>
                                                          <option value="Levaduras">Levaduras</option>
                                                     </select>
                                                 <label class="mdl-textfield__label" for="categoria_Articulo">Categoría</label>
                                            </div>
                                        </div>
                                        <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="number" id="precio_Articulo" name="precio_Articulo" value="<%= producto.getPrecio_Articulo()%>" required>
                                                <label class="mdl-textfield__label" for="precio_Articulo">Precio</label>
                                            </div>
                                        </div>
                                        <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="number" id="stock" name="stock" value="<%= producto.getStock() %>" required>
                                                <label class="mdl-textfield__label" for="stock">Stock</label>
                                            </div>
                                        </div>
                                        <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="marca_Articulo" name="marca_Articulo" value="<%=  producto.getMarca_Articulo()%>" required>
                                                <label class="mdl-textfield__label" for="marca_Articulo">Marca</label>
                                            </div>
                                        </div>
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="date" id="fechaVencimiento" name="fechaVencimiento" value="<%= producto.getFechaVencimiento() %>">
                                                <label class="mdl-textfield__label" for="fechaVencimiento">Fecha de Vencimiento</label>
                                            </div>
                                        </div>
                                        <div class="mdl-cell mdl-cell--12-col">
                                            <label for="imagen_Articulo">Cargar Imagen</label>
                                            <input type="file" id="imagen_Articulo" name="imagen_Articulo" accept="image/*">
                                        </div>
                                    </div>
                                    <p class="text-center">
                                        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-editProduct">
                                            <i class="zmdi zmdi-edit"></i>
                                        </button>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
