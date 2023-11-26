<?php
include_once(__DIR__ . "/../Connection.php");
include_once __DIR__ . "/../controller/user.controller.php";
include_once __DIR__ . "/../model/user.model.php";

if (isset($_POST['login_button'])) {
    $mysqli = (new Connection())->connect();

    if (empty($_POST['username']) && (empty($_POST['passwordUser']))) {
        echo "LOS CAMPOS ESTAN VACIOS";
    } else {
        $userName = $mysqli->real_escape_string($_POST['username']);
        $userPassword = $mysqli->real_escape_string($_POST['passwordUser']);

        $sql = "SELECT id,username,password FROM user WHERE username = '$userName'";
        $result = $mysqli->query($sql);
        $cont=$result->fetch_object();

        if ($result->num_rows > 0) {

            
            // $hashedPassword = $row['password'];

            $verify = password_verify($userPassword, $cont['password']);

            if ($verify) {
                // session_start();
                $_SESSION["authenticated"] = true;
                $_SESSION['id'] = $cont->id;
                $_SESSION['username'] = $cont->username;
                echo $_SESSION['id'];
                echo $_SESSION['username'];
                header("location:sesion-user.php");
            } else {
                echo "ACCESO DENEGADO";
            }
        } else {
            echo "ACCESO DENEGADO";
        }
    }
}
if (isset($_POST["boton_login"])) {
    header("location:registro.php");
}
