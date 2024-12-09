package logica;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="vendedores")
public class Empleado extends Persona {
   private String sueldo_Empleado;
   private String contrasenia;
   private List<Compra> ventasRealizadas;

   public Empleado() {
   }

   public Empleado(String contrasenia, String sueldo_Empleado, String asistencia, String nombre_Persona, String telefono, String mail, String rut_Persona) {
      super( nombre_Persona, telefono, mail, rut_Persona);
      this.contrasenia = contrasenia;
      ventasRealizadas = new ArrayList<>();
   }

   public String getContrasenia() {
      return this.contrasenia;
   }

   public void setContrasenia(String contra) {
      this.contrasenia = contra;
   }

   public String getSueldo_Empleado() {
      return this.sueldo_Empleado;
   }

   public void setSueldo_Empleado(String sueldo_Empleado) {
      this.sueldo_Empleado = sueldo_Empleado;
   }
   
   public void addVenta(Compra compra){
       ventasRealizadas.add(compra);
   }
}
