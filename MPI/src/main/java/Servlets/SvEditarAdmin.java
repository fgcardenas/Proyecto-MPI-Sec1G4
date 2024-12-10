package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logica.Administrador;
import logica.Controladora;


@WebServlet("/SvEditarAdmin")
public class SvEditarAdmin extends HttpServlet {

    Controladora control =new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("adminId"));
        Administrador admin=control.traerAdministrador(id);
        
        HttpSession mySession= request.getSession();
        
        mySession.setAttribute("AdminEditar",admin);
        
        response.sendRedirect("edicionAdmin.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int adminId =Integer.parseInt(request.getParameter("id_Admin"));
        String telefono=request.getParameter("telefono");
        String mail=request.getParameter("mail");
        String direccion_Tienda=request.getParameter("direccion");
        String Contrasenia_Admin=request.getParameter("password");
        
        Administrador admin = control.traerAdministrador(adminId);
        
        admin.setTelefono(telefono);
        admin.setMail(mail);
        admin.setDireccion_Tienda(direccion_Tienda);
        admin.setContrasenia_Admin(Contrasenia_Admin);
        
        control.editarAdmin(admin);
        
        response.sendRedirect("admin.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
