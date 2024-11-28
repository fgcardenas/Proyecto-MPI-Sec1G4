<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/material.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/material.min.js"></script>
</head>
<body>
    <div class="login-wrap cover">
        <div class="container-login">
            <p class="text-center" style="font-size: 80px;">
                <i class="zmdi zmdi-account-circle"></i>
            </p>
            <p class="text-center text-condensedLight">Inicie Sesión con cuenta Admin REHOBOT</p>

            <form action="login" method="POST">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="userName" name="userName" required>
                    <label class="mdl-textfield__label" for="userName">Usuario</label>
                </div>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="password" id="pass" name="pass" required>
                    <label class="mdl-textfield__label" for="pass">Contraseña</label>
                </div>
                <button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: #f77f07; margin: 0 auto; display: block;">
                    Iniciar Sesión
                </button>

                <!-- Mostrar mensaje de error si existe -->
                <c:if test="${not empty errorMessage}">
                    <div style="color: red; margin-top: 10px;">
                        ${errorMessage}
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</body>
</html>
