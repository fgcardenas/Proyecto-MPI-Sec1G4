import java.util.ArrayList;
import java.util.List;
public class StockManager {
    private List<Producto> productos; // Lista de productos en el inventario

    public StockManager() {
        this.productos = new ArrayList<>();
    }

    // niveles de stock y genera alertas

    public void verificarStock() {
        for (Producto producto : productos) {
            if (producto.getStock() < producto.getStockMinimo()) {
                generarAlerta(producto, TipoAlerta.STOCK_BAJO);
            }
        }
    }

    // Genera una alerta
    public void generarAlerta(Producto producto, TipoAlerta alerta) {
        System.out.println("ALERTA: El producto " + producto.getNombre() + " tiene un nivel bajo de stock.");
    }

    // Actualiza el stock o agrega un producto si no existe
    public boolean actualizarStock(int idProducto, int cantidad) {
        for (Producto producto : productos) {
            if (producto.getId() == idProducto) {
                int nuevoStock = producto.getCantidad() + cantidad;
                if (nuevoStock < 0) {
                    System.out.println("Error: No se puede tener stock negativo.");
                    return false;
                }
                producto.setCantidad(nuevoStock);
                System.out.println("El stock del producto " + producto.getNombre() + " se ha actualizado a " + nuevoStock);
                return true;
            }
        }

        System.out.println("Producto  " + idProducto + " no encontrado. Se agregará como nuevo.");
        Producto nuevoProducto = new Producto(idProducto, "Producto " + idProducto, cantidad, 10); // Stock mínimo predeterminado
        productos.add(nuevoProducto);
        System.out.println("Producto " + nuevoProducto.getNombre() + " agregado con un stock inicial de " + cantidad);
        return true;
    }

}
