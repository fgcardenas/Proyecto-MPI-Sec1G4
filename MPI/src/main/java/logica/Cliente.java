package logica;

import jakarta.persistence.Entity;

@Entity
public class Cliente extends Persona {
   private String direccion_Cliente;
   private String Contrasenia_Cliente;
   
   public Cliente() {
   }

    public Cliente(String direccion_Cliente, String Contrasenia_Cliente, String nombre_Persona, String telefono, String mail, String rut_Persona) {
        super(nombre_Persona, telefono, mail, rut_Persona);
        this.direccion_Cliente = direccion_Cliente;
        this.Contrasenia_Cliente = Contrasenia_Cliente;
    }

   
  
   public String getDireccion_Cliente() {
      return this.direccion_Cliente;
   }

   public void setDireccion_Cliente(String direccion_Cliente) {
      this.direccion_Cliente = direccion_Cliente;
   }

    public String getPasswordCliente() {
        return Contrasenia_Cliente;
    }

    public void setContrasenia_Cliente(String Contrasenia_Cliente) {
        this.Contrasenia_Cliente = Contrasenia_Cliente;
    }
   
}
