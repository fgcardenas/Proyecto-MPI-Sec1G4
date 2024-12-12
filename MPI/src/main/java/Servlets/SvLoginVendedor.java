package Servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import logica.Controladora;
import logica.Empleado;

@WebServlet("/SvLoginVendedor")
public class SvLoginVendedor extends HttpServlet {
    Controladora control = new Controladora();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("userName");
        String password = request.getParameter("contrasenia");

        // Validación general
        Empleado validation = control.comprobarIngresoVendedor(user, password);

        if (validation!=null) {
            String nombreVendedor = validation.getNombre_Persona();
            HttpSession mySession = request.getSession(true);
            mySession.setAttribute("userName", user);
            String userName = (String) mySession.getAttribute("userName");
response.sendRedirect("inicioVenta.jsp?username=" + URLEncoder.encode(userName, "UTF-8"));
        } else {
            response.sendRedirect("sesionventa.jsp");  // Redirigir con error si la validación falla
        }
    }
    @Override
    public String getServletInfo() {
        return "Servlet de login que maneja distintos flujos dependiendo de la página que lo invoca";
    }
}