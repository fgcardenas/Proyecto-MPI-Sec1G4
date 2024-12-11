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
    
    public List<Compra> getCompras(){
        return controlPersis.getCompras();
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
    
    public boolean verificarDatosDuplicadosVendedor(String rut, String telefono, String mail, String username){
        List<Empleado> seller = controlPersis.traerEmpleados();
        
        for(Empleado emp: seller){
            if (emp.getRut_Persona().equals(rut) || emp.getMail().equals(mail) || emp.getTelefono().equals(telefono) || emp.getUsername().equals(username)) return true;
        }
        
        return false;
    }
    
    public boolean verificarDatosDuplicadosAdmin(String rut, String telefono, String mail, String username){
        List<Administrador> admin = controlPersis.traerAdministrador();
        
        for(Administrador emp: admin){
            if (emp.getRut_Persona().equals(rut) || emp.getMail().equals(mail) || emp.getTelefono().equals(telefono) || emp.getUsername().equals(username)) return true;
        }
        
        return false;
    }
    
    public void crearCompra(String idCompra,String fecha, String lista_Articulos, String direccionEnvio, String vendedor, String nombreCliente, String telefonoCliente, int monto, String metodoPago){
        Compra compra = new Compra(idCompra,fecha, lista_Articulos,direccionEnvio, vendedor, nombreCliente, telefonoCliente, monto,metodoPago );
        this.controlPersis.crearCompra(compra);
    }
    public List<Empleado> traerEmpleados(){
        return controlPersis.traerEmpleados();
    }
    public void eliminarVendedor(int id){
        controlPersis.eliminarEmpleado(id);
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
    public void editarVendedor(Empleado seller){
        controlPersis.editarVendedor(seller);
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


    public Empleado comprobarIngresoVendedor(String usuario, String contrasenia) {
        
        List<Empleado> listaSeller=new ArrayList<Empleado>();
        listaSeller=controlPersis.traerEmpleados();
        
        for(Empleado clien:listaSeller){
            if(clien.getUsername().equals(usuario)){
                if(clien.getContrasenia().equals(contrasenia)){
                    return clien;
                }
            }
            
        }
        return null;
    }
    
    public Empleado obtenerVendedor(int id){
        return controlPersis.traerEmpleado(id);
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
    public Articulo obtenerArticulo(int id){
        for(Articulo article: controlPersis.getArticulos()){
            if(article.getId_Articulo() == id){
                return article;
             }
        }
        return null;
    }

    
   


   

}
