package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logica.Articulo;
import logica.Controladora;

@WebServlet(name = "SvArticulo", urlPatterns = {"/SvArticulo"})
public class SvArticulo extends HttpServlet {

  Controladora control = new Controladora() ;
    
    
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        List<Articulo> listaArticulos=new ArrayList<Articulo>();  
        
        listaArticulos=control.getArticulos();
        HttpSession mySession=request.getSession();
        
        mySession.setAttribute("listaArticulos",listaArticulos);
        
        response.sendRedirect("tienda.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre_Articulo=request.getParameter("nombre_Articulo");
        String categoria_Articulo=request.getParameter("categoria_Articulo");
        String link_Imagen=request.getParameter("link_Imagen");
        String marca_Articulo=request.getParameter("marca_Articulo");
        
        int precio_Articulo=Integer.parseInt(request.getParameter("precio_Articulo"));
        int stock=Integer.parseInt(request.getParameter("stock"));

        
        System.out.println("El nombre del articulo es: "+nombre_Articulo);
        
        control.crearArticulo(nombre_Articulo, categoria_Articulo, precio_Articulo, stock, link_Imagen, marca_Articulo);
              
        System.out.println("El nombre del articulo es: "+nombre_Articulo);
        
        response.sendRedirect("indexAdmin.jsp");
    }

     
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
