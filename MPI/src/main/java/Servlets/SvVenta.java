package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import logica.Articulo;

@WebServlet("/SvVenta")
public class SvVenta extends HttpServlet {
    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String transactionId = request.getParameter("transactionId");
        String transactionDateTime = request.getParameter("transactionDateTime");
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String customerAddress = request.getParameter("customerAddress");
        String paymentMethod = request.getParameter("paymentMethod");
        String transactionTotalStr = request.getParameter("transactionTotal");
        String items = request.getParameter("items");
        String vendedorName = request.getParameter("username");

        // Procesar los ids y cantidades de los productos comprados
        String stocksParam = request.getParameter("stocks");
        String[] stocksArray = stocksParam.split(",");
        
        // Actualizar los stocks
        for (String line : stocksArray) {
            String[] parts = line.split("-");
            int productId = Integer.parseInt(parts[0]);
            int quantityPurchased = Integer.parseInt(parts[1]);

            Articulo product = control.obtenerArticulo(productId); // Obtener el artículo
            int newStock = product.getStock() - quantityPurchased; // Restar el stock
            product.setStock(newStock);
            control.actualizarArticulo(product);// Actualizar el stock en la base de datos o sistema
        }

        // Procesar la transacción
        int transactionTotal = Integer.parseInt(transactionTotalStr);
        control.crearCompra(transactionId, transactionDateTime, items, customerAddress,
                             vendedorName, customerName, customerPhone, transactionTotal, paymentMethod);

        // Enviar una respuesta
        response.setStatus(HttpServletResponse.SC_OK);  // Código de éxito
        response.getWriter().write("Compra registrada y stock actualizado.");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige a la página principal si se accede por GET
        response.sendRedirect("index.html");
    }
}

