<%@ page import="jakarta.servlet.http.HttpSession" %><%@ page import="jakarta.servlet.http.HttpServletRequest" %><%    HttpSession sesion = request.getSession(false); // Obtiene la sesi�n si existe    String userName = (sesion != null) ? (String) sesion.getAttribute("userName") : null;    if (userName == null) {        response.sendRedirect("login.jsp"); // Redirige al login si no hay sesi�n    }%><!DOCTYPE html><html lang="es"><head>	<meta charset="UTF-8">	<meta name="viewport" content="width=device-width, initial-scale=1">	<title>Home</title>	<link rel="stylesheet" href="css/normalize.css">	<link rel="stylesheet" href="css/sweetalert2.css">	<link rel="stylesheet" href="css/material.min.css">	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">	<link rel="stylesheet" href="css/main.css">	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>	<script src="js/material.min.js" ></script>	<script src="js/sweetalert2.min.js" ></script>	<script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>	<script src="js/main.js" ></script></head><body>	<!-- Notifications area -->	<section class="full-width container-notifications">		<div class="full-width container-notifications-bg btn-Notification"></div>	    <section class="NotificationArea">	        <div class="full-width text-center NotificationArea-title tittles">Notifications <i class="zmdi zmdi-close btn-Notification"></i></div>	        <a href="#" class="Notification" id="notifation-unread-1">	            <div class="Notification-icon"><i class="zmdi zmdi-accounts-alt bg-info"></i></div>	            <div class="Notification-text">	                <p>	                    <i class="zmdi zmdi-circle"></i>	                    <strong>New User Registration</strong> 	                    <br>	                    <small>Just Now</small>	                </p>	            </div>	        	<div class="mdl-tooltip mdl-tooltip--left" for="notifation-unread-1">Notification as UnRead</div> 	        </a>	        <a href="#" class="Notification" id="notifation-read-1">	            <div class="Notification-icon"><i class="zmdi zmdi-cloud-download bg-primary"></i></div>	            <div class="Notification-text">	                <p>	                    <i class="zmdi zmdi-circle-o"></i>	                    <strong>New Updates</strong> 	                    <br>	                    <small>30 Mins Ago</small>	                </p>	            </div>	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-read-1">Notification as Read</div>	        </a>	        <a href="#" class="Notification" id="notifation-unread-2">	            <div class="Notification-icon"><i class="zmdi zmdi-upload bg-success"></i></div>	            <div class="Notification-text">	                <p>	                    <i class="zmdi zmdi-circle"></i>	                    <strong>Archive uploaded</strong> 	                    <br>	                    <small>31 Mins Ago</small>	                </p>	            </div>	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-unread-2">Notification as UnRead</div>	        </a> 	        <a href="#" class="Notification" id="notifation-read-2">	            <div class="Notification-icon"><i class="zmdi zmdi-mail-send bg-danger"></i></div>	            <div class="Notification-text">	                <p>	                    <i class="zmdi zmdi-circle-o"></i>	                    <strong>New Mail</strong> 	                    <br>	                    <small>37 Mins Ago</small>	                </p>	            </div>	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-read-2">Notification as Read</div>	        </a>	        <a href="#" class="Notification" id="notifation-read-3">	            <div class="Notification-icon"><i class="zmdi zmdi-folder bg-primary"></i></div>	            <div class="Notification-text">	                <p>	                    <i class="zmdi zmdi-circle-o"></i>	                    <strong>Folder delete</strong> 	                    <br>	                    <small>1 hours Ago</small>	                </p>	            </div>	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-read-3">Notification as Read</div>	        </a>  	    </section>	</section>	<!-- navLateral -->	<section class="full-width navLateral">		<div class="full-width navLateral-bg btn-menu"></div>		<div class="full-width navLateral-body">			<div class="full-width navLateral-body-logo text-center tittles">				<i class="zmdi zmdi-close btn-menu"></i> Inventario			</div>			<figure class="full-width navLateral-body-tittle-menu">                            <div>                                <img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">                            </div>                            <figcaption>                                <span>                                    <%= userName %> <br>                                    <small>Administrador</small>                                </span>                            </figcaption>                        </figure>			<nav class="full-width">				<ul class="full-width list-unstyle menu-principal">					<li class="full-width">						<a href="home.jsp" class="full-width">							<div class="navLateral-body-cl">								<i class="zmdi zmdi-view-dashboard"></i>							</div>							<div class="navLateral-body-cr">								HOME							</div>						</a>					</li>					<li class="full-width divider-menu-h"></li>					<li class="full-width">						<a href="#!" class="full-width btn-subMenu">							<div class="navLateral-body-cl">								<i class="zmdi zmdi-case"></i>							</div>							<div class="navLateral-body-cr">								ADMINISTRACION							</div>							<span class="zmdi zmdi-chevron-left"></span>						</a>						<ul class="full-width menu-principal sub-menu-options">							<li class="full-width">								<a href="payments.jsp" class="full-width">									<div class="navLateral-body-cl">										<i class="zmdi zmdi-card"></i>									</div>									<div class="navLateral-body-cr">										METODOS DE PAGO									</div>								</a>							</li>							<li class="full-width">								<a href="categories.jsp" class="full-width">									<div class="navLateral-body-cl">										<i class="zmdi zmdi-label"></i>									</div>									<div class="navLateral-body-cr">										CATEGORIAS									</div>								</a>							</li>						</ul>					</li>					<li class="full-width divider-menu-h"></li>					<li class="full-width">						<a href="#!" class="full-width btn-subMenu">							<div class="navLateral-body-cl">								<i class="zmdi zmdi-face"></i>							</div>							<div class="navLateral-body-cr">								USUARIOS							</div>							<span class="zmdi zmdi-chevron-left"></span>						</a>						<ul class="full-width menu-principal sub-menu-options">							<li class="full-width">								<a href="admin.jsp" class="full-width">									<div class="navLateral-body-cl">										<i class="zmdi zmdi-account"></i>									</div>									<div class="navLateral-body-cr">										ADMINISTRADORES									</div>								</a>							</li>							<li class="full-width">								<a href="client.jsp" class="full-width">									<div class="navLateral-body-cl">										<i class="zmdi zmdi-accounts"></i>									</div>									<div class="navLateral-body-cr">										CLIENTE									</div>								</a>							</li>						</ul>					</li>					<li class="full-width divider-menu-h"></li>					<li class="full-width">						<a href="products.jsp" class="full-width">							<div class="navLateral-body-cl">								<i class="zmdi zmdi-washing-machine"></i>							</div>							<div class="navLateral-body-cr">								PRODUCTOS							</div>						</a>					</li>					<li class="full-width divider-menu-h"></li>					<li class="full-width">						<a href="sales.jsp" class="full-width">							<div class="navLateral-body-cl">								<i class="zmdi zmdi-shopping-cart"></i>							</div>							<div class="navLateral-body-cr">								VENTAS							</div>						</a>					</li>					<li class="full-width divider-menu-h"></li>					<li class="full-width">						<a href="inventory.jsp" class="full-width">							<div class="navLateral-body-cl">								<i class="zmdi zmdi-store"></i>							</div>							<div class="navLateral-body-cr">								INVENTARIO							</div>						</a>					</li>				</ul>			</nav>		</div>	</section>	<!-- pageContent -->	<section class="full-width pageContent">		<!-- navBar -->		<div class="full-width navBar">			<div class="full-width navBar-options">				<i class="zmdi zmdi-swap btn-menu" id="btn-menu"></i>					<div class="mdl-tooltip" for="btn-menu">Hide / Show MENU</div>				<nav class="navBar-options-list">					<ul class="list-unstyle">						<li class="btn-Notification" id="notifications">							<i class="zmdi zmdi-notifications"></i>							<div class="mdl-tooltip" for="notifications">Notifications</div>						</li>						<li class="btn-exit" id="btn-exit">                                                    <a href="LogoutServlet" style="text-decoration: none; color: inherit;">                                                        <i class="zmdi zmdi-power"></i>                                                        <div class="mdl-tooltip" for="btn-exit">Abandonar</div>                                                    </a>                                                </li>						<li class="text-condensedLight noLink" ><small>Usuario</small></li>						<li class="noLink">							<figure>								<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">							</figure>						</li>					</ul>				</nav>			</div>		</div>		<section class="full-width text-center" style="padding: 40px 0;">			<h3 class="text-center tittles">RESPONSIVE TILES</h3>			<!-- Tiles -->			<article class="full-width tile">				<div class="tile-text">					<span class="text-condensedLight">						2<br>						<small>Administradores</small>					</span>				</div>				<i class="zmdi zmdi-account tile-icon"></i>			</article>			<article class="full-width tile">				<div class="tile-text">					<span class="text-condensedLight">						71<br>						<small>Clientes</small>					</span>				</div>				<i class="zmdi zmdi-accounts tile-icon"></i>			</article>			<article class="full-width tile">				<div class="tile-text">					<span class="text-condensedLight">						7<br>						<small>Proveedores</small>					</span>				</div>				<i class="zmdi zmdi-truck tile-icon"></i>			</article>			<article class="full-width tile">				<div class="tile-text">					<span class="text-condensedLight">						9<br>						<small>Categorias</small>					</span>				</div>				<i class="zmdi zmdi-label tile-icon"></i>			</article>			<article class="full-width tile">				<div class="tile-text">					<span class="text-condensedLight">						121<br>						<small>Productos</small>					</span>				</div>				<i class="zmdi zmdi-washing-machine tile-icon"></i>			</article>			<article class="full-width tile">				<div class="tile-text">					<span class="text-condensedLight">						47<br>						<small>Ventas</small>					</span>				</div>				<i class="zmdi zmdi-shopping-cart tile-icon"></i>			</article>		</section>			</section></body></html>