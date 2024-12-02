package servlets;

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
import logica.Compra;
import logica.Controladora;

@WebServlet(name = "SvCompra", urlPatterns = {"/SvCompra"})
public class SvCompra extends HttpServlet {
    
    Controladora control=new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Articulo> listaCompras=new ArrayList<Articulo>();  
        List<Integer> listaArticulos=new ArrayList<Integer>();  
        
        String usuario = request.getParameter("idUsuario");
        System.out.println("id 1: "+usuario);
        
        int idCliente=control.obtenerCliente(usuario);

       
        listaArticulos=control.traerCompra(idCliente);
        System.out.println("id 3: "+idCliente);
        listaCompras=control.buscarArticulos(listaArticulos);
                      
        HttpSession mySession=request.getSession();
        
        mySession.setAttribute("listaCompras",listaCompras);

        response.sendRedirect("carro.jsp");
        
    }
    
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idArticulo = Integer.parseInt(request.getParameter("idArticulo"));
        String usuario = request.getParameter("idUsuario");
        
        int idCliente=control.obtenerCliente(usuario);
        
        control.AgregarArticulo(idCliente,idArticulo);
        System.out.println("idCliente: "+ idCliente);
        response.sendRedirect("tienda.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
