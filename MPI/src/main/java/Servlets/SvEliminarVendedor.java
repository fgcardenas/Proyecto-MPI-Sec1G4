
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;


@WebServlet("/SvEliminarVendedor")
public class SvEliminarVendedor extends HttpServlet {
    Controladora control = new Controladora();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID del vendedor desde la solicitud
        String idEmpleadoStr = request.getParameter("idEmpleado");
        int idEmpleado = Integer.parseInt(idEmpleadoStr);
        control.eliminarVendedor(idEmpleado);
        
        response.sendRedirect("seller.jsp");
    }
}
