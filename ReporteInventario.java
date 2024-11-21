public class ReporteInventario {
    private List<Producto> productos;

    // Constructor
    public ReporteInventario(List<Producto> productos) {
        this.productos = productos;
    }

    // productos con bajo stock
    public String ListaProductosBajoStock() {
        StringBuilder reporte = new StringBuilder();
        reporte.append("Productos con bajo stock:\n");

        for (Producto producto : productos) {
            if (producto.getCantidad() > 0 && producto.getCantidad() < producto.getStockMinimo()) {
                reporte.append("- ").append(producto.getNombre())
                        .append(" (Stock: ").append(producto.getCantidad())
                        .append(", Stock mínimo: ").append(producto.getStockMinimo())
                        .append(")\n");
            }
        }

        return reporte.length() > 25 ? reporte.toString() : "No hay productos con bajo stock.\n";
    }

    // lista de productos agotados
    public String ListaProductosAgotados() {
        StringBuilder reporte = new StringBuilder();
        reporte.append("Productos agotados:\n");

        for (Producto producto : productos) {
            if (producto.getCantidad() == 0) {
                reporte.append("- ").append(producto.getNombre())
                        .append(" (ID: ").append(producto.getId())
                        .append(")\n");
            }
        }

        return reporte.length() > 20 ? reporte.toString() : "No hay productos agotados.\n";
    }

    // pronóstico de reabastecimiento stock mínimo y actual
    public String ListaPronosticoReabastecimiento() {
        StringBuilder reporte = new StringBuilder();
        reporte.append("Pronóstico de reabastecimiento:\n");

        for (Producto producto : productos) {
            if (producto.getCantidad() < producto.getStockMinimo()) {
                int cantidadNecesaria = producto.getStockMinimo() - producto.getCantidad();
                reporte.append("- ").append(producto.getNombre())
                        .append(" necesita ").append(cantidadNecesaria)
                        .append(" unidades para alcanzar el stock mínimo.\n");
            }
        }

        return reporte.length() > 30 ? reporte.toString() : "No hay productos que necesiten reabastecimiento.\n";
    }
}
