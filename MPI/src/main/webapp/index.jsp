

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REHOBOT - Insumos de Panadería</title>
    <style>
        /* Estilos generales */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
        font-family: 'Arial', sans-serif;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        min-height: 100vh;
        background: url('https://images.unsplash.com/photo-1604908177636-73343d4b5954?crop=entropy&fit=crop&w=1920&q=80') no-repeat center center/cover;
        color: white;
        }


        /* Superposición de fondo */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        /* Encabezado */
        header {
            width: 100%;
            padding: 20px 0;
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
        }

        header h1 {
            font-size: 3rem;
            color: #FFD700; /* Dorado para reflejar el pan recién horneado */
            letter-spacing: 3px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        /* Contenido principal */
        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            gap: 30px;
            width: 100%;
            padding: 20px;
        }

        main h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #FFD700;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .button-container {
            display: flex;
            gap: 40px;
        }

        /* Botones */
        button {
            background: #FF8C00; /* Naranja cálido */
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        }

        button:hover {
            background-color: #FFD700;
            color: #333;
            transform: translateY(-5px);
            box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.3);
        }

        button:active {
            transform: translateY(0);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        }

        /* Pie de página */
        footer {
            width: 100%;
            text-align: center;
            padding: 15px 0;
            background: rgba(255, 255, 255, 0.1);
            font-size: 1rem;
            color: #FFD700;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
    <!-- Encabezado -->
    <header>
        <h1>REHOBOT</h1>
    </header>
  
    <!-- Contenido principal -->
    <main>
        <h2>Insumos de Panadería de Calidad</h2>
        <p>Elige cómo deseas continuar:</p>
        <div class="button-container">
            <button onclick="location.href='inicioInventario.jsp'">Administrador</button>
            <button onclick="location.href='inicioVenta.jsp'">Cliente</button>
        </div>
    </main>

    <!-- Pie de página -->
    <footer>
        &copy; 2024 REHOBOT. Todo lo que necesitas para tu panadería.
    </footer>
</body>
</html>
