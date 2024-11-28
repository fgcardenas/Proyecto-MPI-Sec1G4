package Servlets;

import logica.Administrador;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt; // Librería para el hash bcrypt

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("pass");

        if(validateAdmin(userName,password)){
            HttpSession sesion = request.getSession();
            sesion.setAttribute("userName", userName);
            response.sendRedirect("home.jsp");
        }else{
            // Si no se encuentra, redirigir al login con un mensaje de error
            response.sendRedirect("inicioInventario.jsp?error=1");
        }
    }
    private boolean validateAdmin(String userName, String password) {
        if("Claudio".equals(userName) && "modelamiento".equals(password)){
            return true;
        } else{
            for (Administrador admin : AdminServlet.admins) {
                if (admin.getUserName().equals(userName) && admin.getPassword().equals(password)) {
                    return true;
                }
            }   
        }
        
        return false;
    }
    private boolean validateMainAdmin (String userName, String password){
        return "Claudio".equals(userName) && "modelamiento".equals(password);
    }
    
}

