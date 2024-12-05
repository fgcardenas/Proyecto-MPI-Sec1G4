package logica;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.Table;
import java.time.LocalDate;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Table(name="productos")
public class Articulo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_Articulo;
    private String nombre_Articulo;
    private String catergoria_Articulo;
    private int precio_Articulo;
    private int stock;
    private String link_Imagen;
    private String marca_Articulo;
    private LocalDate fechaVencimiento;

    // Constantes para los umbrales de stock
    private static final int UMBRAL_STOCK_BAJO = 5; // Ejemplo: alerta si el stock es menor o igual a 5

    // Constructor vacío
    public Articulo() {
    }

    // Constructor con parámetros
    public Articulo(String nombre_Articulo, String catergoria_Articulo, int precio_Articulo, int stock, String link_Imagen, String marca_Articulo, LocalDate fechaVencimiento) {
        this.nombre_Articulo = nombre_Articulo;
        this.catergoria_Articulo = catergoria_Articulo;
        this.precio_Articulo = precio_Articulo;
        this.stock = stock;
        this.link_Imagen = link_Imagen;
        this.marca_Articulo = marca_Articulo;
        this.fechaVencimiento = fechaVencimiento;
    }

    // Getters y setters
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

    public LocalDate getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(LocalDate fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    // Método para verificar si el artículo está vencido
    public boolean estaVencido() {
        if (fechaVencimiento == null) {
            return false; // Si no tiene fecha de vencimiento, no puede estar vencido
        }
        return LocalDate.now().isAfter(fechaVencimiento);
    }

    // Método para verificar si el stock es bajo
    public boolean esStockBajo() {
        return stock > 0 && stock <= UMBRAL_STOCK_BAJO;
    }

    // Método para verificar si no hay stock
    public boolean sinStock() {
        return stock <= 0;
    }

    // Método que lanza una alerta si el stock es bajo
    public String alertaStockBajo() {
        if (esStockBajo()) {
            return "Alerta: El stock del artículo '" + nombre_Articulo + "' es bajo. Quedan " + stock + " unidades.";
        }
        return "";
    }

    // Método que lanza una alerta si no hay stock
    public String alertaSinStock() {
        if (sinStock()) {
            return "Alerta: El artículo '" + nombre_Articulo + "' está agotado.";
        }
        return "";
    }
}
