<?php
include_once(__DIR__."/../Connection.php");
include_once __DIR__."/../controller/user.controller.php" ;
include_once __DIR__."/../model/user.model.php" ;
if(isset($_POST['boton_login'])){
    $mysqli = (new Connection) -> connect();
    $userName = $mysqli -> real_escape_string($_POST['username']);
    $userEmail = $_POST['email'];
    $userEmail = $mysqli -> real_escape_string($userEmail);
    // $mysqli = Connection::connect();
    // $mysqli = $this -> connect();
    $sqlNameEmail = "select * from user where username = '$userName' or email = '$userEmail'";
    $result = $mysqli -> query($sqlNameEmail);
    if(mysqli_num_rows($result) > 0){        
        echo "<div style='text-align:center; padding:.4vh; background-color:red;'>Datos en uso</div>";
    }else{

        $modelUser = new user;
        (new User_Controller) -> create($modelUser);
    }
}