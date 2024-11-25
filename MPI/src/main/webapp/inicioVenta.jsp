<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Catalogo - Rehobot</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#!">Rehobot</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" href="#!">Catalogo</a></li>
                </ul>
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
                <p class="lead fw-normal text-white-50 mb-0">Los mejores productos del mercado</p>
            </div>
        </div>
    </header>
    <!-- Section -->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-3 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image -->
                        <img class="card-img-top" src="https://cdn.discordapp.com/attachments/459134461045506048/1308962223204339732/IMG-20241009-WA0013.jpg?ex=673fd991&is=673e8811&hm=9f683d188c034d4e3124d179761c48ba2c4f72084a796ef81adc94ff114b8ef2&" alt="Mermelada Frambuesa" />
                        <!-- Product details -->
                        <div class="card-body p-4 text-center">
                            <h5 class="fw-bolder">Mermelada Frambuesa</h5>
                            <p>$25.960 CLP</p>
                        </div>
                        <!-- Product actions -->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                            <button class="btn btn-outline-dark add-to-cart" data-name="Mermelada Frambuesa" data-price="25960" data-img="https://cdn.discordapp.com/attachments/459134461045506048/1308962223204339732/IMG-20241009-WA0013.jpg?ex=673fd991&is=673e8811&hm=9f683d188c034d4e3124d179761c48ba2c4f72084a796ef81adc94ff114b8ef2&">
                                Agregar al carrito
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top product-img" src="https://cdn.discordapp.com/attachments/459134461045506048/1308971276647399514/IMG-20241009-WA0018.jpg?ex=673fe1ff&is=673e907f&hm=048ca77e7728c7977c62afbc8d75daa250c96a408bf8ac38982012028bbcc818&" alt="Mejorador Hallulla Panimix" />
                <div class="card-body p-4 text-center">
                    <h5 class="fw-bolder">Mejorador Hallulla Panimix</h5>
                    <p>$800 CLP</p>
                </div>
                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                    <button class="btn btn-outline-dark add-to-cart" data-name="Mejorador Hallulla Panimix" data-price="800" data-img="https://cdn.discordapp.com/attachments/459134461045506048/1308971276647399514/IMG-20241009-WA0018.jpg?ex=673fe1ff&is=673e907f&hm=048ca77e7728c7977c62afbc8d75daa250c96a408bf8ac38982012028bbcc818&">
                        Agregar al carrito
                    </button>
                </div>
            </div>
        </div>
            </div>
        </div>
    </section>
    <!-- Modal del carrito -->
    <div class="modal fade" id="shoppingCartModal" tabindex="-1" aria-labelledby="shoppingCartModalLabel" aria-hidden="true">
        <div class="modal-dialog">
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
                    <button type="button" class="btn btn-success">Finalizar Compra</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Script -->
    <script>
        let cart = [];
        let total = 0;

        $(".add-to-cart").on("click", function () {
            const name = $(this).data("name");
            const price = parseInt($(this).data("price"));
            const img = $(this).data("img");

            cart.push({ name, price, img });
            total += price;

            $("#cart-items").append(`
                <li class="d-flex justify-content-between align-items-center border-bottom pb-2">
                    <div>
                        <img src="${img}" alt="${name}" width="50" class="me-2">
                        <span>${name}</span>
                    </div>
                    <span>$${price.toLocaleString("es-CL")} CLP</span>
                </li>
            `);
            $("#cart-count").text(cart.length);
            $("#cart-total").text(total.toLocaleString("es-CL"));
        });
    </script>
</body>
</html>
