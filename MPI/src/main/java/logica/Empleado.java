package logica;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="vendedores")
public class Empleado extends Persona {
   private int sueldo_Empleado;
   private String direccion;
   private String contrasenia;
   private String username;

   public Empleado() {
   }

   public Empleado(String contrasenia, int sueldo_Empleado, String nombre_Persona, String telefono, String mail, String rut_Persona, String direccion, String username) {
      super( nombre_Persona, telefono, mail, rut_Persona);
      this.contrasenia = contrasenia;
      this.direccion = direccion;
      this.username = username;
      this.sueldo_Empleado = sueldo_Empleado;
   }

   public String getContrasenia() {
      return this.contrasenia;
   }

   public void setContrasenia(String contra) {
      this.contrasenia = contra;
   }

   public int getSueldo_Empleado() {
      return this.sueldo_Empleado;
   }

   public void setSueldo_Empleado(int sueldo_Empleado) {
      this.sueldo_Empleado = sueldo_Empleado;
   }
   
   public String getDireccion(){
       return direccion;
   }
   public void setDireccion(String newdirection){
       this.direccion = newdirection;
   }
   
   public String getUsername(){
       return username;
   }
   
   public void setUsername(String user){
       this.username = user;
   }
}
