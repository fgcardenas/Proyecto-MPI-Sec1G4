import java.time.LocalDate;

public class Producto {
    private int id;
    private String nombre;
    private float precio;
    private String descripcion;
    private int stock;
    private LocalDate fechaCaducidad;

    Producto(int id, String nombre, float precio, String descripcion, int stock, LocalDate fechaCaducidad) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.stock = stock;
        this.fechaCaducidad = fechaCaducidad;
    }

    public int getPrecio() {
        return (int) precio;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public int getStock() {
        return stock;
    }

    public LocalDate getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setPrecio(int nuevoPrecio) {
        this.precio = nuevoPrecio;
    }

    public void setDescripcion(String newDescrip) {
        this.descripcion = newDescrip;
    }

    public boolean setStock(int cant) {
        if (cant >= 0) {
            this.stock = cant;
            return true;
        } else {
            return false;
        }
    }
}
