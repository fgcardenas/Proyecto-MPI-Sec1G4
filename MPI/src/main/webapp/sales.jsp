<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="logica.Controladora" %>
<%@ page import="logica.Compra" %>

<%
    HttpSession sesion = request.getSession(false); // Obtiene la sesión si existe
    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;

    if (userName == null) {
        response.sendRedirect("inicioInventario.jsp"); // Redirige al login si no hay sesión
    }
    
    Controladora control = new Controladora();
    
    List<Compra> compras = new ArrayList<>();
    compras = control.getCompras(); // Obtiene la lista de compras
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Sales</title>
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

	<!-- Estilo y script para el Modal -->
	<style>
		.modal {
			display: none;
			position: fixed;
			z-index: 1;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.5);
			overflow: auto;
		}
		.modal-content {
			background-color: #fefefe;
			margin: 15% auto;
			padding: 20px;
			border: 1px solid #888;
			width: 80%;
			max-width: 800px;
		}
		.close {
			color: #aaa;
			font-size: 28px;
			font-weight: bold;
			float: right;
		}
		.close:hover,
		.close:focus {
			color: black;
			text-decoration: none;
			cursor: pointer;
		}
	</style>
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
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>
			<div class="full-width header-well-text">
				<p class="text-condensedLight">
					Registro de ventas realizadas recientemente
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
								<th class="mdl-data-table__cell--non-numeric">ID Compra</th>
								<th>Fecha y Hora</th>
								<th>Vendedor</th>
								<th>Cliente</th>
								<th>Teléfono</th>
								<th>Dirección</th>
								<th>Método de Pago</th>
								<th>Total</th>
								<th>Opciones</th>
							</tr>
						</thead>
						<tbody>
							<% for (Compra compra : compras) { %>
								<tr>
									<td class="mdl-data-table__cell--non-numeric"><%= compra.getId_Compra() %></td>
									<td><%= compra.getFecha() %></td>
									<td><%= compra.getVendedor() %></td>
									<td><%= compra.getCliente() %></td>
									<td><%= compra.getPhoneClient() %></td>
									<td><%= compra.getDireccionEnvio() %></td>
									<td><%= compra.getMetodoPago() %></td>
									<td>$<%= compra.getMontoTotal() %></td>
									<td>
										<!-- Botón "Ver Detalles" -->
										<button class="mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect" onclick="showModal('<%= compra.getId_Compra() %>', '<%= compra.getArticulos() %>')">
											Ver detalles
										</button>
									</td>
								</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>Detalles de la Compra</h2>
			<div id="detalle-articulos"></div>
		</div>
	</div>

	<!-- Script para mostrar el modal -->
	<script>
		// Función para mostrar el modal con los detalles de los artículos
		function showModal(idCompra, articulos) {
			// Muestra el contenido de los artículos en el modal
			document.getElementById("detalle-articulos").innerHTML = "ID Compra: " + idCompra + "<br><br>" + articulos;
			document.getElementById("myModal").style.display = "block"; // Muestra el modal
		}

		// Función para cerrar el modal
		function closeModal() {
			document.getElementById("myModal").style.display = "none"; // Cierra el modal
		}

		// Cuando el usuario haga clic fuera del modal, lo cierra
		window.onclick = function(event) {
			var modal = document.getElementById("myModal");
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>

