-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2023 a las 09:33:14
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `factura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices_tbl`
--

CREATE TABLE `invoices_tbl` (
  `id` bigint(30) NOT NULL,
  `invoice_code` varchar(50) NOT NULL,
  `customer` text NOT NULL,
  `cashier` text NOT NULL,
  `total_amount` float(12,2) NOT NULL,
  `discount_percentage` float NOT NULL,
  `discount_amount` float(12,2) NOT NULL,
  `tendered_amount` float(12,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `invoices_tbl`
--

INSERT INTO `invoices_tbl` (`id`, `invoice_code`, `customer`, `cashier`, `total_amount`, `discount_percentage`, `discount_amount`, `tendered_amount`, `created_at`, `updated_at`) VALUES
(14, '1', 'Matias', 'Cajero 1', 4200.00, 10, 420.00, 4000.00, '2023-12-18 05:32:26', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_meta_tbl`
--

CREATE TABLE `invoice_meta_tbl` (
  `id` bigint(30) NOT NULL,
  `invoice_id` bigint(30) NOT NULL,
  `item` text NOT NULL,
  `price` float(12,2) NOT NULL,
  `qty` float NOT NULL,
  `unit` varchar(50) NOT NULL,
  `total` float(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `invoice_meta_tbl`
--

INSERT INTO `invoice_meta_tbl` (`id`, `invoice_id`, `item`, `price`, `qty`, `unit`, `total`) VALUES
(19, 14, 'Pan', 1000.00, 1, 'kg', 1000.00),
(20, 14, 'Leche', 800.00, 2, 'L', 1600.00),
(21, 14, 'Galletitas Oreo', 600.00, 2, 'paquetes', 1200.00),
(22, 14, 'Alfajor Fulbito', 80.00, 5, 'u', 400.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings_tbl`
--

CREATE TABLE `settings_tbl` (
  `id` int(11) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `settings_tbl`
--

INSERT INTO `settings_tbl` (`id`, `meta_field`, `meta_value`, `created_at`, `updated_at`) VALUES
(5, 'store_name', 'Venta de productos - Orellana', '2023-12-18 05:27:36', NULL),
(6, 'store_address', 'Calle 9/12', '2023-12-18 05:27:36', NULL),
(7, 'store_contact', '+12 3456-7890', '2023-12-18 05:27:36', NULL),
(8, 'footer_note', 'Factura generada con mi sistema de facturas.', '2023-12-18 05:27:36', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `invoices_tbl`
--
ALTER TABLE `invoices_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `invoice_meta_tbl`
--
ALTER TABLE `invoice_meta_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id_fk` (`invoice_id`);

--
-- Indices de la tabla `settings_tbl`
--
ALTER TABLE `settings_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `invoices_tbl`
--
ALTER TABLE `invoices_tbl`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `invoice_meta_tbl`
--
ALTER TABLE `invoice_meta_tbl`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `settings_tbl`
--
ALTER TABLE `settings_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `invoice_meta_tbl`
--
ALTER TABLE `invoice_meta_tbl`
  ADD CONSTRAINT `invoice_id_fk` FOREIGN KEY (`invoice_id`) REFERENCES `invoices_tbl` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
