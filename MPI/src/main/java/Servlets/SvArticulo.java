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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import logica.Articulo;
import logica.Controladora;

@WebServlet("/SvArticulo")
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
        
        response.sendRedirect("products.jsp");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Capturar los valores del formulario
        String nombreArticulo = request.getParameter("nombre_Articulo");
        String categoriaArticulo = request.getParameter("categoria_Articulo");
        int precioArticulo = Integer.parseInt(request.getParameter("precio_Articulo"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String marcaArticulo = request.getParameter("marca_Articulo");
        String linkImagen = request.getParameter("link_Imagen");
        String fechaVencimientoStr = request.getParameter("fechaVencimiento");

        // Convertir fecha de vencimiento a LocalDate
        LocalDate fechaVencimiento = null;
        if (fechaVencimientoStr != null && !fechaVencimientoStr.isEmpty()) {
            fechaVencimiento = LocalDate.parse(fechaVencimientoStr, DateTimeFormatter.ISO_DATE);
        }
          // Crear el artículo y persistir
       
        control.crearArticulo(nombreArticulo, categoriaArticulo, precioArticulo, stock, linkImagen, marcaArticulo, fechaVencimiento);

        // Redirigir o devolver respuesta
        response.sendRedirect("products.jsp"); // Página de éxito o mensaje

     
    }
}
