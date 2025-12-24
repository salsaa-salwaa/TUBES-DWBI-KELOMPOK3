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
-- Struktur untuk view `dm_classification_review`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dm_classification_review`  AS SELECT `dc`.`customer_unique_id` AS `customer_unique_id`, count(`fr`.`review_id`) AS `total_reviews`, avg(`fr`.`review_score`) AS `avg_review`, CASE WHEN avg(`fr`.`review_score`) <= 2 THEN 1 ELSE 0 END AS `label_bad_review` FROM (`fact_review` `fr` join `dim_customer` `dc` on(`fr`.`customer_key` = `dc`.`customer_key`)) GROUP BY `dc`.`customer_unique_id` ;

--
-- VIEW `dm_classification_review`
-- Data: Tidak ada
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
