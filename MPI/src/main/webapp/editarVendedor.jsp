<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="logica.Empleado" %>  <!-- Importamos la clase Vendedor -->
<%@ page import="java.util.List" %>
<%@ page import="logica.Controladora" %>

<%
    HttpSession sesion = request.getSession(false); // Obtiene la sesión si existe
    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;

    if (userName == null) {
        response.sendRedirect("inicioInventario.jsp"); // Redirige al login si no hay sesión
    }
    Controladora control = new Controladora();
%>

<%
    String vendedorId = request.getParameter("idEmpleado");  // Cambiado a vendedorId
    
    // Validación
    Empleado vendedor = control.obtenerVendedor(Integer.parseInt(vendedorId));  // Cambiado a traerVendedor
   
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Vendedores</title>
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
                <i class="zmdi zmdi-account-circle"></i>
            </div>
            <div class="full-width header-well-text">
                <p class="text-condensedLight">
                    Edita los detalles del vendedor
                </p>
            </div>
        </section>
        <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
            <div class="mdl-tabs__tab-bar">
                <a href="#tabEditVendedor" class="mdl-tabs__tab is-active">EDITAR</a>
            </div>
            <div class="mdl-tabs__panel is-active" id="tabEditVendedor">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="full-width panel mdl-shadow--2dp">
                            <div class="full-width panel-tittle bg-primary text-center tittles">
                                Editar Vendedor
                            </div>
                            <div class="full-width panel-content">
                                <form action="SvEditarVendedor" method="POST"> <!-- Cambiado a SvEditarVendedor -->
                                    <input type="hidden" name="id_Vendedor" value="<%= vendedor.getId_Persona() %>">
                                    <div class="mdl-grid">
                                        <div class="mdl-cell mdl-cell--12-col">
                                            <legend class="text-condensedLight">
                                                <i class="zmdi zmdi-border-color"></i> &nbsp; INFORMACIÓN BÁSICA
                                            </legend><br>
                                        </div>
                                        <!-- Nombre del Vendedor (No Editable) -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <label>Nombre:</label>
                                            <p><%= vendedor.getNombre_Persona() %></p>
                                        </div>
                                        <!-- RUT del Vendedor (No Editable) -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <label>RUT:</label>
                                            <p><%= vendedor.getRut_Persona() %></p>
                                        </div>
                                        <!-- Correo Electrónico -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="email" id="mail" name="mail" value="<%= vendedor.getMail() %>" required>
                                                <label class="mdl-textfield__label" for="mail">Correo Electrónico</label>
                                            </div>
                                        </div>
                                        <!-- Dirección -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="direccion" name="direccion" value="<%= vendedor.getDireccion() %>" required>
                                                <label class="mdl-textfield__label" for="direccion">Dirección</label>
                                            </div>
                                        </div>
                                        <!-- Teléfono -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="telefono" name="telefono" value="<%= vendedor.getTelefono() %>" required>
                                                <label class="mdl-textfield__label" for="telefono">Teléfono</label>
                                            </div>
                                        </div>
                                        <!-- Contraseña -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="password" id="password" name="password" value="<%= vendedor.getContrasenia() %>" required>
                                                <label class="mdl-textfield__label" for="password">Contraseña</label>
                                            </div>
                                        </div>
                                                <!-- Sueldo -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="sueldo" name="sueldo" value="<%= vendedor.getSueldo_Empleado() %>" required>
                                                <label class="mdl-textfield__label" for="sueldo">Sueldo</label>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-center">
                                        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-editVendedor">
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
