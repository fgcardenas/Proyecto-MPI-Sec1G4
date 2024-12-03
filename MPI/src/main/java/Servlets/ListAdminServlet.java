package Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import logica.Administrador;
import logica.Controladora;

public class ListAdminServlet extends HttpServlet {
    private Controladora control;

    @Override
    public void init() throws ServletException {
        control = new Controladora();  // Asegúrate de que Controladora maneje la lógica para consultar la BD.
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la lista de administradores
        List<Administrador> admins = control.traerAdministrador();  // Método que debes implementar en la lógica.
        
        // Pasar la lista al JSP
        request.setAttribute("admins", admins);
        
        // Redirigir a la página que contiene la tabla
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
        dispatcher.forward(request, response);
    }
}
