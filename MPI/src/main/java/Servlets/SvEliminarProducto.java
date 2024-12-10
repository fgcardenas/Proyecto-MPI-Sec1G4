package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import logica.Controladora;

@WebServlet("/SvEliminarProducto")
public class SvEliminarProducto extends HttpServlet {

    private Controladora control;

    @Override
    public void init() throws ServletException {
        super.init();
        control = new Controladora(); // Controladora conecta con la lógica de negocio
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtiene el ID del producto desde los parámetros
        int idProducto = Integer.parseInt(request.getParameter("id"));

        try {
            // Llama al método de la lógica para eliminar el producto
            control.eliminarProducto(idProducto);

            // Redirige a la página principal de productos
            response.sendRedirect("inventory.jsp");
        } catch (NumberFormatException e) {
            // Manejo de errores si el ID no es válido
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto inválido.");
        } catch (Exception e) {
            // Manejo de errores generales
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar el producto.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
