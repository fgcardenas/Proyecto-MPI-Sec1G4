
package Servlets;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import logica.Articulo;
import logica.Controladora;

@WebServlet("/SvMostrarProductos")
public class SvMostrarProductos extends HttpServlet {

    Controladora control;
    @Override
    public void init() throws ServletException {
        control = new Controladora();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener lista de productos
        List<Articulo> productos = control.getArticulos();
        
        if (productos != null) {
            // Establecer el atributo 'productos' en la solicitud
            request.setAttribute("productos", productos);
        } else {
            // Si no hay productos, puedes manejarlo como prefieras, como agregar un mensaje
            request.setAttribute("productos", new ArrayList<Articulo>());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
        dispatcher.forward(request, response);
    }
}
