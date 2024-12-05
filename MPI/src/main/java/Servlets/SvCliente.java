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
        // Obtener parámetros del formulario
        String nombre_Persona = request.getParameter("nombre_Persona");
        String telefono = request.getParameter("telefono");
        String mail = request.getParameter("mail");
        String rut_Persona = request.getParameter("rut_Persona");
        String direccion_cliente = request.getParameter("direccion_cliente");
        String Contrasenia_Cliente = request.getParameter("Contrasenia_Cliente");
        String origen = request.getParameter("origen");

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
               
            // Redirigir según el origen
            redirigir(response, origen);
        } catch (Exception e) {
            // Manejo de errores
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void redirigir(HttpServletResponse response, String origen) throws IOException {
        if ("inicioVenta".equals(origen)) {
            response.sendRedirect("inicioVenta.html");
        } else if ("client".equals(origen)) {
            response.sendRedirect("client.jsp");
        } else {
            response.sendRedirect("index.html");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para crear clientes y redirigir según la página que lo invoca.";
    }
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

