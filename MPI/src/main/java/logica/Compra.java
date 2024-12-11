package logica;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.Table;
@Entity
@Inheritance(
   strategy = InheritanceType.TABLE_PER_CLASS
)
@Table(name="ventas")
public class Compra {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   private String id_Compra;
   private String fechaBoleta;
   private String lista_Articulos;  // Cambiado a List<Integer>
   private String direccionEnvio;
   private String vendedor;
   private String nombreCliente;
   private String telefonoCliente;
   private int montoTotal;
   private String metodoPago;
   

   public Compra() {
   }

   public Compra( String id_Compra,String fecha, String lista_Articulos, String direccionEnvio, String vendedor, String nombreCliente, String telefonoCliente, int monto, String metodoPago) {
      this.id_Compra = id_Compra;
      this.fechaBoleta = fecha;
      this.lista_Articulos = lista_Articulos;
      this.direccionEnvio = direccionEnvio;
      this.vendedor = vendedor;
      this.nombreCliente=nombreCliente;
      this.telefonoCliente = telefonoCliente;
      this.montoTotal = monto;
      this.metodoPago = metodoPago;
   }

   public String getId_Compra() {
      return this.id_Compra;
   }

   public void setId_Compra(String id_Compra) {
      this.id_Compra = id_Compra;
   }

   public String getFecha() {
      return this.fechaBoleta;
   }

   public void setCliente(String fecha) {
      this.fechaBoleta = fecha;
   }

   public String getArticulos() {
      return this.lista_Articulos;
   }

   public void setArticulos(String lista_Articulos) {
      this.lista_Articulos = lista_Articulos;
   }

   public String getDireccionEnvio() {
      return this.direccionEnvio;
   }

   public void setDireccionEnvio(String direccionEnvio) {
      this.direccionEnvio = direccionEnvio;
   }
   
   public String getVendedor(){
       return vendedor;
   }
   
   public String getCliente(){
       return nombreCliente;
   }
   public String getPhoneClient(){
       return telefonoCliente;
   }
   public int getMontoTotal(){
       return montoTotal;
   }
   
   public String getMetodoPago(){
       return String.valueOf(metodoPago);
   }
}
