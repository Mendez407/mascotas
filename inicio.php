<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VETERINARIA.COM</title>
    <link rel="stylesheet" href="css/style-inicio.css">
    <link rel="icon" href="imagenes/icono.jpg">
</head>

<body>
    <section class="formulario">
        
        <div >
            <div class="titulo">
            <img src="imagenes/icono.jpg" alt="">
            </div>
            <p>BIENVENIDO</p>
            <hr>
        </div>
        <form method="POST" action="inicio.php">
            <div class="iconos">
                
                <img src="imagenes/user.jpg" alt="" id="icono">
                <input type="text" placeholder="User" id="barra">
            </div>

            <div class="iconos">
                <img src="imagenes/password.jpg" alt="" id="icono">
                <input type="password" placeholder="Password" id="barra">
            </div>
            
            <div class="ingreso_login">
                <input type="submit" value="INICIAR SESIÓN" class="login" onclick="createC()">
            </div>
    
        </form>
        

    </section>


</body>
</html>

