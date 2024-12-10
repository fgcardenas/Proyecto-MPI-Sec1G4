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
import logica.Controladora;

@WebServlet("/SvLoginVendedor")
public class SvLoginVendedor extends HttpServlet {
    Controladora control = new Controladora();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("userName");
        String password = request.getParameter("contrasenia");

        // Validación general
        boolean validation = control.comprobarIngresoVendedor(user, password);
        
        if (validation) {
            HttpSession mySession = request.getSession(true);
            mySession.setAttribute("userName", user);
            response.sendRedirect("inicioVenta.html");  // Redirigir a home.jsp si es un administrador
        } else {
            response.sendRedirect("sesionventa.jsp");  // Redirigir con error si la validación falla
        }
    }
    @Override
    public String getServletInfo() {
        return "Servlet de login que maneja distintos flujos dependiendo de la página que lo invoca";
    }
}

