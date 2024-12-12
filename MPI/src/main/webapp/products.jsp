<%@page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<%
    HttpSession sesion = request.getSession(false); // Obtiene la sesión si existe
    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;

    if (userName == null) {
        response.sendRedirect("inicioInventario.jsp"); // Redirige al login si no hay sesión
    }
    
    String mensaje = (String) request.getAttribute("mensaje");
    String error = (String) request.getAttribute("error");
    
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Products</title>
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
        <link rel="stylesheet" href="css/sweetalert2.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>   
        .pageContent {
            background-color: #ffc683; /* Color de fondo anaranjado */
        }
        </style>
        <script>
        document.addEventListener("DOMContentLoaded", () => {
            <% if (mensaje != null) { %>
            Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: '<%= mensaje %>',
                confirmButtonColor: '#3085d6'
            });
            <% } %>
            <% if (error != null) { %>
            Swal.fire({
                icon: 'error',
                title: '¡Error!',
                text: '<%= error %>',
                confirmButtonColor: '#d33'
            });
            <% } %>
        });
        
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
					Agregue los detalles del producto
				</p>
			</div>
		</section>
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__panel is-active" id="tabNewProduct">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--12-col">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo Producto
							</div>
							<div class="full-width panel-content">
                                                            <form action="SvArticulo" method="POST" enctype="multipart/form-data">
                                                                <div class="mdl-grid">
                                                                    <div class="mdl-cell mdl-cell--12-col">
                                                                        <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i> &nbsp; INFORMACIÓN BÁSICA</legend><br>
                                                                    </div>

                                                                    <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" type="text" id="nombre_Articulo" name="nombre_Articulo" required>
                                                                            <label class="mdl-textfield__label" for="nombre_Articulo">Nombre del Artículo</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <select class="mdl-textfield__input" id="categoria_Articulo" name="categoria_Articulo" required>
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
                                                                            <input class="mdl-textfield__input" type="number" id="precio_Articulo" name="precio_Articulo" required>
                                                                            <label class="mdl-textfield__label" for="precio_Articulo">Precio</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" type="number" id="stock" name="stock" required>
                                                                            <label class="mdl-textfield__label" for="stock">Stock</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" type="text" id="marca_Articulo" name="marca_Articulo" required>
                                                                            <label class="mdl-textfield__label" for="marca_Articulo">Marca</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" type="date" id="fechaVencimiento" name="fechaVencimiento" required>
                                                                            <label class="mdl-textfield__label" for="fechaVencimiento"></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mdl-cell mdl-cell--12-col">
                                                                        <label for="imagen_Articulo">Cargar Imagen</label>
                                                                        <input type="file" id="imagen_Articulo" name="imagen_Articulo" accept="image/*" required>
                                                                    </div>
                                                                </div>
                                                                <p class="text-center">
                                                                    <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addProduct">
                                                                        <i class="zmdi zmdi-plus"></i>
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
