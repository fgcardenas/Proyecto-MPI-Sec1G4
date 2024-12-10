package logica;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import persistencia.ControllerPersistencia;

public class Controladora {
       ControllerPersistencia controlPersis = new ControllerPersistencia();

    public Controladora() {
    }

    public void crearArticulo(String nombre_Articulo, String catergoria_Articulo, int precio_Articulo, int stock, String link_Imagen, String marca_Articulo, LocalDate fechaVencimiento) {
        Articulo articulo = new Articulo(nombre_Articulo, catergoria_Articulo, precio_Articulo, stock, link_Imagen, marca_Articulo, fechaVencimiento);
        this.controlPersis.crearArticulo(articulo);
    }
    public void actualizarArticulo(Articulo articulo){
        this.controlPersis.editarArticulo(articulo);
    }

    public List<Articulo> getArticulos() {
        return controlPersis.getArticulos();
    }

    public void crearAdmin(String nombre_Persona, String Contrasenia_Admin, String telefono, String mail, String rut_Persona, String direccion_Tienda, String username) {
        Administrador admin = new Administrador(direccion_Tienda, username, Contrasenia_Admin, nombre_Persona, telefono, mail, rut_Persona);
        this.controlPersis.crearAdmin(admin);
    }

    public List<Administrador> traerAdministrador() {
        return controlPersis.traerAdministrador();
    }
    
    public void crearVendedor(String name, String telefono, String mail, String rut, int sueldo, String direccion, String contrasenia, String username){
        Empleado seller = new Empleado(contrasenia,sueldo, name, telefono, mail, rut, direccion, username); 
        this.controlPersis.crearVendedor(seller);
    }
    public List<Empleado> traerEmpleados(){
        return controlPersis.traerEmpleados();
    }

      public void eliminarAdmin(int id) {
        controlPersis.eliminarAdmin(id);
    }

    public Administrador traerAdministrador(int id) {
        return controlPersis.traerAdministrador(id);
    }

    public void editarAdmin(Administrador admin) {
        controlPersis.editarAdmin(admin);
    }

    public boolean comprobarIngreso(String usuario, String contrasenia) {
        
        boolean ingreso=false;
        
        List<Administrador> listaAdmin=controlPersis.traerAdministrador();
        
        for(Administrador admin:listaAdmin){
            if(admin.getUsername().equals(usuario)){
                if(admin.getPasswordAdmin().equals(contrasenia)){
                    ingreso=true;
                }else{
                    ingreso=false;
                }
            }
        }
        
        return ingreso;
    }


    public boolean comprobarIngresoVendedor(String usuario, String contrasenia) {
       boolean ingreso=false;
        
        List<Empleado> listaSeller=new ArrayList<Empleado>();
        listaSeller=controlPersis.traerEmpleados();
        
        for(Empleado clien:listaSeller){
            if(clien.getUsername().equals(usuario)){
                if(clien.getContrasenia().equals(contrasenia)){
                    ingreso=true;
                }else{
                    ingreso=false;
                }
            }
            
        }
        return ingreso;
    }
    
    public Empleado obtenerVendedor(int id){
        return controlPersis.traerEmpleado(id);
    }

  
   public void AgregarArticulo(int idCliente, int idArticulo) {
        // Obtener lista de todos los artículos
        List<Articulo> listaArticulo = controlPersis.getArticulos();

        // Buscar y actualizar el artículo en la lista de artículos
        boolean articuloEncontrado = false;
        for (Articulo arti : listaArticulo) {
            System.out.println("arti: " + arti.getNombre_Articulo());
            if (arti.getId_Articulo() == idArticulo) {
                arti.setStock(arti.getStock() - 1);
                controlPersis.editarArticulo(arti);
                articuloEncontrado = true;
                break;
            }
        }

        if (!articuloEncontrado) {
            System.out.println("No se encontró el artículo con ID: " + idArticulo);
            return;  // Salir si el artículo no existe
        }

        // Obtener lista de compras
        List<Compra> listaCompra = controlPersis.traerCompras();
        boolean compraEncontrada = false;

        // Buscar la compra correspondiente al cliente
        for (Compra compra : listaCompra) {
            if (compra.getCliente() == idCliente) {
                compra.getArticulos().add(idArticulo); // Añadir idArticulo a la lista de la compra
                controlPersis.editarCompra(compra); // Guardar cambios en la compra
                compraEncontrada = true;
                System.out.println("Artículo añadido a la compra del cliente con ID: " + idCliente);
                break;
            }
        }

        // Si no se encontró ninguna compra para el cliente, crear una nueva
        if (!compraEncontrada) {
            Compra nuevaCompra = new Compra();
            nuevaCompra.setCliente(idCliente);
            List<Integer> listaCompraId = new ArrayList<>();
            listaCompraId.add(idArticulo);
            nuevaCompra.setArticulos(listaCompraId);

            controlPersis.crearCompra(nuevaCompra); // Guardar la nueva compra en la base de datos
            System.out.println("Nueva compra creada para el cliente con ID: " + idCliente + " y artículo añadido.");
        }
    }

    public List<Integer> traerCompra(int idCliente) {
        
        // Obtener lista de compras
        List<Compra> listaCompra = controlPersis.traerCompras();

        // Buscar la compra correspondiente al cliente
        for (Compra compra : listaCompra) {
            if (compra.getCliente() == idCliente) {
                return compra.getArticulos();
                
            }
        }
        return null;
    }

    public List<Articulo> buscarArticulos(List<Integer> listaArticulos) {
        
        List<Articulo> listaCompra=new ArrayList<Articulo>();
        
        for(int arti:listaArticulos){
            listaCompra.add((Articulo) controlPersis.buscarArticulos(arti));
        }
        
        return listaCompra;
        
    }
    public void eliminarProducto(int idProducto) {
        controlPersis.eliminarProducto(idProducto);
    }

    public void eliminarProducto(int idArticulo, int idUsuario) {
    // Obtener lista de compras
    List<Compra> listaCompra = controlPersis.traerCompras();
    
        for (Compra compra : listaCompra) {
            // Verificar si la compra corresponde al cliente indicado
            if (compra.getCliente() == idUsuario) {
                System.out.println("Cliente " + compra.getCliente());

                // Eliminar el idArticulo de la lista de artículos en la compra
                List<Integer> articulos = compra.getArticulos();
                if (articulos.remove(Integer.valueOf(idArticulo))) { // Eliminar si se encuentra
                    controlPersis.editarCompra(compra); // Guardar cambios en la compra
                    System.out.println("Se eliminó el artículo " + idArticulo);
                } else {
                    System.out.println("El artículo " + idArticulo + " no se encontró en la compra del cliente " + idUsuario);
                }
            }
        }

        // Obtener lista de todos los artículos
        List<Articulo> listaArticulo = controlPersis.getArticulos();

        // Buscar y actualizar el artículo en la lista de artículos
        boolean articuloEncontrado = false;
        for (Articulo arti : listaArticulo) {
            System.out.println("arti: " + arti.getNombre_Articulo());
            if (arti.getId_Articulo() == idArticulo) {
                arti.setStock(arti.getStock() + 1);
                controlPersis.editarArticulo(arti);
                articuloEncontrado = true;
                break;
            }
        }
        
    }
    public Articulo obtenerArticulo(int id){
        for(Articulo article: controlPersis.getArticulos()){
            if(article.getId_Articulo() == id){
                return article;
             }
        }
        return null;
    }
   


   

}
