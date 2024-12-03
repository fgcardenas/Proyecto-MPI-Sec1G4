package logica;

import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table (name="administradores")
public class Administrador extends Persona implements Serializable {
   private String direccion_Tienda;
   private String Contrasenia_Admin;
   private String username;
   

   public Administrador() {
   }

    public Administrador(String direccion_Tienda,String username, String Contrasenia_Admin, String nombre_Persona, String telefono, String mail, String rut_Persona) {
        super(nombre_Persona, telefono, mail, rut_Persona);  // Aquí el id se genera en la clase padre
        this.direccion_Tienda = direccion_Tienda;
        this.username = username;
        this.Contrasenia_Admin = Contrasenia_Admin;
    }


   public String getUsername(){
       return username;
   }
   public String getDireccion_Tienda() {
      return this.direccion_Tienda;
   }

   public void setDireccion_Tienda(String direccion_Tienda) {
      this.direccion_Tienda = direccion_Tienda;
   }

    public String getPasswordAdmin() {
        return Contrasenia_Admin;
    }

    public void setContrasenia_Admin(String Contrasenia_Admin) {
        this.Contrasenia_Admin = Contrasenia_Admin;
    }
    
    public void setUsername(String user){
        this.username = user;
    }
   
}
