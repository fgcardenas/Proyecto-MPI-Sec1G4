<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
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
</head>
<body>
	<div class="login-wrapp cover">
		<div class="container-login">
			<p class="text-center" style="font-size: 80px;">
				<i class="zmdi zmdi-account-circle"></i>
			</p>
			<p class="text-center text-condensedLight">Inicie Sesi�n con cuenta vendedor REHOBOT</p>
			<form action="SvLoginVendedor" method="POST">
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
					<input class="mdl-textfield__input" type="text" id="userName" name="userName">
					<label class="mdl-textfield__label" for="userName">Usuario</label>
				</div>
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
					<input class="mdl-textfield__input" type="password" id="contrasenia" name="contrasenia">
					<label class="mdl-textfield__label" for="contrasenia">Contrase�a</label>
				</div>
				<input type="hidden" name="origen" value="inicioInventario" />
				<button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: #f77f07; margin: 0 auto; display: block;">
					Iniciar Sesi�n
				</button>
			</form>
			<!-- Bot�n para volver al men� -->
			<div class="text-center" style="margin-top: 20px;">
				<a href="index.html" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored bg-primary" style="text-transform: none;">
					Volver al Men�
				</a>
			</div>
		</div>
	</div>
</body>
</html>