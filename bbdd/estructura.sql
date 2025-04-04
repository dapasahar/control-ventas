-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2025 a las 13:42:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control-ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `nombre` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `email` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestores`
--

CREATE TABLE `gestores` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menciones_clientes`
--

CREATE TABLE `menciones_clientes` (
  `nota` int(11) NOT NULL,
  `cliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menciones_vendedores`
--

CREATE TABLE `menciones_vendedores` (
  `nota` int(11) NOT NULL,
  `vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menciones_ventas`
--

CREATE TABLE `menciones_ventas` (
  `nota` int(11) NOT NULL,
  `venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `autor` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `notas_menciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `notas_menciones` (
`id` int(11)
,`autor` int(11)
,`titulo` varchar(255)
,`contenido` text
,`fecha` date
,`vendedor` int(11)
,`cliente` varchar(100)
,`venta` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuarios` (
`id` int(11)
,`email` varchar(254)
,`nombre` varchar(50)
,`apellidos` varchar(100)
,`telefono` varchar(15)
,`password` varchar(100)
,`rol` varchar(8)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuarios_gestores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuarios_gestores` (
`id` int(11)
,`email` varchar(254)
,`nombre` varchar(50)
,`apellidos` varchar(100)
,`telefono` varchar(15)
,`password` varchar(100)
,`rol` varchar(6)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuarios_vendedores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuarios_vendedores` (
`id` int(11)
,`email` varchar(254)
,`nombre` varchar(50)
,`apellidos` varchar(100)
,`telefono` varchar(15)
,`password` varchar(100)
,`rol` varchar(8)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `total` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura para la vista `notas_menciones`
--
DROP TABLE IF EXISTS `notas_menciones`;

CREATE VIEW `notas_menciones`  AS SELECT `notas`.`id` AS `id`, `notas`.`autor` AS `autor`, `notas`.`titulo` AS `titulo`, `notas`.`contenido` AS `contenido`, `notas`.`fecha` AS `fecha`, `menciones_vendedores`.`vendedor` AS `vendedor`, `menciones_clientes`.`cliente` AS `cliente`, `menciones_ventas`.`venta` AS `venta` FROM (((`notas` left join `menciones_vendedores` on(`notas`.`id` = `menciones_vendedores`.`nota`)) left join `menciones_clientes` on(`notas`.`id` = `menciones_clientes`.`nota`)) left join `menciones_ventas` on(`notas`.`id` = `menciones_ventas`.`nota`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usuarios`
--
DROP TABLE IF EXISTS `usuarios`;

CREATE VIEW `usuarios`  AS SELECT `usuarios_vendedores`.`id` AS `id`, `usuarios_vendedores`.`email` AS `email`, `usuarios_vendedores`.`nombre` AS `nombre`, `usuarios_vendedores`.`apellidos` AS `apellidos`, `usuarios_vendedores`.`telefono` AS `telefono`, `usuarios_vendedores`.`password` AS `password`, `usuarios_vendedores`.`rol` AS `rol` FROM `usuarios_vendedores`union select `usuarios_gestores`.`id` AS `id`,`usuarios_gestores`.`email` AS `email`,`usuarios_gestores`.`nombre` AS `nombre`,`usuarios_gestores`.`apellidos` AS `apellidos`,`usuarios_gestores`.`telefono` AS `telefono`,`usuarios_gestores`.`password` AS `password`,`usuarios_gestores`.`rol` AS `rol` from `usuarios_gestores`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usuarios_gestores`
--
DROP TABLE IF EXISTS `usuarios_gestores`;

CREATE VIEW `usuarios_gestores`  AS SELECT `gestores`.`id` AS `id`, `gestores`.`email` AS `email`, `gestores`.`nombre` AS `nombre`, `gestores`.`apellidos` AS `apellidos`, `gestores`.`telefono` AS `telefono`, `cuentas`.`password` AS `password`, 'gestor' AS `rol` FROM (`gestores` join `cuentas` on(`gestores`.`email` = `cuentas`.`email`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usuarios_vendedores`
--
DROP TABLE IF EXISTS `usuarios_vendedores`;

CREATE VIEW `usuarios_vendedores`  AS SELECT `vendedores`.`id` AS `id`, `vendedores`.`email` AS `email`, `vendedores`.`nombre` AS `nombre`, `vendedores`.`apellidos` AS `apellidos`, `vendedores`.`telefono` AS `telefono`, `cuentas`.`password` AS `password`, 'vendedor' AS `rol` FROM (`vendedores` join `cuentas` on(`vendedores`.`email` = `cuentas`.`email`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `gestores`
--
ALTER TABLE `gestores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gestor_cuenta` (`email`);

--
-- Indices de la tabla `menciones_clientes`
--
ALTER TABLE `menciones_clientes`
  ADD UNIQUE KEY `nota` (`nota`,`cliente`),
  ADD KEY `fk_mencion_cliente` (`cliente`);

--
-- Indices de la tabla `menciones_vendedores`
--
ALTER TABLE `menciones_vendedores`
  ADD UNIQUE KEY `nota` (`nota`,`vendedor`),
  ADD KEY `fk_mencion_vendedor` (`vendedor`);

--
-- Indices de la tabla `menciones_ventas`
--
ALTER TABLE `menciones_ventas`
  ADD UNIQUE KEY `nota` (`nota`,`venta`),
  ADD KEY `fk_mencion_venta` (`venta`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nota_autor` (`autor`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vendedor_cuenta` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venta_vendedor` (`vendedor`),
  ADD KEY `fk_venta_cliente` (`cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gestores`
--
ALTER TABLE `gestores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gestores`
--
ALTER TABLE `gestores`
  ADD CONSTRAINT `fk_gestor_cuenta` FOREIGN KEY (`email`) REFERENCES `cuentas` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menciones_clientes`
--
ALTER TABLE `menciones_clientes`
  ADD CONSTRAINT `fk_mencion_cliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mencion_nota` FOREIGN KEY (`nota`) REFERENCES `notas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menciones_vendedores`
--
ALTER TABLE `menciones_vendedores`
  ADD CONSTRAINT `fk_mencion_vendedor` FOREIGN KEY (`vendedor`) REFERENCES `vendedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mencion_vendedor_nota` FOREIGN KEY (`nota`) REFERENCES `notas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menciones_ventas`
--
ALTER TABLE `menciones_ventas`
  ADD CONSTRAINT `fk_mencion_venta` FOREIGN KEY (`venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mencion_venta_nota` FOREIGN KEY (`nota`) REFERENCES `notas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_nota_autor` FOREIGN KEY (`autor`) REFERENCES `gestores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `fk_vendedor_cuenta` FOREIGN KEY (`email`) REFERENCES `cuentas` (`email`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta_vendedor` FOREIGN KEY (`vendedor`) REFERENCES `vendedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
