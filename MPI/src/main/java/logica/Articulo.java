package logica;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
@Inheritance(
   strategy = InheritanceType.TABLE_PER_CLASS
)
public class Articulo {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   private int id_Articulo;
   private String nombre_Articulo;
   private String catergoria_Articulo;
   private int precio_Articulo;
   private int stock;
   private String link_Imagen;
   private String marca_Articulo;
   
   public Articulo() {
   }

    public Articulo(String nombre_Articulo, String catergoria_Articulo, int precio_Articulo, int stock, String link_Imagen, String marca_Articulo) {
        this.nombre_Articulo = nombre_Articulo;
        this.catergoria_Articulo = catergoria_Articulo;
        this.precio_Articulo = precio_Articulo;
        this.stock = stock;
        this.link_Imagen = link_Imagen;
        this.marca_Articulo = marca_Articulo;
    }



   public int getId_Articulo() {
      return this.id_Articulo;
   }

   public void setId_Articulo(int id_Articulo) {
      this.id_Articulo = id_Articulo;
   }

   public String getNombre_Articulo() {
      return this.nombre_Articulo;
   }

   public void setNombre_Articulo(String nombre_Articulo) {
      this.nombre_Articulo = nombre_Articulo;
   }

   public String getCatergoria_Articulo() {
      return this.catergoria_Articulo;
   }

   public void setCatergoria_Articulo(String catergoria_Articulo) {
      this.catergoria_Articulo = catergoria_Articulo;
   }

   public int getPrecio_Articulo() {
      return this.precio_Articulo;
   }

   public void setPrecio_Articulo(int precio_Articulo) {
      this.precio_Articulo = precio_Articulo;
   }

   public int getStock() {
      return this.stock;
   }

   public void setStock(int stock) {
      this.stock = stock;
   }

    public String getLink_Imagen() {
        return link_Imagen;
    }

    public void setLink_Imagen(String link_Imagen) {
        this.link_Imagen = link_Imagen;
    }

    public String getMarca_Articulo() {
        return marca_Articulo;
    }

    public void setMarca_Articulo(String marca_Articulo) {
        this.marca_Articulo = marca_Articulo;
    }
   
}
