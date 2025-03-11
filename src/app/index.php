<?php
if( empty($_POST['usuario']) || empty($_POST['password']) ) {
    header('Location: ../');
}

// region --- Conexión a la BBDD ---
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "control-ventas";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// endregion

$sql = "SELECT * FROM `usuarios` WHERE `nombre_usuario` = '".$_POST['usuario']."' AND `password` = '".$_POST['password']."'";
$result = $conn->query($sql);

if ($result->num_rows == 0) {
    header('Location: ../');
}

?>

<h1>Bienvenido <?php echo $_POST['usuario']; ?></h1>

