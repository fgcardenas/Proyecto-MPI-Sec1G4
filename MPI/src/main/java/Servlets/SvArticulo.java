package Servlets;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import logica.Articulo;
import logica.Controladora;

@WebServlet("/SvArticulo")
@MultipartConfig // Permite manejar archivos subidos
public class SvArticulo extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Articulo> listaArticulos = new ArrayList<>();
        listaArticulos = control.getArticulos();
        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaArticulos", listaArticulos);
        response.sendRedirect("inicioVenta.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Capturar los valores del formulario
        String nombreArticulo = request.getParameter("nombre_Articulo");
        String categoriaArticulo = request.getParameter("categoria_Articulo");
        int precioArticulo = Integer.parseInt(request.getParameter("precio_Articulo"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String marcaArticulo = request.getParameter("marca_Articulo");
        String linkImagen = request.getParameter("link_Imagen");
        String fechaVencimientoStr = request.getParameter("fechaVencimiento");
        
        if ("imagen_Articulo".isEmpty() || fechaVencimientoStr.isEmpty() || fechaVencimientoStr.isBlank() ){
            
        }
        // Convertir fecha de vencimiento a LocalDate
        LocalDate fechaVencimiento = null;
        if (fechaVencimientoStr != null && !fechaVencimientoStr.isEmpty()) {
            fechaVencimiento = LocalDate.parse(fechaVencimientoStr, DateTimeFormatter.ISO_DATE);
        }

        // Manejar la carga de la imagen
        Part imagenPart = request.getPart("imagen_Articulo"); // El nombre del input file en el formulario
        String rutaImagenRelativa = null;

        if (imagenPart != null && imagenPart.getSize() > 0) {
            // Definir ruta de almacenamiento
            String rutaImagenes = getServletContext().getRealPath("") + File.separator + "img";
            File directorio = new File(rutaImagenes);
            if (!directorio.exists()) {
                directorio.mkdirs(); // Crear el directorio si no existe
            }

            // Generar un nombre único para la imagen
            String nombreArchivo = System.currentTimeMillis() + "_" + imagenPart.getSubmittedFileName();
            String rutaArchivo = rutaImagenes + File.separator + nombreArchivo;

            // Guardar la imagen
            imagenPart.write(rutaArchivo);

            // Ruta relativa para almacenar en la base de datos
            rutaImagenRelativa = "img/" + nombreArchivo;
        }
        

        // Usar rutaImagenRelativa en lugar del linkImagen si se subió una imagen
        String rutaFinalImagen = (rutaImagenRelativa != null) ? rutaImagenRelativa : linkImagen;

        // Crear el artículo y persistir
        control.crearArticulo(nombreArticulo, categoriaArticulo, precioArticulo, stock, rutaFinalImagen, marcaArticulo, fechaVencimiento);
        request.setAttribute("mensaje","Producto registrado exitosamente");
        request.getRequestDispatcher("products.jsp").forward(request,response);
        
    }
}
