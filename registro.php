<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VETERINARIA.COM</title>
    <link rel="stylesheet" href="css/style-registro.css">
    <link rel="icon" href="imagenes/icono.jpg">
</head>
<body>

    <section class="formulario">
        <?php
            require_once __DIR__."/procesos/validacion_registro.php";

        ?>
        <div >
            <div class="titulo">
            <img src="imagenes/icono.jpg" alt="">
            </div>
            <p>BIENVENIDO</p>
            <hr>
        </div>
        <form method="post" action="">
        <div class="iconos">
            <img src="imagenes/user.jpg" alt="" id="icono">
            <input type="text" name="user" placeholder="User" id="barra" required>
        </div>

        <div class="iconos">
            <img src="imagenes/user.jpg" alt="" id="icono">
            <input type="text" name="username" placeholder="Username" id="barra" required>
        </div>
        <div class="iconos">
            <img src="imagenes/correo.jpg" alt="" id="icono">
            <input type="email" name="email" placeholder="email" id="barra" required>
        </div>
        <div class="iconos">
            <img src="imagenes/password.jpg" alt="" id="icono">
            <input type="password" name="password" placeholder="Password" id="barra" required>
        </div>
        
        <div class="ingreso_login">
            <input type="submit" name="boton_login" value="REGISTRARSE" class="login">
        </div>
    
        </form>

    </section>

</body>
</html>

<?php
require_once __DIR__ . "/vendor/autoload.php";
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

// require_once(__DIR__."./controller/user.controller .php");

// if(isset($_POST['user']) && isset($_POST['username']) && isset($_POST['gmail']) && isset($_POST['password']) && isset($_POST['submit'])){
//     $hola = new User_Controller();
//     $hola->create();
// }
?>
