package logica;

import jakarta.persistence.Entity;

@Entity
public class Empleado extends Persona {
   private String puesto_Emplead;
   private String sueldo_Empleado;
   private String asistencia;

   public Empleado() {
   }

   public Empleado(String puesto_Emplead, String sueldo_Empleado, String asistencia, String nombre_Persona, String telefono, String mail, String rut_Persona) {
      super( nombre_Persona, telefono, mail, rut_Persona);
      this.puesto_Emplead = puesto_Emplead;
      this.sueldo_Empleado = sueldo_Empleado;
      this.asistencia = asistencia;
   }

   public String getPuesto_Emplead() {
      return this.puesto_Emplead;
   }

   public void setPuesto_Emplead(String puesto_Emplead) {
      this.puesto_Emplead = puesto_Emplead;
   }

   public String getSueldo_Empleado() {
      return this.sueldo_Empleado;
   }

   public void setSueldo_Empleado(String sueldo_Empleado) {
      this.sueldo_Empleado = sueldo_Empleado;
   }

   public String getAsistencia() {
      return this.asistencia;
   }

   public void setAsistencia(String asistencia) {
      this.asistencia = asistencia;
   }
}
