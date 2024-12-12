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
        System.out.println("Valor de sueldo_Vendedor recibido: " + sueldoStr);

        int sueldo = 0;
        try {
            sueldo = Integer.parseInt(sueldoStr);
        } catch (NumberFormatException e) {
            // Manejo de errores: sueldo inválido
            request.setAttribute("error", "El sueldo ingresado no es válido.");
            request.setAttribute("rut_Vendedor", rut);  // Mantener los valores del formulario
            request.setAttribute("nombre_Vendedor", nombre);
            request.setAttribute("apellido_Vendedor", apellido);
            request.setAttribute("telefono_Vendedor", telefono);
            request.setAttribute("mail_Vendedor", email);
            request.setAttribute("direccion_Vendedor", direccion);
            request.setAttribute("nombreUsuario_Vendedor", nombreUsuario);
            request.getRequestDispatcher("seller.jsp").forward(request, response);
            return;
        }

        // Validaciones adicionales (opcional)
        if (rut == null || nombre == null || apellido == null || contrasenia == null || nombreUsuario == null ||
                rut.isEmpty() || nombre.isEmpty() || apellido.isEmpty() || contrasenia.isEmpty() || nombreUsuario.isEmpty() ||
                rut.isBlank() || nombre.isBlank() || apellido.isBlank() || contrasenia.isBlank() || nombreUsuario.isBlank()) {
            request.setAttribute("error", "Todos los campos deben estar completos.");
            request.setAttribute("rut_Vendedor", rut);
            request.setAttribute("nombre_Vendedor", nombre);
            request.setAttribute("apellido_Vendedor", apellido);
            request.setAttribute("telefono_Vendedor", telefono);
            request.setAttribute("mail_Vendedor", email);
            request.setAttribute("direccion_Vendedor", direccion);
            request.setAttribute("nombreUsuario_Vendedor", nombreUsuario);
            request.setAttribute("Contrasenia_Vendedor", contrasenia);
            request.setAttribute("sueldo_Vendedor", sueldoStr);
            request.getRequestDispatcher("seller.jsp").forward(request, response);
            return;
        }

        // Verificación de datos duplicados
        if (control.verificarDatosDuplicadosVendedor(rut, telefono, email, nombreUsuario)) {
            request.setAttribute("error", "Algunos valores ya están relacionados a otros vendedores. Por favor, verifique nuevamente.");
            request.setAttribute("rut_Vendedor", rut);
            request.setAttribute("nombre_Vendedor", nombre);
            request.setAttribute("apellido_Vendedor", apellido);
            request.setAttribute("telefono_Vendedor", telefono);
            request.setAttribute("mail_Vendedor", email);
            request.setAttribute("direccion_Vendedor", direccion);
            request.setAttribute("nombreUsuario_Vendedor", nombreUsuario);
            request.setAttribute("Contrasenia_Vendedor", contrasenia);
            request.setAttribute("sueldo_Vendedor", sueldoStr);
            request.getRequestDispatcher("seller.jsp").forward(request, response);
        } else {
            // Crear vendedor y mostrar mensaje de éxito
            sueldo = Integer.parseInt(sueldoStr);
            String nombreCompleto = nombre + " " + apellido;
            control.crearVendedor(nombreCompleto, telefono, email, rut, sueldo, direccion, contrasenia, nombreUsuario);
            request.setAttribute("mensaje", "Vendedor registrado exitosamente.");
            request.getRequestDispatcher("seller.jsp").forward(request, response);
        }
    }
}
