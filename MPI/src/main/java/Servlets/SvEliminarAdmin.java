package Servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet("/SvEliminarAdmin")
public class SvEliminarAdmin extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Obtener los parámetros enviados desde el formulario
            int id = Integer.parseInt(request.getParameter("adminId"));
            String password = request.getParameter("password");

            // Verificar la contraseña antes de proceder
            if ("EliminarAdminRehobot2024".equals(password)) {
                
                control.eliminarAdmin(id); // Suponiendo que retorna true si la operación es exitosa
               
                response.sendRedirect("admin.jsp");
            } else {
                // Contraseña incorrecta
                response.sendRedirect("admin.jsp?result=password_error");
            }
        } catch (NumberFormatException | NullPointerException e) {
            // Manejo de errores para parámetros inválidos
            response.sendRedirect("admin.jsp?result=input_error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para eliminar administradores con confirmación de contraseña.";
    }
}
