package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Articulo;
import java.io.IOException;

@WebServlet("/SvEditarProducto")
public class SvEditarProducto extends HttpServlet {
    
    private Controladora control;

    @Override
    public void init() throws ServletException {
        super.init();
        control = new Controladora(); // Controladora conecta con la lógica de negocio
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtiene el ID del producto desde los parámetros de la URL
        String idProducto = request.getParameter("id");

        if (idProducto != null) {
            // Busca el producto en la base de datos usando el ID
            Articulo producto = control.obtenerArticulo(Integer.parseInt(idProducto));

            if (producto != null) {
                // Pasa el objeto producto a la página JSP para editar
                request.setAttribute("producto", producto);
                request.getRequestDispatcher("/editarProducto.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Producto no encontrado");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto no proporcionado");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtiene los nuevos datos del producto del formulario
        String idProducto = request.getParameter("id_Articulo");
        String nombre = request.getParameter("nombre_Articulo");
        String categoria = request.getParameter("categoria_Articulo");
        int precio = Integer.parseInt(request.getParameter("precio_Articulo"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String marca = request.getParameter("marca_Articulo");
        String fechaVencimiento = request.getParameter("fechaVencimiento");

        // Verifica que todos los campos estén completos
        if (idProducto != null && !idProducto.isEmpty()) {
            int id = Integer.parseInt(idProducto);
            Articulo producto = control.obtenerArticulo(Integer.parseInt(idProducto));
            // Crea un nuevo objeto Articulo con los datos del formulario
            producto.setId_Articulo(id);
            producto.setNombre_Articulo(nombre);
            producto.setCatergoria_Articulo(categoria);
            producto.setPrecio_Articulo(precio);
            producto.setStock(stock);
            producto.setMarca_Articulo(marca);
            producto.setFechaVencimiento(java.time.LocalDate.parse(fechaVencimiento));

            // Llama al método de la lógica para actualizar el producto
            control.actualizarArticulo(producto);

            // Redirige a la página principal de productos después de la actualización
            response.sendRedirect("inventory.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto no proporcionado");
        }
    }
}
