package logica;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;

@Entity
@Inheritance(
   strategy = InheritanceType.TABLE_PER_CLASS
)
public class Persona {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   private int id_Persona;
   private String nombre_Persona;
   private String telefono;
   private String mail;
   private String rut_Persona;
   private static int contadorId = 1;

   public Persona() {
   }

   public Persona(String nombre_Persona, String telefono, String mail, String rut_Persona) {
      this.id_Persona = contadorId++;
      this.nombre_Persona = nombre_Persona;
      this.telefono = telefono;
      this.mail = mail;
      this.rut_Persona = rut_Persona;
   }

   public int getId_Persona() {
      return this.id_Persona;
   }

   public void setId_Persona(int id_Persona) {
      this.id_Persona = id_Persona;
   }

   public String getNombre_Persona() {
      return this.nombre_Persona;
   }

   public void setNombre_Persona(String nombre_Persona) {
      this.nombre_Persona = nombre_Persona;
   }

   public String getTelefono() {
      return this.telefono;
   }

   public void setTelefono(String telefono) {
      this.telefono = telefono;
   }

   public String getMail() {
      return this.mail;
   }

   public void setMail(String mail) {
      this.mail = mail;
   }

   public String getRut_Persona() {
      return this.rut_Persona;
   }

   public void setRut_Persona(String rut_Persona) {
      this.rut_Persona = rut_Persona;
   }
}
