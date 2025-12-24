-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Des 2025 pada 11.15
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes_dwbi`
--

-- --------------------------------------------------------

--
-- Struktur untuk view `dm_clustering_customer`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dm_clustering_customer`  AS SELECT `dc`.`customer_unique_id` AS `customer_unique_id`, count(distinct `foi`.`order_id`) AS `total_orders`, sum(`foi`.`total`) AS `total_spending`, avg(`foi`.`price`) AS `avg_price` FROM (`fact_order_item` `foi` join `dim_customer` `dc` on(`foi`.`customer_key` = `dc`.`customer_key`)) GROUP BY `dc`.`customer_unique_id` ;

--
-- VIEW `dm_clustering_customer`
-- Data: Tidak ada
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
