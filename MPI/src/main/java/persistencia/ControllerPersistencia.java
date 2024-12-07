package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Administrador;
import logica.Articulo;
import logica.Cliente;
import logica.Compra;
import logica.Persona;
import persistencia.exceptions.NonexistentEntityException;

public class ControllerPersistencia {
   AdministradorJpaController AdminJPA = new AdministradorJpaController();
   ArticuloJpaController ArtiJPA = new ArticuloJpaController();
   ClienteJpaController ClienJPA = new ClienteJpaController();
   CompraJpaController CompraJPA = new CompraJpaController();
   EmpleadoJpaController EmpJPA = new EmpleadoJpaController();
   PersonaJpaController PersoJPA = new PersonaJpaController();

   public ControllerPersistencia() {
   }

   public void crearAdmin(Administrador admin) {
      this.AdminJPA.create(admin);
      System.out.println("Hola");
   }

    public void crearArticulo(Articulo articulo) {
        this.ArtiJPA.create(articulo);
        System.out.println("Hola");
        
    }
    

    public List<Articulo> getArticulos() {
        return ArtiJPA.findArticuloEntities();
        
    }
    
    public void editarArticulo(Articulo arti) {
       try {
           this.ArtiJPA.edit(arti);
       } catch (Exception ex) {
           Logger.getLogger(ControllerPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public List<Administrador> traerAdministrador() {
        return AdminJPA.findAdministradorEntities();

    }

    public void eliminarAdmin(int id) {
       try {
           AdminJPA.destroy(id);
       } catch (NonexistentEntityException ex) {
           Logger.getLogger(ControllerPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public Administrador traerAdministrador(int id) {
       return AdminJPA.findAdministrador(id);
    }

    public void editarAdmin(Administrador admin) {
       try {
           AdminJPA.edit(admin);
       } catch (Exception ex) {
           Logger.getLogger(ControllerPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public void crearCliente(Cliente clien) {
        this.ClienJPA.create(clien);
    }

    public List<Cliente> traerCliente() {
        return ClienJPA.findClienteEntities();
    }

    public void crearCompra(Compra compra) {
        this.CompraJPA.create(compra);
 
    }
    public List<Compra> traerCompras() {
        return CompraJPA.findCompraEntities();
    }

    public void editarCompra(Compra compra) {
       try {
           this.CompraJPA.edit(compra);
       } catch (Exception ex) {
           Logger.getLogger(ControllerPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public Articulo buscarArticulos(int arti) {
        return ArtiJPA.findArticulo(arti);
    }

    public void eliminarProducto(int id) {
       try {
           this.ArtiJPA.destroy(id);
       } catch (NonexistentEntityException ex) {
           Logger.getLogger(ControllerPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
    public void editarProducto(Articulo articulo){
        try{
            this.ArtiJPA.edit(articulo);
        }catch (Exception e){
            Logger.getLogger(ControllerPersistencia.class.getName()).log(Level.SEVERE, null,e);
        }
    }
 
  
    
   
}