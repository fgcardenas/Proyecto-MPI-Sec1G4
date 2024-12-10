package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

import java.io.IOException;

@WebServlet("/SvVendedor")
public class SvVendedor extends HttpServlet {
    Controladora control = new Controladora();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String rut = request.getParameter("rut_Vendedor");
        String nombre = request.getParameter("nombre_Vendedor");
        String apellido = request.getParameter("apellido_Vendedor");
        String telefono = request.getParameter("telefono_Vendedor");
        String email = request.getParameter("mail_Vendedor");
        String direccion = request.getParameter("direccion_Vendedor");
        String contrasenia = request.getParameter("Contrasenia_Vendedor");
        String sueldoStr = request.getParameter("sueldo_Vendedor");
        String nombreUsuario = request.getParameter("nombreUsuario_Vendedor");

        // Validar y convertir datos si es necesario
        int sueldo = 0;
        try {
            sueldo = Integer.parseInt(sueldoStr);
        } catch (NumberFormatException e) {
            // Manejo de errores: sueldo inválido
            request.setAttribute("error", "El sueldo ingresado no es válido.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }

        // Validaciones adicionales (opcional)
        if (rut == null || nombre == null || apellido == null || contrasenia == null || nombreUsuario == null ||
                rut.isEmpty() || nombre.isEmpty() || apellido.isEmpty() || contrasenia.isEmpty() || nombreUsuario.isEmpty()) {
            request.setAttribute("error", "Todos los campos obligatorios deben estar completos.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }
        String nombreCompleto = nombre+" "+apellido;
        control.crearVendedor(nombreCompleto,telefono,email,rut,sueldo,direccion,contrasenia,nombreUsuario);

        // Simulación de éxito
        request.setAttribute("mensaje", "Vendedor registrado exitosamente.");
        request.getRequestDispatcher("seller.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirige a la página principal si se accede por GET
        response.sendRedirect("index.jsp");
    }
}
