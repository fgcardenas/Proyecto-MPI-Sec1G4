package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name="/SvEliminarAdmin")
public class SvEliminarAdmin extends HttpServlet {
    
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8"); // Aseguramos que la respuesta sea en HTML
        
            
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Este método no se utiliza en este caso
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); 
        

            int id = Integer.parseInt(request.getParameter("adminId"));
            String password = request.getParameter("password");

            // Verificar si la contraseña es correcta
            if ("EliminarAdminRehobot2024".equals(password)) {
                // Si la contraseña es correcta, eliminar al administrador
                control.eliminarAdmin(id); // Eliminar el administrador, suponiendo que este método retorna un booleano
                
                response.sendRedirect("admin.jsp?result=success");
                
            } else {
                // Si la contraseña es incorrecta, redirigimos con un mensaje de error
                response.sendRedirect("admin.jsp?result=password_error");
            }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para eliminar administradores con verificación de contraseña.";
    }
}
