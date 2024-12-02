package servlets;

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


@WebServlet(name = "SvEditarAdmin", urlPatterns = {"/SvEditarAdmin"})
public class SvEditarAdmin extends HttpServlet {

    Controladora control =new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        Administrador admin=control.traerAdministrador(id);
        
        HttpSession mySession= request.getSession();
        
        mySession.setAttribute("AdminEditar",admin);
        
        response.sendRedirect("edicionAdmin.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre_Persona=request.getParameter("nombre_Persona");
        String telefono=request.getParameter("telefono");
        String mail=request.getParameter("mail");
        String rut_Persona=request.getParameter("rut_Persona");
        String direccion_Tienda=request.getParameter("direccion_Tienda");
        String Contrasenia_Admin=request.getParameter("Contrasenia_Admin");
        
        Administrador admin= (Administrador) request.getSession().getAttribute("AdminEditar");
        
        admin.setNombre_Persona(nombre_Persona);
        admin.setTelefono(telefono);
        admin.setMail(mail);
        admin.setRut_Persona(rut_Persona);
        admin.setDireccion_Tienda(direccion_Tienda);
        admin.setContrasenia_Admin(Contrasenia_Admin);
        
        control.editarAdmin(admin);
        
        response.sendRedirect("trabajadores.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
