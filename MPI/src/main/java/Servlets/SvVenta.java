package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

import java.io.IOException;

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



        int transactionTotal = 0; // Cambiar de double a int

        transactionTotal = Integer.parseInt(transactionTotalStr); // Convertir a int

        System.out.println("transactionId: " + transactionId);
        System.out.println("transactionDateTime: " + transactionDateTime);
        System.out.println("customerName: " + customerName);
        System.out.println("customerPhone: " + customerPhone);
        System.out.println("customerAddress: " + customerAddress);
        System.out.println("paymentMethod: " + paymentMethod);
        System.out.println("transactionTotal: " + transactionTotal);
        System.out.println("items: " + items);
        System.out.println("vendedorName: " + vendedorName);



        control.crearCompra(transactionId, transactionDateTime, items, customerAddress,
                                vendedorName, customerName, customerPhone, transactionTotal, paymentMethod);



    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirige a la página principal si se accede por GET
        response.sendRedirect("index.jsp");
    }
}