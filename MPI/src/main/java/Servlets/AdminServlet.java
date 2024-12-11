package Servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Administrador;
import logica.Controladora;
import java.util.List;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Administrador> listAdmin = control.traerAdministrador();
        
        HttpSession mySession= request.getSession();
        mySession.setAttribute("listaAdministrador", listAdmin);
        response.sendRedirect("inicioInventario.jsp");
        
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recibir datos del formulario
        String dni = request.getParameter("dni");
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        String nombreAdmin = name+" "+lastName;
        
        if(dni == null || name == null || lastName == null || phone == null || email == null || address == null || userName == null || password == null ||
                dni.isEmpty() || name.isEmpty() || lastName.isEmpty() || phone.isEmpty() || email.isEmpty() || address.isEmpty() || userName.isEmpty() ||
                dni.isBlank() || name.isBlank() || lastName.isBlank() || phone.isBlank() || email.isBlank() || address.isBlank() || userName.isBlank()){
           request.setAttribute("error", "Todos los campos deben estar completos");
           request.setAttribute("dni",dni);
           request.setAttribute("name",name);
           request.setAttribute("lastName",lastName);
           request.setAttribute("phone",phone);
           request.setAttribute("email",email);
           request.setAttribute("address",address);
           request.setAttribute("userName",userName);
           request.setAttribute("password",password); 
           request.getRequestDispatcher("admin.jsp").forward(request,response);
        }
        if(control.verificarDatosDuplicadosAdmin(dni, phone, email, userName)){
           request.setAttribute("error", "Algunos valores ya están relacionados a otros administradores, por favor revise las credenciales y verifique nuevamente");
           request.setAttribute("dni",dni);
           request.setAttribute("name",name);
           request.setAttribute("lastName",lastName);
           request.setAttribute("phone",phone);
           request.setAttribute("email",email);
           request.setAttribute("address",address);
           request.setAttribute("userName",userName);
           request.setAttribute("password",password);
           request.getRequestDispatcher("admin.jsp").forward(request,response); 
        } else {
            control.crearAdmin(nombreAdmin, password, phone, email, dni, address,userName);   
            request.setAttribute("mensaje", "Administrador registrado exitosamente.");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }    
    }
}
