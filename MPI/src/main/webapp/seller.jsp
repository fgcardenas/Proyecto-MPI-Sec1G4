<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="logica.Controladora" %>

<%
    HttpSession sesion = request.getSession(false); // Obtiene la sesión si existe
    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;

    if (userName == null) {
        response.sendRedirect("inicioInventario.jsp"); // Redirige al login si no hay sesión
    }
    
    Controladora control = new Controladora();
    // Mensajes de error o éxito enviados desde el servlet
    String mensaje = (String) request.getAttribute("mensaje");
    String error = (String) request.getAttribute("error");
    
    List<Empleado> emp = control.traerEmpleados();
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
	<script>
            document.addEventListener("DOMContentLoaded", () => {
                const tabList = document.getElementById("tabListSeller");
                const tabNew = document.getElementById("tabNewSeller");
                const form = document.querySelector("form");
                const campos = document.querySelectorAll("[required]");

                // Mostrar pestaña activa según la URL
                if (window.location.hash === "#tabListSeller") {
                    tabList.classList.add("is-active");
                    tabNew.classList.remove("is-active");
                } else {
                    tabNew.classList.add("is-active");
                    tabList.classList.remove("is-active");
                }

                // Limpiar errores de validación
                campos.forEach(campo => {
                    campo.classList.remove("is-invalid");
                    campo.addEventListener("input", () => campo.setCustomValidity(""));
                });

                // Resetear el formulario al enviarlo
                form.addEventListener("submit", (event) => {
                    setTimeout(() => {
                        form.reset(); // Restablecer valores
                        campos.forEach(campo => campo.classList.remove("is-invalid")); // Quitar estilos
                    }, 0);
                });

                // Control de cambio de pestañas manualmente
                document.querySelector(".mdl-tabs__tab-bar").addEventListener("click", (event) => {
                    if (event.target.href && event.target.href.includes("#tabListSeller")) {
                        tabList.classList.add("is-active");
                        tabNew.classList.remove("is-active");
                    } else if (event.target.href && event.target.href.includes("#tabNewSeller")) {
                        tabNew.classList.add("is-active");
                        tabList.classList.remove("is-active");
                    }
                });
            });
        </script>
        <!-- Meta y estilos existentes -->
    <link rel="stylesheet" href="css/sweetalert2.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
				<i class="zmdi zmdi-accounts"></i>
			</div>
			<div class="full-width header-well-text">
				<p class="text-condensedLight">
					Ingrese datos de Vendedor para ingresarlos manualmente al sistema
				</p>
			</div>
		</section>
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<form action="SvVendedor" method="POST">
                            <div class="mdl-grid">
                                <div class="mdl-cell mdl-cell--12-col">
                                    <legend class="text-condensedLight">
                                        <i class="zmdi zmdi-border-color"></i> &nbsp; DATOS VENDEDOR
                                    </legend><br>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" name="rut_Vendedor" id="rut_Vendedor" 
                                               value="<%= request.getAttribute("rut_Vendedor") != null ? request.getAttribute("rut_Vendedor") : "" %>">
                                        <label class="mdl-textfield__label" for="rut_Vendedor">Rut</label>
                                        <span class="mdl-textfield__error">Número inválido</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" name="nombre_Vendedor" id="nombre_Vendedor" 
                                            value="<%= request.getAttribute("nombre_Vendedor") != null ? request.getAttribute("nombre_Vendedor") : "" %>" 
                                            >
                                        <label class="mdl-textfield__label" for="nombre_Vendedor">Nombre</label>
                                        <span class="mdl-textfield__error">Nombre inválido</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" name="apellido_Vendedor" id="apellido_Vendedor" 
                                               value="<%= request.getAttribute("apellido_Vendedor") != null ? request.getAttribute("apellido_Vendedor") : ""%>">
                                        <label class="mdl-textfield__label" for="apellido_Vendedor">Apellido</label>
                                        <span class="mdl-textfield__error">Apellido inválido</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="tel" name="telefono_Vendedor" id="telefono_Vendedor" 
                                               value="<%= request.getAttribute("telefono_Vendedor") != null ? request.getAttribute("telefono_Vendedor") : ""%>">
                                        <label class="mdl-textfield__label" for="telefono_Vendedor">Teléfono</label>
                                        <span class="mdl-textfield__error">Número de teléfono inválido</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="email" name="mail_Vendedor" id="mail_Vendedor" 
                                               value="<%= request.getAttribute("mail_Vendedor") != null ? request.getAttribute("mail_Vendedor") : ""%>">
                                        <label class="mdl-textfield__label" for="mail_Vendedor">E-mail</label>
                                        <span class="mdl-textfield__error">E-mail inválido</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" name="direccion_Vendedor" id="direccion_Vendedor" 
                                               value="<%= request.getAttribute("direccion_Vendedor") != null ? request.getAttribute("direccion_Vendedor") : ""%>">
                                        <label class="mdl-textfield__label" for="direccion_Vendedor">Dirección</label>
                                        <span class="mdl-textfield__error">Dirección inválida</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="password" name="Contrasenia_Vendedor" id="Contrasenia_Vendedor" 
                                               value="<%= request.getAttribute("Contrasenia_Vendedor") != null ? request.getAttribute("Contrasenia_Vendedor") : ""%>">
                                        <label class="mdl-textfield__label" for="Contrasenia_Vendedor">Contraseña</label>
                                        <span class="mdl-textfield__error">Contraseña inválida</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="number" step="5000" name="sueldo_Vendedor" id="sueldo_Vendedor" >
                                        <label class="mdl-textfield__label" for="sueldo_Vendedor">Sueldo</label>
                                        <span class="mdl-textfield__error">Número inválido</span>
                                    </div>
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" name="nombreUsuario_Vendedor" id="nombreUsuario_Vendedor" 
                                               value="<%= request.getAttribute("nombreUsuario_Vendedor") != null ? request.getAttribute("nombreUsuario_Vendedor") : ""%>">
                                        <label class="mdl-textfield__label" for="nombre_Vendedor">Nombre de Usuario</label>
                                        <span class="mdl-textfield__error">Nombre de usuario inválido</span>
                                    </div>
                                </div>
                                <input type="hidden" name="origen" value="vendedor" />
                            </div>
                            <p class="text-center">
                                <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addVendedor">
                                    <i class="zmdi zmdi-plus"></i>
                                </button>
                                <div class="mdl-tooltip" for="btn-addVendedor">Añadir Vendedor</div>
                            </p>
                        </form>
                    <div class="full-width panel-tittle bg-success text-center tittles">
			Lista de Vendedores
                    </div>
			<div class="full-width panel-content">
                            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width">
                                <thead>
                                    <tr>
                                        <th class="mdl-data-table__cell--non-numeric">Nombre</th>
                                        <th>RUT</th>
                                        <th>Teléfono</th>
                                        <th>Email</th>
                                        <th>Dirección</th>
                                        <th>Sueldo</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                            <tbody>
                                <% for (Empleado empleado : emp) { %>
                            <tr>
                                <td class="mdl-data-table__cell--non-numeric"><%= empleado.getNombre_Persona() %></td>
                                <td><%= empleado.getRut_Persona() %></td>
                                <td><%= empleado.getTelefono() %></td>
                                <td><%= empleado.getMail() %></td>
                                <td><%= empleado.getDireccion() %></td>
                                <td><%= empleado.getSueldo_Empleado() %></td>
                                <td>
                                    <!-- Botón de editar -->
                                    <button 
                                        type="button" 
                                        class="mdl-button mdl-js-button mdl-button--icon" 
                                        onclick="window.location.href='editarVendedor.jsp?idEmpleado=<%= empleado.getId_Persona() %>'">
                                        <i class="zmdi zmdi-edit"></i>
                                    </button>
                                    
                                    <% if(emp.size() != 1){ %>    
                                    <!-- Botón de eliminar -->
                                    <button 
                                        type="button" 
                                        class="mdl-button mdl-js-button mdl-button--icon" 
                                        onclick="confirmarEliminar(<%= empleado.getId_Persona() %>)">
                                        <i class="zmdi zmdi-delete"></i>
                                    </button>
                                        <% 
                                            } 
                                        %>

                                    <!-- Formulario oculto para eliminar -->
                                    <form id="eliminarForm_<%= empleado.getId_Persona() %>" action="SvEliminarVendedor" method="POST" style="display:none;">
                                        <input type="hidden" name="idEmpleado" value="<%= empleado.getId_Persona() %>">
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                            </table>
                        </div>
		</div>
	</section>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            function confirmarEliminar(idEmpleado) {
                Swal.fire({
                    title: '¿Estás seguro?',
                    text: "Esta acción eliminará al vendedor del sistema.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: 'Eliminar',
                    cancelButtonText: 'Cancelar',
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Encontrar el formulario oculto y enviarlo
                        var form = document.getElementById('eliminarForm_' + idEmpleado);
                        form.submit();  // Enviar el formulario
                    }
                });
            }
        </script>
</body>
</html>
