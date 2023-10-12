<h1>BIENVENIDOS <br>VETERINARIA AMIGOS FELICES</h1>
<h2>ES UN PLACER CONTAR CON SU PRESENCIA</h2>
<?php
require_once __DIR__ . "/vendor/autoload.php";
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

require_once(__DIR__ . '/controller/Connection.php');


$conn = new Connection ;
$conn->connect();
if (isset($_SESSION['user'])) {
    echo "<br/>";
    echo "\n \n  no se ha logueado";
    session_start();
    $_SESSION['user'] = "lola";
} else {
    global $_SESSION;
    echo "<br/>";
    echo "\n \n   se ha logueado";
    echo  $_SESSION['user'] ?? "HOlA";
    echo DIRECTORY_SEPARATOR;
}
?>

