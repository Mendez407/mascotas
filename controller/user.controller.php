<?php
require_once(__DIR__."/../Connection.php");
require_once(__DIR__."../../model/user.model.php");

class User_Controller{
    public function create(User $modelUser) {

        //     $contraseña=password_hash($password, PASSWORD_BCRYPT);
            $mysqli = new Connection();
            $mysqli = $mysqli->connect();
             $name  = $modelUser -> name = $mysqli-> real_escape_string($_POST['user']);
             $username  = $modelUser -> username =$mysqli ->real_escape_string($_POST['username']);
             $email  = $modelUser -> email= $mysqli->real_escape_string($_POST['email']);
             $password  = $modelUser -> password = $mysqli->real_escape_string(password_hash(($_POST['password']), PASSWORD_DEFAULT));
    
            $sql = "INSERT INTO mydb_base.user (nombre,username,email,password, Role_id,foto) VALUES ('$name','$username','$email','$password','1','null')";
            $result = $mysqli->query($sql);
    
            // if ($result->num_rows > 0) {
            //     echo "Registro creado con exito";
            // }
            // if (mysqli_num_rows($result) > 0) {
            echo "<div class='messageRegister'>Registro creado con exito</div>";
            // }
            // else {
                // echo "No se pudo crear registro";
            // }
            // $mysqli->close();
        }
    // }
}
?>