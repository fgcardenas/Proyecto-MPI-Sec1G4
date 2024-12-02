package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvCliente", urlPatterns = {"/SvCliente"})
public class SvCliente extends HttpServlet {
    Controladora control = new Controladora();

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre_Persona=request.getParameter("nombre_Persona");
        String telefono=request.getParameter("telefono");
        String mail=request.getParameter("mail");
        String rut_Persona=request.getParameter("rut_Persona");
        String direccion_cliente=request.getParameter("direccion_cliente");
        String Contrasenia_Cliente=request.getParameter("Contrasenia_Cliente");
        
        control.crearCliente(nombre_Persona,Contrasenia_Cliente,telefono,mail,rut_Persona,direccion_cliente);
        
        response.sendRedirect("login.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
