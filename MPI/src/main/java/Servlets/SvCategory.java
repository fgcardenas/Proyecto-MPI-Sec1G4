package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Controladora;
import java.util.List;
import java.util.ArrayList;
import logica.Categoria;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SvCategory")
public class SvCategory extends HttpServlet {
    Controladora control = new Controladora();
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        List<Categoria> listaCategorias= control.getCategories();
        HttpSession mySession=request.getSession();
        
        mySession.setAttribute("listaCategorias",listaCategorias);
        
        response.sendRedirect("tienda.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_Categoria= Integer.parseInt(request.getParameter("idCategory"));
        String nombreCategoria=request.getParameter("NameCategory");
        String descrip=request.getParameter("descriptionCategory");

        control.crearCategoria(id_Categoria,nombreCategoria,descrip);
          
        response.sendRedirect("categories.jsp");
    } 
}
