package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Administrador;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Lista estática para almacenar los administradores (en memoria)
    public static ArrayList<Administrador> admins = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recibir datos del formulario
        String dni = request.getParameter("DNIAdmin");
        String name = request.getParameter("NameAdmin");
        String lastName = request.getParameter("LastNameAdmin");
        String phone = request.getParameter("phoneAdmin");
        String email = request.getParameter("emailAdmin");
        String address = request.getParameter("addressAdmin");
        String userName = request.getParameter("UserNameAdmin");
        String password = request.getParameter("passwordAdmin");

        // Crear el nuevo administrador
        Administrador admin = new Administrador(dni, name, lastName, phone, email, address, userName, password);
        
        // Almacenar el administrador en la lista (en memoria)
        admins.add(admin);

        // Redirigir a la lista de administradores
        request.setAttribute("admins", admins);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
