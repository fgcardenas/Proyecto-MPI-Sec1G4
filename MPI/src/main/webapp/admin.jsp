<%@ page import="jakarta.servlet.http.HttpSession" %><%@ page import="jakarta.servlet.http.HttpServletRequest" %><%@ page import="logica.Administrador" %><%@ page import="java.util.List" %><%@ page import="logica.Controladora" %><%    HttpSession sesion = request.getSession(false); // Obtiene la sesi�n si existe    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;    if (userName == null) {        response.sendRedirect("inicioInventario.jsp"); // Redirige al login si no hay sesi�n    }    Controladora control = new Controladora();%><!DOCTYPE html><html lang="es"><head>	<meta charset="UTF-8">	<meta name="viewport" content="width=device-width, initial-scale=1">	<title>Administrators</title>	<link rel="stylesheet" href="css/normalize.css">	<link rel="stylesheet" href="css/sweetalert2.css">	<link rel="stylesheet" href="css/material.min.css">	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">	<link rel="stylesheet" href="css/main.css">	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>	<script src="js/material.min.js" ></script>	<script src="js/sweetalert2.min.js" ></script>	<script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>	<script src="js/main.js" ></script></head><body>    <%        String result = request.getParameter("result");        if (result != null) {            if (result.equals("success")) {    %>                <script>                    alert('Administrador eliminado exitosamente');                </script>    <%            } else if (result.equals("error")) {    %>                <script>                    alert('No se pudo eliminar al administrador. Intenta de nuevo.');                </script>    <%            } else if (result.equals("password_error")) {    %>                <script>                    alert('Contrase�a incorrecta. Intenta nuevamente.');                </script>    <%            } else if (result.equals("processing")) {    %>                <script>                    alert('La eliminaci�n est� en proceso.');                </script>    <%            }        }    %>    <%@include file="component/lateralBar.jsp" %>	<!-- pageContent -->	<section class="full-width pageContent">        <%@include file="component/navBarLogOut.jsp" %>        <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">            <div class="mdl-tabs__tab-bar">                <a href="#tabNewAdmin" class="mdl-tabs__tab is-active">NUEVO</a>            </div>            <div class="mdl-tabs__panel is-active" id="tabNewAdmin">                <div class="mdl-grid">                    <div class="mdl-cell mdl-cell--12-col">                        <div class="full-width panel mdl-shadow--2dp">                            <div class="full-width panel-tittle bg-primary text-center tittles">                                Nuevo Administrador                            </div>                            <div class="full-width panel-content">                                <form action="AdminServlet" method="POST" >                                    <div class="mdl-grid">                                        <!-- Formulario de Nuevo Administrador (sin cambios) -->                                        <div class="mdl-cell mdl-cell--12-col">                                                <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i> &nbsp; DATOS DEL ADMINISTRADOR</legend><br>                                            </div>                                            <div class="mdl-cell mdl-cell--12-col">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="number" name="dni" id="DNIAdmin" required>                                                    <label class="mdl-textfield__label" for="DNIAdmin">DNI</label>                                                    <span class="mdl-textfield__error">N�mero inv�lido</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="text" name="name" id="NameAdmin" required>                                                    <label class="mdl-textfield__label" for="NameAdmin">Nombre</label>                                                    <span class="mdl-textfield__error">Nombre inv�lido</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="text" name="lastName" id="LastNameAdmin" required>                                                    <label class="mdl-textfield__label" for="LastNameAdmin">Apellido</label>                                                    <span class="mdl-textfield__error">Apellido inv�lido</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="tel" name="phone" id="phoneAdmin" required>                                                    <label class="mdl-textfield__label" for="phoneAdmin">Tel�fono</label>                                                    <span class="mdl-textfield__error">N�mero de tel�fono inv�lido</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="email" name="email" id="emailAdmin" required>                                                    <label class="mdl-textfield__label" for="emailAdmin">Correo electr�nico</label>                                                    <span class="mdl-textfield__error">Correo electr�nico inv�lido</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="text" name="address" id="addressAdmin" required>                                                    <label class="mdl-textfield__label" for="addressAdmin">Direcci�n</label>                                                    <span class="mdl-textfield__error">Direcci�n inv�lida</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="text" name="userName" id="UserNameAdmin" required>                                                    <label class="mdl-textfield__label" for="UserNameAdmin">Nombre de usuario</label>                                                    <span class="mdl-textfield__error">Nombre de usuario inv�lido</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">                                                    <input class="mdl-textfield__input" type="password" name="password" id="passwordAdmin" required>                                                    <label class="mdl-textfield__label" for="passwordAdmin">Contrase�a</label>                                                    <span class="mdl-textfield__error">Contrase�a inv�lida</span>                                                </div>                                            </div>                                            <div class="mdl-cell mdl-cell--12-col">                                                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored bg-primary" type="submit">                                                    A�adir Administrador                                                </button>                                            </div>                                    </div>                                </form>                            </div>                        </div>                    </div>                </div>            </div>            <div class="mdl-grid">                <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">                    <div class="table-responsive">                        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">                            <thead>                                <tr>                                    <th class="mdl-data-table__cell--non-numeric">Nombre</th>                                    <th>Telefono</th>                                    <th>Rut</th>                                    <th>Correo</th>                                    <th>Direccion</th>                                    <th>Nombre Usuario</th>                                </tr>                            </thead>                            <tbody>                                <%                                    List<Administrador> admins = control.traerAdministrador();                                    if (admins != null && !admins.isEmpty()) {                                        for (Administrador admin : admins) {                                %>                                <tr>                                    <td class="mdl-data-table__cell--non-numeric"><%= admin.getNombre_Persona() %></td>                                    <td><%= admin.getTelefono() %></td>                                    <td><%= admin.getRut_Persona() %></td>                                    <td><%= admin.getMail() %></td>                                    <td><%= admin.getDireccion_Tienda() %></td>                                    <td><%= admin.getUsername() %></td>                                    <td>                                        <!-- Bot�n de eliminar con clase para color rojo -->                                        <button onclick="confirmarEliminacion('<%= admin.getId_Persona() %>', '<%= admin.getNombre_Persona() %>')" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored bg-danger">                                            Eliminar                                        </button>                                    </td>                                </tr>                                <%                                    }                                } else {                                %>                                <tr>                                    <td colspan="7">No existen Administradores</td>                                </tr>                                <%                                }                                %>                            </tbody>                        </table>                    </div>                </div>            </div>        </div>    </section>    <!-- Modal de Confirmaci�n -->    <div id="modalEliminacion" style="display:none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 9999;">        <div class="modal-content" style="background: white; width: 300px; padding: 20px; margin: 100px auto; border-radius: 8px; text-align: center;">            <h3>�Est�s seguro de que deseas eliminar a <span id="adminNombre"></span> como administrador? Una vez hecho no hay vuelta atr�s</h3>            <input type="password" id="passwordEliminar" placeholder="Contrase�a" required style="width: 100%; padding: 8px; margin: 10px 0;">            <button onclick="eliminarAdministrador()" style="background-color: red; color: white; padding: 10px 20px; border: none; cursor: pointer;">Eliminar</button>            <button onclick="cerrarModal()" style="background-color: gray; color: white; padding: 10px 20px; border: none; cursor: pointer;">Cancelar</button>        </div>    </div>    <script>        function confirmarEliminacion(id, nombre) {            // Muestra el modal            document.getElementById('modalEliminacion').style.display = 'block';            // Muestra el nombre del administrador en el modal            document.getElementById('adminNombre').innerText = nombre;            // Guarda el ID del administrador a eliminar            sessionStorage.setItem('adminEliminarId', id);        }        function cerrarModal() {            // Cierra el modal            document.getElementById('modalEliminacion').style.display = 'none';        }        function eliminarAdministrador() {            var password = document.getElementById('passwordEliminar').value;            var adminId = sessionStorage.getItem('adminEliminarId');            if (password) {                // Enviar la contrase�a y el ID del administrador al servlet de eliminaci�n                var formData = new FormData();                formData.append("adminId", adminId);                formData.append("password", password);                fetch('/SvEliminarAdmin', {                    method: 'POST',                    body: formData                })                .then(response => {                    // Si la respuesta es exitosa (c�digo 200), redirigir con el resultado en los par�metros de URL                    window.location.href = 'admin.jsp?result=processing'; // Indica que est� procesando                })                .catch(error => {                    // Si hay un error en la solicitud                    alert('Ocurri� un error al procesar la solicitud');                });                // Cierra el modal                cerrarModal();            } else {                alert('Por favor, ingrese la contrase�a');            }        }    </script></body></html>