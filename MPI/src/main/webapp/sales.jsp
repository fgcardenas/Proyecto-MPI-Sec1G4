<%@page import="java.time.LocalDate"%>
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

    // Obtener valores de los filtros
    String filtroVendedor = request.getParameter("vendedor");
    String filtroPrecioMin = request.getParameter("precioMin");
    String filtroPrecioMax = request.getParameter("precioMax");
    String filtroFechaInicio = request.getParameter("fechaInicio");
    String filtroFechaFin = request.getParameter("fechaFin");
    String filtroPago = request.getParameter("methodPay");
    
    // Filtrar las compras según los parámetros
    List<Compra> comprasFiltradas = new ArrayList<>();
    for (Compra compra : compras) {
        boolean coincide = true;

        // Filtrar por vendedor
        if (filtroVendedor != null && !filtroVendedor.isEmpty()) {
            coincide = coincide && compra.getVendedor().toLowerCase().contains(filtroVendedor.toLowerCase());
        }

        // Filtrar por precio
        if (filtroPrecioMin != null && !filtroPrecioMin.isEmpty()) {
            double precioMin = Double.parseDouble(filtroPrecioMin);
            coincide = coincide && compra.getMontoTotal() >= precioMin;
        }
        if (filtroPrecioMax != null && !filtroPrecioMax.isEmpty()) {
            double precioMax = Double.parseDouble(filtroPrecioMax);
            coincide = coincide && compra.getMontoTotal() <= precioMax;
        }

        // Filtrar por fecha
        if (filtroFechaInicio != null && !filtroFechaInicio.isEmpty()) {
            String[] fecja = compra.getFecha().split(",");
            String fecjaStr = fecja[0];
            coincide = coincide && control.comprobarFecha(filtroFechaInicio,fecjaStr);
        }
        if (filtroFechaFin != null && !filtroFechaFin.isEmpty()) {
            String[] fecha = compra.getFecha().split(",");
            String fechaStr = fecha[0];
            coincide = coincide && control.comprobarFecha(fechaStr, filtroFechaFin);
        }
        if (filtroPago != null && !filtroPago.isEmpty()){
            coincide = coincide && compra.getMetodoPago().equals(filtroPago);
        }

        if (coincide) {
            comprasFiltradas.add(compra);
        }
    }
    
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
        <script>
            history.pushState(null, '', window.location.href);
            window.onpopstate = function() {
                history.pushState(null, '', window.location.href);
            };
        </script>
        <style>   
            .pageContent {
                background-color: #ffc683; /* Color de fondo anaranjado */
            }

            .details-container {
                position: relative;
            }
            .details-preview {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .toggle-details-btn {
                background: none;
                border: none;
                color: #3f51b5;
                cursor: pointer;
                text-decoration: underline;
                padding: 0;
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
                            <form action="sales.jsp" method="GET" style="display: grid; grid-template-columns: repeat(5, 1fr); gap: 10px; align-items: center; max-width: 100%; margin: auto;">
                                <!-- Campo para Vendedor -->
                                <div style="grid-column: span 1;">
                                    <label for="vendedor" style="display: block; font-size: 10px;">Vendedor:</label>
                                    <input type="text" id="vendedor" name="vendedor" placeholder="Nombre usuario Vendedor" style="width: 100%; height: 24px; font-size: 10px;">
                                </div>
                                <!-- Precio Mínimo -->
                                <div>
                                    <label for="precioMin" style="display: block; font-size: 10px;">Precio mínimo:</label>
                                    <input type="number" id="precioMin" name="precioMin" placeholder="0" step="0.01" style="width: 100%; height: 24px; font-size: 10px;">
                                </div>
                                <!-- Precio Máximo -->
                                <div>
                                    <label for="precioMax" style="display: block; font-size: 10px;">Precio máximo:</label>
                                    <input type="number" id="precioMax" name="precioMax" placeholder="10000" step="0.01" style="width: 100%; height: 24px; font-size: 10px;">
                                </div>
                                <!-- Fecha Inicio -->
                                <div>
                                    <label for="fechaInicio" style="display: block; font-size: 10px;">Fecha inicio:</label>
                                    <input type="date" id="fechaInicio" name="fechaInicio" style="width: 100%; height: 24px; font-size: 10px;">
                                </div>
                                <!-- Fecha Fin -->
                                <div>
                                    <label for="fechaFin" style="display: block; font-size: 10px;">Fecha fin:</label>
                                    <input type="date" id="fechaFin" name="fechaFin" style="width: 100%; height: 24px; font-size: 10px;">
                                </div>
                                <!-- Método de Pago -->
                                <div style="grid-column: span 1;">
                                    <label for="methodPay" style="display: block; font-size: 10px;">Método Pago:</label>
                                    <select class="mdl-textfield__input" id="methodPay" name="methodPay">
                                            <option value="" disabled selected>Selecciona una categoría</option>
                                            <option value="Efectivo">Efectivo</option>
                                            <option value="Tarjeta">Tarjeta</option>
                                            <option value="Transferencia">Transferencia</option>
                                    </select>                              
                                </div>
                                                                <!-- Botón Filtrar -->
                                <div style="text-align: center;">
                                    <button type="submit" style="padding: 8px 16px; font-size: 12px; background-color: #ff9800; color: #fff; border: none; border-radius: 4px; cursor: pointer;">
                                        Filtrar
                                    </button>
                                </div>
                            </form>
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
                                <th>Detalles Compra</th>
                                <th>Método de Pago</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Compra compra : comprasFiltradas) { %>
                                <tr>
                                    <td class="mdl-data-table__cell--non-numeric" style="vertical-align: top;"><%= compra.getId_Compra() %></td>
                                    <td style="vertical-align: top;"><%= compra.getFecha() %></td>
                                    <td style="vertical-align: top;"><%= compra.getVendedor() %></td>
                                    <td style="vertical-align: top;"><%= compra.getCliente() %></td>
                                    <td style="vertical-align: top;"><%= compra.getPhoneClient() %></td>
                                    <td style="vertical-align: top;"><%= compra.getDireccionEnvio() %></td>
                                    <td style="vertical-align: top;">
                                        <div class="details-container">
                                            <div class="details-preview">
                                                <%= compra.getArticulos().length() > 50 
                                                    ? compra.getArticulos().substring(0, 50) + "..." 
                                                    : compra.getArticulos() %>
                                            </div>
                                            <div class="details-full" style="display: none;">
                                                <%= compra.getArticulos().replace("\n", "<br>") %>
                                            </div>
                                            <% if (compra.getArticulos().length() > 50) { %>
                                                <button class="toggle-details-btn">Mostrar más</button>
                                            <% } %>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top;"><%= compra.getMetodoPago() %></td>
                                    <td style="vertical-align: top;">$<%= compra.getMontoTotal() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
	</section>
    <script>
        // JavaScript para manejar la expansión y contracción de los detalles
        document.addEventListener('DOMContentLoaded', function() {
            const buttons = document.querySelectorAll('.toggle-details-btn');
            buttons.forEach(button => {
                button.addEventListener('click', function() {
                    const container = this.parentElement;
                    const preview = container.querySelector('.details-preview');
                    const fullDetails = container.querySelector('.details-full');

                    if (fullDetails.style.display === 'none') {
                        fullDetails.style.display = 'block';
                        preview.style.display = 'none';
                        this.textContent = 'Mostrar menos';
                    } else {
                        fullDetails.style.display = 'none';
                        preview.style.display = 'block';
                        this.textContent = 'Mostrar más';
                    }
                });
            });
        });
    </script>
    
</body>
</html>

