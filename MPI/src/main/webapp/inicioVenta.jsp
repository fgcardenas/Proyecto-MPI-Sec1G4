<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="logica.Articulo" %>
<%@ page import="logica.Controladora" %>

<% 
    Controladora control = new Controladora();
    List<Articulo> productos= control.getArticulos();
%>
<% 
    // Obtener el parámetro 'username' desde la URL
    String username = request.getParameter("username");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Catálogo - Rehobot</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
    <style>
        /* Fondo sólido para toda la página */
        body {
            background-color: #FFA500;  /* Naranja como ejemplo */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
        }
    </style>
    <<script>
        history.pushState(null, '', window.location.href);
        window.onpopstate = function() {
            history.pushState(null, '', window.location.href);
        };
    </script>

</head>
<body>
    <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
            <li class="nav-item d-flex align-items-center">
                <a class="nav-link active me-2" href="#!">Catálogo</a>
                <button class="btn btn-outline-secondary btn-sm" onclick="window.location.href='index.html';">
                    Cerrar sesión
                </button>
            </li>
        </ul>
        <div class="d-flex">
            <button class="btn btn-outline-dark" type="button" data-bs-toggle="modal" data-bs-target="#shoppingCartModal">
                <i class="bi-cart-fill me-1"></i>
                Carrito
                <span class="badge bg-dark text-white ms-1 rounded-pill" id="cart-count">0</span>
            </button>
        </div>
    </div>
</nav>

    <!-- Header -->
    <header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Catálogo</h1>
            <p class="lead fw-normal text-white-50 mb-0">
                <% if (username != null && !username.isEmpty()) { %>
                    ¡Bienvenido, <%= username %>!
                <% } else { %>
                    Los mejores productos del mercado
                <% } %>
            </p>
        </div>
    </div>
</header>
    
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-3 justify-content-center">
                <!-- Inicio del bucle para generar productos dinámicamente -->
                <%
                   
                    if (productos != null && !productos.isEmpty()) {
                        for (Articulo producto : productos) {
                        if(producto.getStock()!=0){
                            double precioArticulo = producto.getPrecio_Articulo(); // Asegura que sea de tipo double
                %>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Imagen del producto -->
                        <img class="card-img-top" src="<%= producto.getLink_Imagen() %>" alt="<%= producto.getNombre_Articulo() %>" />
                        <!-- Detalles del producto -->
                        <div class="card-body p-4 text-center">
                            <h5 class="fw-bolder"><%= producto.getNombre_Articulo() %></h5>
                            <p>$<%= String.format("%,.0f", precioArticulo) %> CLP</p>
                            <p>Stock: <%= producto.getStock() %> unidades</p>
                        </div>
                        <!-- Acciones del producto -->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                            <button class="btn btn-outline-dark add-to-cart"
                                    data-id="<%= producto.getId_Articulo() %>"
                                    data-name="<%= producto.getNombre_Articulo() %>"
                                    data-price="<%= precioArticulo %>"
                                    data-img="<%= producto.getLink_Imagen() %>"
                                    data-stock="<%= producto.getStock() %>">
                                Agregar al carrito
                            </button>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    } else {
                %>
                <p class="text-center">No hay productos disponibles en este momento.</p>
                <%
                    }
                %>
            </div>
                </div>
                    <div class="modal fade" id="shoppingCartModal" tabindex="-1" aria-labelledby="shoppingCartModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg"> <!-- Aquí agregamos la clase modal-lg -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="shoppingCartModalLabel">Carrito de Compras</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <ul id="cart-items" class="list-unstyled">
                            <!-- Items del carrito -->
                        </ul>
                        <div class="text-end">
                            <h5>Total: $<span id="cart-total">0</span> CLP</h5>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-success" id="finalizePurchaseButton">Finalizar Compra</button>
                    </div>
                </div>
            </div>
        </div>
            <!-- Modal de Confirmación de Compra -->
        <div class="modal fade" id="transactionModal" tabindex="-1" aria-labelledby="transactionModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="transactionModalLabel">Confirmación de Compra</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h5>Transacción: <span id="transaction-id"></span></h5>
                        <p>Fecha y Hora: <span id="transaction-date-time"></span></p>
                        <ul id="transaction-items" class="list-unstyled">
                            <!-- Aquí se mostrarán los productos de la compra -->
                        </ul>
                        <div class="text-end">
                            <h5>Total: $<span id="transaction-total">0</span> CLP</h5>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeTransactionModal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
            <!-- Modal para seleccionar método de pago -->
<div class="modal fade" id="paymentMethodModal" tabindex="-1" aria-labelledby="paymentMethodModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentMethodModalLabel">Seleccionar Método de Pago</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-grid gap-2">
                    <button class="btn btn-outline-primary payment-option" data-method="Efectivo">Efectivo</button>
                    <button class="btn btn-outline-secondary payment-option" data-method="Transferencia">Transferencia</button>
                    <button class="btn btn-outline-success payment-option" data-method="Tarjeta">Tarjeta</button>
                </div>
            </div>
        </div>
    </div>
</div>
            <!-- Modal para datos del cliente -->
<div class="modal fade" id="customerDataModal" tabindex="-1" aria-labelledby="customerDataModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customerDataModalLabel">Datos del Cliente</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="customerDataForm">
                    <div class="mb-3">
                        <label for="customerName" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="customerName" required>
                    </div>
                    <div class="mb-3">
    <label for="customerPhone" class="form-label">Teléfono</label>
    <input 
        type="text" 
        class="form-control" 
        id="customerPhone" 
        required 
        maxlength="9" 
        placeholder="Ingrese su número"
        oninput="this.value = this.value.replace(/[^0-9]/g, '');">
</div>
                    <div class="mb-3">
                        <label for="customerAddress" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="customerAddress" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="submitCustomerData">Continuar</button>
            </div>
        </div>
    </div>
</div>

        
           

    </section>
   <script>
       
    let cart = [];
    let total = 0;
    let selectedPaymentMethod = ""; // Variable para guardar el método de pago seleccionado
    const urlParams = new URLSearchParams(window.location.search);
    const username = urlParams.get('username');
    
    document.getElementById("closeTransactionModal").addEventListener("click", function() {
        location.reload(); // Recarga la página
    });
// Evento para agregar al carrito
  $(document).on("click", ".add-to-cart", function () {
            const id = $(this).data("id");
       const name = $(this).data("name");
       const price = parseFloat($(this).data("price"));
       const img = $(this).data("img");
       let stock = parseInt($(this).data("stock"), 10); // Asegurarse de que el stock sea un número entero
       const product = cart.find(item => item.name === name);

       if (product) {
           if (product.quantity < stock) {
               product.quantity += 1;
               total += price; // Actualizar el total
           } else {
               alert("No hay suficiente stock disponible.");
           }
       } else {
           if (stock > 0) {
               cart.push({ id, name, price, img, quantity: 1, stock: stock });
               total += price; // Actualizar el total
           } else {
               alert("No hay suficiente stock disponible.");
           }
       }
       console.log("id" +id);
       console.log("nombre: " + name);
       console.log("stock: " + stock);
       console.log("Carrito actualizado:", cart); // Mostrar el carrito en la consola

       renderCart(); // Renderizar el carrito
});

// Función para renderizar el carrito
function renderCart() {
    const $cartItems = $("#cart-items");
    $cartItems.empty();

    console.log("Renderizando carrito con los siguientes datos:", cart);

    cart.forEach((item, index) => {
        console.log("Datos del producto:", item); // Verifica que los datos estén correctos
        if (!item || !item.name || item.price === undefined || !item.img || !item.quantity) {
            console.error("Elemento inválido en el carrito:", item);
            return;
        }

        // Asignamos los valores a las nuevas constantes
        let stock = parseInt(item["stock"]);
        const productName = item["name"] || "Producto sin nombre";
        const productImage = item["img"] || "ruta/a/imagen_default.jpg";
        const productPriceFormatted = (item["price"] * item["quantity"]).toLocaleString("es-CL");

        // Verificamos si las variables tienen el valor correcto
        console.log("Nombre del producto: " + productName);
        console.log("Imagen del producto: " + productImage);
        console.log("Precio del producto: " + productPriceFormatted);
        console.log("Stock del producto: " + stock);

        // Generamos el HTML usando concatenación de cadenas
        const productHTML = 
            "<li class='d-flex justify-content-between align-items-center border-bottom pb-2'>" +
                "<div>" +
                    "<img src='" + productImage + "' alt='" + productName + "' width='50' class='me-2'>" +
                    "<span>" + productName + "</span>" +
                "</div>" +
                "<div class='d-flex align-items-center'>" +
                    "<input type='number' min='1' max='" + stock + "' value='" + item.quantity + "' " +
                        "class='form-control form-control-sm me-2 quantity-input' " +
                        "data-index='" + index + "'>" +
                    "<span>$" + productPriceFormatted + " CLP</span>" +
                    "<button class='btn btn-sm btn-danger ms-2 remove-item' data-index='" + index + "'>Remover</button>" +
                "</div>" +
            "</li>";

        // Verificar que el HTML se genera correctamente
        console.log("Producto HTML generado: " + productHTML);

        // Finalmente agregamos el HTML al carrito
        const $productElement = $(productHTML);
        $cartItems.append($productElement);

        // Agregar evento para limitar la cantidad al máximo permitido
        $productElement.find(".quantity-input").on("input", function () {
            const max = parseInt($(this).attr("max"), 10);
            if (this.value !== "") {
                const value = parseInt(this.value, 10);
                if (value > max) {
                    this.value = max; // Restringe al máximo permitido
                }
            }
        });
    });

    // Actualizar el contador del carrito y el total
    $("#cart-count").text(cart.reduce((sum, item) => sum + item.quantity, 0));
    $("#cart-total").text(total.toLocaleString("es-CL"));
}





// Eventos de actualización y eliminación
$(document).on("input", ".quantity-input", function () {
    const index = $(this).data("index");
    if (index === undefined || !cart[index]) {
        console.error("Índice inválido:", index);
        return;
    }

    let newQuantity = parseInt($(this).val());

    if (isNaN(newQuantity) || newQuantity < 1) {
        $(this).val(1);
        newQuantity = 1;
    }

    const item = cart[index];
    total += (newQuantity - item.quantity) * item.price;
    item.quantity = newQuantity;

    renderCart();
});
// Mostrar formulario de datos del cliente al finalizar la compra
$(".btn-success").off("click").on("click", function () {
    if (cart.length === 0) {
        alert("El carrito está vacío. Agrega productos antes de finalizar la compra.");
        return;
    }
    $("#customerDataModal").modal("show");
});
// Validar y procesar datos del cliente
$("#submitCustomerData").on("click", function () {
    const name = $("#customerName").val().trim();
    const phone = $("#customerPhone").val().trim();
    const address = $("#customerAddress").val().trim();

    if (!name || !phone || !address) {
        alert("Por favor, completa todos los campos.");
        return;
    }

    $("#customerDataModal").modal("hide");

    // Mostrar el modal de método de pago
    $("#paymentMethodModal").modal("show");
});
// Manejar selección de método de pago
$(".payment-option").on("click", function () {
    selectedPaymentMethod = $(this).data("method");

    // Resaltar el botón seleccionado y desactivar los otros
    $(".payment-option").removeClass("active");
    $(this).addClass("active");

    // Cerrar el modal
    $("#paymentMethodModal").modal("hide");

    // Continuar con la compra
    finalizarCompra();
});




$(document).on("click", ".remove-item", function () {
    const index = $(this).data("index");
    const item = cart[index];
    total -= item.price * item.quantity;
    cart.splice(index, 1);

    renderCart();
});

function finalizarCompra() {
    // Generar un identificador único para la transacción
    const transactionId = "TXN" + Math.floor(Math.random() * 1000000);
    const dateTime = new Date().toLocaleString("es-CL");
    
    $("#transaction-id").text(transactionId);
    $("#transaction-date-time").text(dateTime);
    idActual = transactionId; // Guardar ID actual para reutilizar

    const $transactionItems = $("#transaction-items");
    $transactionItems.empty(); // Limpiar lista previa

    // Agregar los detalles de cada producto al resumen de la transacción
    cart.forEach((item, index) => {
    // Verifica que los datos sean válidos
    if (!item || !item.name || item.price === undefined || !item.img || !item.quantity) {
        console.error("Elemento inválido en el carrito:", item);
        return;
    }
    
    // Asignamos los valores a las nuevas constantes
    const productName = item["name"] || "Producto sin nombre";
    const productImage = item["img"] || "ruta/a/imagen_default.jpg";
    const productPriceFormatted = (item["price"] * item["quantity"]).toLocaleString("es-CL");

    // Agregamos el contenido al carrito
     $transactionItems.append(
        '<li class="d-flex justify-content-between align-items-center border-bottom pb-2">' +
            '<span>' + productName + ' (x' + item.quantity + ')</span>' +
            '<span>$' + productPriceFormatted + ' CLP</span>' +
        '</li>'
    );
    let resta= item["stock"]-(item["quantity"]);
    let idBuscar=item["id"];
    console.log("resta: "+ resta);
    console.log("id: "+ idBuscar);
});

    // Agregar los datos del cliente y método de pago al resumen
$transactionItems.append(
    '<li class="mt-3">' +
        '<strong>Cliente:</strong> ' + $("#customerName").val().trim() + '<br>' +
        '<strong>Teléfono:</strong> ' + $("#customerPhone").val().trim() + '<br>' +
        '<strong>Dirección:</strong> ' + $("#customerAddress").val().trim() + '<br>' +
        '<strong>Método de Pago:</strong> ' + selectedPaymentMethod +
    '</li>'
);

// Mostrar el total de la transacción
$("#transaction-total").text(total.toLocaleString("es-CL"));

// Mostrar modal de resumen de transacción
$("#transactionModal").modal("show");

// Enviar datos al servidor para guardar la boleta
enviarDatosBoleta();



// Limpiar el formulario de datos del cliente
$("#customerDataForm")[0].reset();
}
// Reiniciar el carrito cuando se cierre el modal de confirmación de compra
$("#closeTransactionModal").on("click", function () {
    cart = []; // Vaciar carrito
    total = 0; // Reiniciar total
    renderCart(); // Refrescar la interfaz del carrito
});

function enviarDatosBoleta() {
    // Recopilar los datos necesarios
    const transactionId = idActual;
    const dateTime = new Date().toLocaleString("es-CL");
    const customerName = $("#customerName").val().trim();
    const customerPhone = $("#customerPhone").val().trim();
    const customerAddress = $("#customerAddress").val().trim();
    const paymentMethod = selectedPaymentMethod;
    const transactionTotal = total;


    // Preparar los productos como una lista de texto
    const items = cart.map(item => item["name"]+`(x`+item["quantity"]+`)`).join("\n");
    const stocks = cart.map(item => item["id"]+`-`+item["quantity"]).join(","); 
    
    console.log(items);
    console.log("Stocks: "+stocks)
    
    console.log("Transaction ID:", transactionId);
    console.log("Date and Time:", dateTime);
    console.log("Customer Name:", customerName);
    console.log("Customer Phone:", customerPhone);
    console.log("Customer Address:", customerAddress);
    console.log("Payment Method:", paymentMethod);
    console.log("Transaction Total:", transactionTotal);
    

    // Enviar datos al servidor utilizando AJAX
    $.post("SvVenta", {
        transactionId: transactionId,
        transactionDateTime: dateTime,
        customerName: customerName,
        customerPhone: customerPhone,
        customerAddress: customerAddress,
        paymentMethod: paymentMethod,
        transactionTotal: transactionTotal,
        items: items,
        username: username,
        stocks:stocks// Variable que deberías definir según tu contexto
    })
    .done(function (response) {
        // Manejar respuesta exitosa del servidor
        alert("La boleta se ha guardado exitosamente.");
    })
    .fail(function () {
        // Manejar error en la comunicación con el servidor
        alert("Error al guardar la boleta. Por favor, intenta nuevamente.");
    });

    // Reiniciar identificador único
    idActual = 0;
}




</script>
</body>
</html>