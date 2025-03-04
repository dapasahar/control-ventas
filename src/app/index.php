<?php
if( empty($_POST['usuario']) ) {
    header('Location: ../');
}
?>

<h1>Bienvenido <?php echo $_POST['usuario']; ?></h1>

