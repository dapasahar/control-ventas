<?php
if (empty($_POST['usuario']) || empty($_POST['password'])) {
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

/* $sql = "SELECT * FROM `usuarios` WHERE `email` = '" . $_POST['usuario'] . "' AND `password` = SHA1('" . $_POST['password'] . "')";
echo $sql;
$result = $conn->query($sql); */

$sentencia = "SELECT * FROM usuarios WHERE email = ? AND password = SHA1(?)";
$result = $conn->execute_query($sentencia, array($_POST['usuario'], $_POST['password']));

if ($result->num_rows != 1) {
  header('Location: ../');
}

$userdata = $result->fetch_assoc();
?>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Control de Ventas</title>
    <link rel="stylesheet" href="../css/estilos.css">
    <script src="../js/code.js" defer></script>
</head>
<body>

<header>
    <img src="https://placehold.co/100x70" alt="Logotipo">
    <div>Bienvenido <?php echo $userdata['nombre'] . " " . $userdata['apellidos']; ?></div>
</header>

<div class="contenedor">
  <?php
  
  include 'includes/' . ($userdata['rol'] == "gestor" ? 'inicio-gestor.inc' : 'inicio-vendedor.inc');
  
  ?>
</div>

</body>
</html>








