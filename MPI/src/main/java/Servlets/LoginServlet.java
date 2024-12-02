package Servlets;

import logica.Administrador;
import java.io.IOException;

import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import logica.Controladora;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    Controladora control = new Controladora();
    private ArrayList<Administrador> administrador;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("pass");
        
        boolean validation = false;
        validation = control.comprobarIngreso(userName, password);

        if(validation == true || validateMainAdmin(userName,password)){
            HttpSession mySession = request.getSession(true);
            mySession.setAttribute("userName", userName);
            response.sendRedirect("home.jsp");
        }else{
            response.sendRedirect("inicioInventario.jsp?error=1");
        }
    }
    private boolean validateMainAdmin (String userName, String password){
        return "Claudio".equals(userName) && "123".equals(password);
    }
    
}

