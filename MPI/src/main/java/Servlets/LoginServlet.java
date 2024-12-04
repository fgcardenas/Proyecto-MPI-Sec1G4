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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    Controladora control = new Controladora();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String password = request.getParameter("contrasenia");
        
        // Obtener el parámetro "origen" que indica desde qué página se invoca el servlet
        String origen = request.getParameter("origen");

        // Validación general
       

        // Si el origen es "inicioInventario", ejecutar lógica de inventario
        if ("inicioInventario".equals(origen)) {
             boolean validation = control.comprobarIngreso(mail, password);
            if (validation || validateMainAdmin(mail, password)) {
                HttpSession mySession = request.getSession(true);
                mySession.setAttribute("mail", mail);
                response.sendRedirect("home.jsp");  // Redirigir a home.jsp si es un administrador
            } else {
                response.sendRedirect("inicioInventario.jsp?error=1");  // Redirigir con error si la validación falla
            }
        }
        // Si el origen es "inicioVenta", ejecutar lógica para clientes
        else if ("inicioVenta".equals(origen)) {
            boolean validation = control.comprobarIngresoCliente(mail, origen);
            if (validation) {
                HttpSession mySession = request.getSession(true);
                mySession.setAttribute("mail", mail);
                response.sendRedirect("inicioVenta.html");  // Redirigir a la página de ventas si la validación es exitosa
            } else {
                response.sendRedirect("inicioVenta.html?error=1");  // Redirigir con error si la validación falla
            }
        }
        // Si el origen no está especificado, redirigir a inicioInventario como comportamiento predeterminado
        else {
            response.sendRedirect("index.html");
        }
    }

    private boolean validateMainAdmin(String userName, String password) {
        // Validar el administrador principal
        return "Claudio".equals(userName) && "123".equals(password);
    }

    @Override
    public String getServletInfo() {
        return "Servlet de login que maneja distintos flujos dependiendo de la página que lo invoca";
    }
}


