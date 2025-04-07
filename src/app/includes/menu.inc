<?php

// FIXME: Usuario de pruebas hasta que se implemente el login

$userdata = [
  'rol' => 'gestor',
  'nombre' => 'Gestor',
  'apellidos' => 'De Pruebas',
  'id' => 3
];
require_once 'control-ventas.inc';

?>


<header>
    <a href="./">
        <img src="https://placehold.co/100x70" alt="Logotipo">
    </a>
    <div>Bienvenido <?php echo $userdata['nombre'] . " " . $userdata['apellidos']; ?></div>
</header>
