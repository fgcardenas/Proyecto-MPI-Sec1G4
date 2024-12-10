package logica;

import java.util.List;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
@Entity
@Inheritance(
   strategy = InheritanceType.TABLE_PER_CLASS
)
public class Compra {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   private int id_Compra;
   private int cliente;
   
   @ElementCollection
   private List<Integer> lista_Articulos;  // Cambiado a List<Integer>
   private String direccionEnvio;
   private Empleado vendedor;
   private String[] datosCliente;
   

   public Compra() {
   }

   public Compra( int cliente, List<Integer> lista_Articulos, String direccionEnvio, Empleado vendedor) {
      this.cliente = cliente;
      this.lista_Articulos = lista_Articulos;
      this.direccionEnvio = direccionEnvio;
      this.vendedor = vendedor;
   }

   public int getId_Compra() {
      return this.id_Compra;
   }

   public void setId_Compra(int id_Compra) {
      this.id_Compra = id_Compra;
   }

   public int getCliente() {
      return this.cliente;
   }

   public void setCliente(int cliente) {
      this.cliente = cliente;
   }

   public List<Integer> getArticulos() {
      return this.lista_Articulos;
   }

   public void setArticulos(List<Integer> lista_Articulos) {
      this.lista_Articulos = lista_Articulos;
   }

   public String getDireccionEnvio() {
      return this.direccionEnvio;
   }

   public void setDireccionEnvio(String direccionEnvio) {
      this.direccionEnvio = direccionEnvio;
   }
   
   public String getVendedor(){
       return vendedor.getNombre_Persona();
   }
   
}
