package Servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet("/SvCliente")
public class SvCliente extends HttpServlet {
    private final Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre_Persona = request.getParameter("nombre_Persona");
        String telefono = request.getParameter("telefono");
        String mail = request.getParameter("mail");
        String rut_Persona = request.getParameter("rut_Persona");
        String direccion_cliente = request.getParameter("direccion_cliente");
        String Contrasenia_Cliente = request.getParameter("Contrasenia_Cliente");

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        try {
            // Validar entradas
            if (nombre_Persona == null || nombre_Persona.isEmpty() ||
                telefono == null || telefono.isEmpty() ||
                mail == null || mail.isEmpty() ||
                rut_Persona == null || rut_Persona.isEmpty() ||
                Contrasenia_Cliente == null || Contrasenia_Cliente.isEmpty()) {
                throw new IllegalArgumentException("Todos los campos obligatorios deben completarse.");
            }

            // Crear cliente
            control.crearCliente(nombre_Persona, Contrasenia_Cliente, telefono, mail, rut_Persona, direccion_cliente);

            // Responder con mensaje de éxito
            response.sendRedirect("exitoRegistro.jsp");
        } catch (Exception e) {
            // Responder con mensaje de error
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
