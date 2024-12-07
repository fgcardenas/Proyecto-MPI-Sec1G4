package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logica.Controladora;

@WebServlet("/SvLoginClient")
public class SvLoginClient extends HttpServlet {
    Controladora control = new Controladora();
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String password = request.getParameter("pass");

        // Validación general
        boolean validation = control.comprobarIngresoCliente(mail, password);
        
        if (validation) {
            HttpSession mySession = request.getSession(true);
            mySession.setAttribute("mail", mail);
            response.sendRedirect("inicioVenta.jsp");
        } else {
            response.sendRedirect("inicioVenta.jsp?error=1");  // Redirigir con error si la validación falla
        }
    }


}
