-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2023 at 09:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bestproduct1223`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `images`, `desc`, `tags`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Toyota', 'toyota-Update-25-dec-2023', '[\"brands-images\\/01HJFW54H2TF6M4KYXSAFQTDMZ.jpg\"]', NULL, '[\"toyota\",\"car\",\"automotive\"]', 1, '2023-12-24 23:55:14', '2023-12-24 23:56:23'),
(2, 'Honda', 'honda-Update-25-dec-2023', '[\"brands-images\\/01HJFW7AKQAF0DF3504PZM79YA.jpg\"]', NULL, '[\"car\",\"automotive\"]', 1, '2023-12-24 23:57:29', '2023-12-24 23:57:29'),
(3, 'Mazda', 'mazda-Update-25-dec-2023', '[\"brands-images\\/01HJFW97C6SXR0DKP1N5FAPHAG.jpg\"]', NULL, '[\"car\",\"truck\"]', 1, '2023-12-24 23:58:31', '2023-12-24 23:58:31'),
(4, 'Nissan', 'nissan-Update-25-dec-2023', '[\"brands-images\\/01HJFWBMJ40NBP06V3MCG9YAX3.jpg\"]', NULL, '[\"car\",\"truck\"]', 1, '2023-12-24 23:59:50', '2023-12-24 23:59:50'),
(5, 'Ford', 'ford-Update-25-dec-2023', '[\"brands-images\\/01HJFWE18AWAYN3KZTWEXTHRGX.jpg\"]', NULL, '[\"car\",\"truck\",\"usa brand\"]', 1, '2023-12-25 00:01:09', '2023-12-25 00:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `desc`, `tags`, `images`, `published`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Automotive & Motorcycles', 'automotive-motorcycles-Update-25-dec-2023', NULL, '[\"car\",\"bigbike\",\"truck\",\"van\"]', '[\"category-images\\/01HJFQST1F596EV6889WNR01GF.jpg\"]', 1, '2023-12-24 22:40:12', '2023-12-24 22:40:12'),
(2, 1, 'Cars', 'cars-Update-25-dec-2023', NULL, '[\"car\",\"4wheel\"]', '[\"category-images\\/01HJFQVMQWKPWNB1HM1HN6SCZE.jpg\"]', 1, '2023-12-24 22:41:12', '2023-12-24 22:45:59'),
(3, 1, 'Pickup Truck', 'pickup-truck-Update-25-dec-2023', NULL, '[\"mini truck\",\"truck\",\"pickup\"]', '[\"category-images\\/01HJFWM8AX860KG8C9ZV1YG11R.png\"]', 1, '2023-12-25 00:03:55', '2023-12-25 00:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_12_25_032825_create_categories_table', 2),
(7, '2023_12_25_032844_create_brands_table', 2),
(8, '2023_12_25_052541_remove_parent_id_from_categories_table', 3),
(9, '2023_12_25_053630_crate_categories_table', 4),
(10, '2023_12_25_070509_create_products_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `cover` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `desc` text DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `brand_id`, `published`, `cover`, `images`, `tags`, `desc`, `excerpt`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Toyota Vigo - 2010', 'toyota-vigo-2010-Update-25-dec-2023', 3, 1, 1, 'products-cover-images/cover-toyota-vigo-2010-Update-25-dec-2023-1703489747.jpg', '[\"products-images\\/01HJFYDE5Z9HPKP5PHK2WHAFYT.webp\",\"products-images\\/01HJFYDE62TMJNXFAZQCBK394B.jpg\",\"products-images\\/01HJFYDE65DSH9DTZMRDA68MXD.jpg\"]', '[\"toyota\",\"truck\"]', 'เป็นที่แซวเล่นกันท่ามกลางหมู่สื่อมวลชนว่าค่ายสามห่วงแอบจิ๊กชื่อ Mitsubishi มาใช้งาน แต่การกลับมารครั้งนี้รถกระบะโตโยต้าวีโก้ขวัญใจคนไทยประหยัดจิ๊บๆ ก็มาพร้อมหลายสิ่งใหม่ที่ให้ความน่าสนใจ และถือเป็นการประเดิมศึกยานยนต์กระบะในช่วงครึ้งปีหลังอย่างแท้จริง\n\nภายนอกค่ายสามห่วงได้มีการปรับหน้าตาของกระบะตัวแสบของค่ายใหม่จากเดิมที่มีลุคดุดันคล้ายตัวนอกจนเป้นที่ชื่นชอบของหลายคนแต่ครั้งนี้ รถกระบะแชมป์ตัวจริงกลับมาพร้อมใบหน้าที่มีการเปลี่ยนโฉมตั้งแต่หัวจรดท้าย โดยเฉพาะใบหน้าที่ได้รับการปั้นแต่งให้ดูสปอร์ตมากยิ่งขึ้นกว่าเดิม เปลี่ยนยกชุดตั้งแต่ ไฟหน้า กระจังหน้าดีไซน์ใหม่ที่ออกแนวหรูหรา กันชนหน้าที่ดูสปอร์ตมากยิ่งขึ้น เช่นเดียวกับแก้มข้าง และในรุ่นใหญ่พรีรันเนอร์และ ขับเคลื่อน4ล้อยังปรับเสริมโป่งหรือ Over Fender ให้ดูดุดันกว่ารุ่นก่อนในสไตล์สปอร์ตด้วย\n\nไม่เพียงแค่กายภายนอกเท่านั้น แต่ในจิตวิญญาณของ Toyota Hilux Vigo ใหม่นั้น ยังมาพร้อมกับแชสซีชิ้นเดียว Top Platform เพื่อเสริมความแข็งแกร่งทางด้านโครงสร้างหลักของตัวรถ เช่นเดียวกับการปรับเปลี่ยนส่วนอื่นๆที่ยังตอบสนองไม่ได้มากเช่นในรุ่น Smart Cab มีการเพิ่มเปิดปิดมากขึ้นถึง 92 องศา และยังให้ทางเข้าออกที่กว้างมากขึ้นถึง 51 มิลลิเมตร ในขณะที่ล้อมีการปรับเปลี่ยนให้เป็นขอบ 16 นิ้ว แทบทุกรุ่น ยกเว้นรุ่น 4 ประตูในกลุ่มขับ 2 ยกสูงหรือ Prerunner และรุ่นขับเคลื่อน 4 ล้อ ที่ยกชุดไปใช้ขอบ 17 จากโรงงาน', 'ถ้าถามถึงรถยนต์ในตลาดรถกระบะที่ได้รับความนิยมอย่างมากในบ้านเรานั้น คงไม่มีค่ายไหนที่จะได้รับการจับตามองไปมากกว่าค่ายดตดยต้า ที่ซดน้ำมัน \"จิ๊บ..จิ๊บ\" ตามโฆษณา พร้อมการตลาดที่มุ่งเน้นออกง่าย แถมยังขายคล่องและเมื่อสัปดาห์ที่ผ่านมาค่ายรถยนต์เจ้านี้ก็เปิดตัวรถยนต์รุ่นใหม่ออกมาภายใต้ชื่อ Vigo Champ', 600000, '2023-12-25 00:31:24', '2023-12-25 00:35:47'),
(2, 'NISSAN NAVARA NP300', 'nissan-navara-np300-Update-25-dec-2023', 3, 4, 1, 'products-cover-images/cover-nissan-navara-np300-Update-25-dec-2023-1703491869.jpg', '[\"products-images\\/01HJG0E6ZCJZCSNA15X52C1NQK.jpg\",\"products-images\\/01HJG0E6ZFEARS7F45WE8VK5P2.jpg\",\"products-images\\/01HJG0E6ZH8ERHJDM7DRYFGRG6.jpg\",\"products-images\\/01HJG0E6ZN9TCPNWJKC1TTG6R0.jpg\",\"products-images\\/01HJG0E6ZRBTSPS7BN57ZJZQ08.jpg\"]', '[\"mini truck\",\"nissan\"]', 'Nissan Navara NP300 มีรูปลักษณ์ภายนอกที่ผสมผสานกันระหว่างกระบะญีปุ่นและกระบะอเมริกาไว้รวมกัน โดยไฟหน้ายังมีกลิ่นไอของรถยุโรปซะด้วยกันไฟหน้าแบบไฟส่องสว่างตอนกลางวันแบบ LED ด้านหน้าที่มีลักษณะคล้ายบูมเมอแรง นอกจากนี้ คิ้วโครเมียมข้างตัวรถ และกระจกมองข้างแบบโครเมียมพร้อมไฟเลี้ยว ยังช่วยเสริมความโฉบเฉี่ยวให้กับตัวรถยิ่งขึ้น มาพร้อมชุดแต่งสุดเท่อย่าง BLACK EDITION และ SPORTECH\n\nความแกร่งรูปลักษณ์ใหม่ที่เหนือกว่าทั้งภายนอกภายในของ นิสสัน นาวารา แบล็คอิดิชั่น เสริมความแมนเข้มของลูกผู้ชายตัวจริงให้โดดเด่นยิ่งขึ้นด้วยลุคภายนอกของชุดแต่งพิเศษดุดันรอบคัน จากกระจังหน้า ผ่านฝากระโปรงหน้า หลังคา สู่กันชนหลัง เสริมบุคลิกเฉพาะตัวที่ด้านข้างด้วยลวดลายกราฟิตี้ดีไซน์สีดำ แกร่งเข้มเฉพาะตัว เหนือล้ออัลลอยขนาดใหญ่ 18” แต่งด้วยซุ้มล้อสีดำขนาดใหญ่ ภายใต้รูปลักษณ์ลูกผู้ชายของ นิสสัน นาวารา แบล็คอิดิชั่น ยังให้เจ้าของพร้อมลุยไปทุกที่ด้วยช่วงล่างที่ใช้แชสซีส์เหล็กกล้าชิ้นเดียวตลอดคัน เป็นจุดเด่นของรถปิคอัพนิสสันที่ผู้ใช้ทั่วโลกล้วนยอมรับในความแข็งแรงทนทานกว่าปิคอัพทั่วไป พร้อมฟังก์ชั่นควบคุมความเร็วอัตโนมัติ Cruise Control ให้เป็นออปชั่นมาตรฐานของ นิสสัน นาวารา แบล็คอิดิชั่น ทุกรุ่น เพื่อมอบความแกร่งที่เหนือกว่าโดยไม่ทิ้งความสะดวกสบายและปลอดภัย', 'พิเศษ Nissan Navara NP300 กระบะแคป ราคาเริ่มต้น 499,900 ผ่อน 8,xxx.- ฟรีประกันภัย อุปกรณ์ครบ\nเปิดตัวกันไปแล้วนะครับสำหรับ Nissan Navara NP300 เป็นกระบะใหม่ล่าสุดจากทาง Nissan ค่ายรถคุณภาพสูง โดยแน่นอนว่ามันมาแบบเต็มตัวและรอที่จะเข้ามาแบ่งตลาดของ Ford Ranger ที่กินมาตลอด 2 ปีที่ผ่านมาครับ อย่างไรก็ตามเดี๋ยวเราคงจะได้เห็นการแข่งขันที่สนุกแน่ ๆ ครับ สำหรับศึกชิงเจ้ากระบะคราวนี้\n', 490000, '2023-12-25 01:11:09', '2023-12-25 01:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Korn.S', 'sirikorn.s@outlook.com', NULL, '$2y$12$BCXpFXIWWcaMQBPGYul65eR3uDDK1GifSAYBNkNsUs/gfoT8rtHC.', 'LcYsWKNTyPQZfVLAyOKAXH8iHAdFGKsrSUuyAt5chtFbySNRt2fkP4bdtujG', '2023-12-24 20:52:28', '2023-12-24 20:52:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
