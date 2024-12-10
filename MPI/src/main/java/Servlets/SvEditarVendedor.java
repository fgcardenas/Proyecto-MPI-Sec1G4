/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Empleado;

@WebServlet("/SvEditarVendedor")
public class SvEditarVendedor extends HttpServlet {
    Controladora control = new Controladora();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int sellerId =Integer.parseInt(request.getParameter("id_Vendedor"));
        
        String telefono=request.getParameter("telefono");
        String mail=request.getParameter("mail");
        String direccion_Tienda=request.getParameter("direccion");
        String Contrasenia_Admin=request.getParameter("password");
        int sueldo = Integer.parseInt(request.getParameter("sueldo"));
       
        
        Empleado seller = control.obtenerVendedor(sellerId);
        
        seller.setTelefono(telefono);
        seller.setMail(mail);
        seller.setDireccion(direccion_Tienda);
        seller.setContrasenia(Contrasenia_Admin);
        seller.setSueldo_Empleado(sueldo);
        
        control.editarVendedor(seller);
        
        response.sendRedirect("seller.jsp");
    }
}
