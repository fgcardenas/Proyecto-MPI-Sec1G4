<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="full-width navBar">
			<div class="full-width navBar-options">
				<i class="zmdi zmdi-swap btn-menu" id="btn-menu"></i>	
				<div class="mdl-tooltip" for="btn-menu">Hide / Show MENU</div>
				<nav class="navBar-options-list">
					<ul class="list-unstyle">
                                            <form action="LogOutServlet" method="GET"></form>
						<li class="btn-exit" id="btn-exit">
                                                    <a href="LogoutServlet" style="text-decoration: none; color: inherit;">
                                                        <i class="zmdi zmdi-power"></i>
                                                        <div class="mdl-tooltip" for="btn-exit">Abandonar</div>
                                                    </a>
                                                </li>
                                                <li class="text-condensedLight noLink" ><small> <%=userName%> </small></li>
						<li class="noLink">
							<figure>
								<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
							</figure>
						</li>
                                        </form>
					</ul>
				</nav>
			</div>
		</div>
</html>
