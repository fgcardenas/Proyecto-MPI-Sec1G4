package Servlets;

import java.io.IOException;
import java.util.ArrayList;
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

        control.crearAdmin(nombreAdmin, password, phone, email, dni, address,userName);
        
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
