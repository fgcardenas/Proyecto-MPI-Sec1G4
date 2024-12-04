package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet("/SvCliente")
public class SvCliente extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre_Persona = request.getParameter("nombre_Persona");
        String telefono = request.getParameter("telefono");
        String mail = request.getParameter("mail");
        String rut_Persona = request.getParameter("rut_Persona");
        String direccion_cliente = request.getParameter("direccion_cliente");
        String Contrasenia_Cliente = request.getParameter("Contrasenia_Cliente");

        // Crear cliente
        control.crearCliente(nombre_Persona, Contrasenia_Cliente, telefono, mail, rut_Persona, direccion_cliente);

        // Obtener el parámetro "origen" que indica la página que invocó el servlet
        String origen = request.getParameter("origen");

        // Redirigir según el origen
        if ("inicioVenta".equals(origen)) {
            response.sendRedirect("inicioVenta.html"); // Redirige a pagina1.jsp
        } else if ("client".equals(origen)) {
            response.sendRedirect("client.jsp"); // Redirige a pagina2.jsp
        } else {
            response.sendRedirect("index.html"); // Redirige a una página predeterminada
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para crear clientes y redirigir según la página que lo invoca";
    }
}
