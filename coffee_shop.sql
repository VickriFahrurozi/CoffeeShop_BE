-- phpMyAdmin SQL Dump
-- version 5.2.1-dev+20220720.fda386a998
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2022 at 07:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` bigint(20) NOT NULL,
  `account_email` varchar(100) NOT NULL,
  `account_password` varchar(200) NOT NULL,
  `account_role` enum('111','222') NOT NULL DEFAULT '111',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_email`, `account_password`, `account_role`, `created_at`, `updated_at`) VALUES
(1, 'a@gmail.com', '$2b$10$lEaRYjgdcS/708rPK6E1Hu.7uzHaB69C4PLJFzVdaCBOj/V/UYUDy', '222', '2022-07-29 22:33:03', '2022-07-31 19:28:02'),
(2, 'b@gmail.com', '$2b$10$p1WGFwKjf1vZskKEnHUPsuWzCfjxyKWg8mIwT2JiagCDdu8McSKdW', '111', '2022-07-31 19:19:48', '2022-07-31 19:19:48'),
(3, 'c@gmail.com', '$2b$10$wZ3gwrffs/JIRmzvtsOQOeaAXZUOEfCxvOqoU82Li.SDdQQi3jxEO', '111', '2022-07-31 19:20:41', '2022-07-31 19:20:41'),
(4, 'd@gmail.com', '$2b$10$buksF58QHq6dTJEvJnNFxulCn7WcvnTxnL3opTK3tb5iGqiiL.p2i', '111', '2022-07-31 19:21:52', '2022-07-31 19:21:52'),
(5, 'e@gmail.com', '$2b$10$3ebkEKtsm8YngwUX/bEMiOKOr1/81ORK0ntVCU4Pg920i2zHUS.2i', '111', '2022-07-31 19:23:05', '2022-07-31 19:23:05'),
(6, 'f@gmail.com', '$2b$10$GPpAleSfk/j5yEOHfGR71e1sNRBFAAGmjk8zgmcuHM4/HrL3QFE4e', '111', '2022-07-31 19:24:25', '2022-07-31 19:24:25'),
(7, 'g@gmail.com', '$2b$10$lPQ5KfS6nKaKGgWspVkGqu2gmp1yFdaRN/6o15OX6J28sfcUb90Ie', '111', '2022-07-31 19:25:01', '2022-07-31 19:25:01'),
(8, 'h@gmail.com', '$2b$10$Iu6U2xbVoZ.8g8FlOyjMqOxHteb4u9ZVwIk91NoKF57zk15/MD4Z6', '111', '2022-07-31 19:25:17', '2022-07-31 19:25:17'),
(9, 'i@gmail.com', '$2b$10$fRxxQXHExhaCtp2lu1Av0.mou4IwqJEgf4eJmMuql2vnlwEwLeXyy', '111', '2022-07-31 19:25:57', '2022-07-31 19:25:57'),
(10, 'z@gmail.com', '$2b$10$n1EDRUibaowN.RJzU1x56OkCy2SL2GrO03nDXbEuvlLfu4JSwYS6e', '111', '2022-08-04 10:31:17', '2022-08-04 10:31:17'),
(11, 'vickrifahrurozi@gmail.com', '$2b$10$Z.jS3nXdyQMK0fcxIACMJOX0LzHLnIhiZDPNGDqY0iUwVsyXb/NU6', '111', '2022-08-24 22:34:18', '2022-08-24 22:34:18'),
(12, 'vickri123@gmail.com', '$2b$10$gesDu45JSI3eEgF2v8AjDOosUAPgqLGYABAC2C9zSuokEdqmTaI/m', '111', '2022-08-24 22:45:17', '2022-08-24 22:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `chart`
--

CREATE TABLE `chart` (
  `chart_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `chart_name` varchar(200) NOT NULL,
  `chart_size` enum('R','L','XL','200g','300g','500g') NOT NULL DEFAULT 'R',
  `chart_picture` varchar(200) NOT NULL DEFAULT 'chart_default.png',
  `chart_quantity` int(11) NOT NULL DEFAULT 1,
  `chart_price` bigint(20) NOT NULL,
  `chart_delivery` enum('dinein','takeaway','delivery') NOT NULL DEFAULT 'dinein',
  `chart_status` enum('active','disabled') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `coupon_name` varchar(100) NOT NULL,
  `coupon_code` varchar(100) NOT NULL,
  `coupon_disc` int(11) NOT NULL DEFAULT 0,
  `coupon_detail` varchar(200) NOT NULL,
  `coupon_old_price` bigint(20) NOT NULL,
  `coupon_new_price` bigint(20) NOT NULL,
  `coupon_date_start` date NOT NULL DEFAULT '2010-11-12',
  `coupon_date_end` date NOT NULL DEFAULT '2010-11-15',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `order_price` bigint(20) NOT NULL,
  `size` varchar(10) NOT NULL DEFAULT 'R',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `order_status` enum('canceled','waiting','accepted','onprocess','done') NOT NULL DEFAULT 'waiting',
  `order_address` varchar(250) NOT NULL,
  `order_payment_method` enum('card','cash','cod') NOT NULL DEFAULT 'cash',
  `order_payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_price` bigint(20) NOT NULL,
  `order_size` varchar(10) NOT NULL DEFAULT '''R''',
  `order_quantity` bigint(20) NOT NULL DEFAULT 1,
  `order_status` enum('canceled','waiting','accepted','onprocess','done') NOT NULL DEFAULT 'waiting',
  `order_address` varchar(250) NOT NULL,
  `order_payment_method` enum('card','cash','cod') NOT NULL DEFAULT 'cash',
  `order_payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `profile_id`, `product_name`, `product_id`, `order_price`, `order_size`, `order_quantity`, `order_status`, `order_address`, `order_payment_method`, `order_payment_status`, `created_at`, `updated_at`) VALUES
(16, 2, 'Kopi Gajah', 7, 15000, 'R', 1, 'onprocess', 'dinein', 'cash', 'unpaid', '2022-08-04 03:39:15', '2022-08-04 10:26:37'),
(17, 2, 'Kopi Robusta', 6, 15000, 'R', 1, 'accepted', 'dinein', 'cash', 'unpaid', '2022-08-04 03:39:21', '2022-08-04 10:11:16'),
(18, 2, 'Es Boba', 2, 15000, 'R', 1, 'done', 'dinein', 'cash', 'unpaid', '2022-08-04 03:39:31', '2022-08-04 10:25:04'),
(20, 2, 'Kopi Gajah', 7, 15000, 'R', 1, 'waiting', 'dinein', 'cash', 'unpaid', '2022-08-04 04:04:00', '2022-08-04 04:04:00'),
(21, 3, 'Roti Maryam', 4, 60000, 'R', 4, 'canceled', 'dinein', 'cash', 'unpaid', '2022-08-04 09:55:48', '2022-08-04 10:12:46'),
(22, 3, 'Kopi Arabika', 1, 30000, 'R', 2, 'accepted', 'dinein', 'cash', 'unpaid', '2022-08-04 09:56:38', '2022-08-04 10:11:32'),
(23, 10, 'Roti Maryam', 4, 45000, 'R', 3, 'accepted', 'dinein', 'cash', 'unpaid', '2022-08-04 10:33:40', '2022-08-04 10:35:21'),
(24, 10, 'Kopi Arabika', 1, 30000, 'R', 2, 'waiting', 'dinein', 'cash', 'unpaid', '2022-08-04 10:34:01', '2022-08-04 10:34:01'),
(25, 2, '', 1, 15000, 'R', 1, 'waiting', 'dinein', 'cash', 'unpaid', '2022-08-15 00:26:23', '2022-08-15 00:26:23'),
(26, 2, '', 1, 150000, 'R', 10, 'waiting', 'dinein', 'cash', 'unpaid', '2022-08-15 00:26:29', '2022-08-15 00:26:29'),
(27, 2, '', 2, 150000, 'R', 10, 'waiting', 'dinein', 'cash', 'unpaid', '2022-08-24 22:33:12', '2022-08-24 22:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `product_id` bigint(20) NOT NULL,
  `product_size` varchar(50) NOT NULL,
  `product_price` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`product_id`, `product_size`, `product_price`, `created_at`, `updated_at`) VALUES
(1, 'xl', 50000, '2022-07-31 23:23:13', '2022-07-31 23:23:13'),
(1, 'l', 40000, '2022-07-31 23:23:13', '2022-07-31 23:23:13'),
(1, 'r', 30000, '2022-07-31 23:23:13', '2022-07-31 23:23:13'),
(2, 'xl', 50000, '2022-07-31 23:25:28', '2022-07-31 23:25:28'),
(2, 'l', 40000, '2022-07-31 23:25:28', '2022-07-31 23:25:28'),
(2, 'r', 30000, '2022-07-31 23:25:28', '2022-07-31 23:25:28'),
(3, '100g', 10000, '2022-07-31 23:26:34', '2022-07-31 23:26:34'),
(3, '250g', 20000, '2022-07-31 23:26:34', '2022-07-31 23:26:34'),
(3, '500g', 30000, '2022-07-31 23:26:34', '2022-07-31 23:26:34'),
(4, 'r', 15000, '2022-07-31 23:27:22', '2022-07-31 23:27:22'),
(5, 'r', 15000, '2022-08-01 00:33:10', '2022-08-01 00:33:10'),
(6, 'xl', 50000, '2022-08-01 00:34:20', '2022-08-01 00:34:20'),
(6, 'l', 40000, '2022-08-01 00:34:20', '2022-08-01 00:34:20'),
(6, 'r', 30000, '2022-08-01 00:34:20', '2022-08-01 00:34:20'),
(7, 'xl', 50000, '2022-08-01 18:01:02', '2022-08-01 18:01:02'),
(7, 'l', 40000, '2022-08-01 18:01:02', '2022-08-01 18:01:02'),
(7, 'r', 30000, '2022-08-01 18:01:02', '2022-08-01 18:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_picture` varchar(200) NOT NULL DEFAULT 'product_default.png',
  `product_category` enum('coffee','noncoffee','food','addon') NOT NULL DEFAULT 'coffee',
  `product_detail` varchar(300) NOT NULL,
  `product_description` varchar(1000) NOT NULL,
  `product_delivery_method` varchar(300) NOT NULL,
  `product_stock` int(11) NOT NULL DEFAULT 999,
  `price_range` varchar(100) NOT NULL DEFAULT '0',
  `product_delivery_hour_start` time NOT NULL DEFAULT '08:00:00',
  `product_delivery_hour_end` time NOT NULL DEFAULT '22:00:00',
  `product_buy_count` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_picture`, `product_category`, `product_detail`, `product_description`, `product_delivery_method`, `product_stock`, `price_range`, `product_delivery_hour_start`, `product_delivery_hour_end`, `product_buy_count`, `created_at`, `updated_at`) VALUES
(1, 'Kopi Arabika', '1659284593194-142055032-Coffe glass.png', 'coffee', '1 Cangkir Kopi Arabika', 'Kopi arabika (Coffea arabica), juga dikenal sebagai kopi Arab, kopi semak Arab, atau kopi gunung, adalah spesies dari genus Coffea. ', 'Cash,Card,Cod', 25, '50000,40000,30000', '08:00:00', '22:00:00', 0, '2022-07-31 23:23:13', '2022-08-03 20:10:55'),
(2, 'Es Boba', '1659284728220-398297620-2.jpg', 'noncoffee', '1 Cangkir Es Boba', 'Es Boba Kualitas Terbaik Minuman boba berasal dari Taiwan dan dikenal dengan nama zenzhu naicha atau susu teh dengan bola tapioka. Di Indonesia, minuman ini terkenal dengan sebutan bubble tea.', 'Cash,Card,Cod', 25, '50000,40000,30000', '08:00:00', '22:00:00', 0, '2022-07-31 23:25:28', '2022-08-03 20:11:39'),
(3, 'Pizza ', '1659284794522-674497596-1.jpg', 'food', 'Pizza 1 Loyang', 'Pizza Kualitas Terbaik  Pizza adalah roti berbentuk bulat pipih dengan diameter 30 cm yang dipanggang dalam oven dan biasanya disiram saus tomat serta keju', 'Cash,Card,Cod', 25, '10000,20000,30000', '08:00:00', '22:00:00', 0, '2022-07-31 23:26:34', '2022-08-03 20:12:27'),
(4, 'Roti Maryam', '1659284842755-723513656-30-304758_coffee-beans-png-coffee-beans-logo-png.png', 'addon', '1 Buah Roti Maryam', 'Roti Maryam Kualitas Terbaik Roti maryam atau roti canai adalah roti pipih khas India. Roti ini mudah sekali ditemui di Singapura dan Malaysia, biasanya dijual di warung makan keturunan India di sana. ', 'Cash,Card,Cod', 25, '15000', '08:00:00', '22:00:00', 0, '2022-07-31 23:27:22', '2022-08-03 20:12:49'),
(5, 'Roti Maryam Isi 3', '1659288790484-286764631-30-304758_coffee-beans-png-coffee-beans-logo-png.png', 'addon', '1 Buah Roti Maryam', 'Roti Maryam Kualitas Terbaik Roti maryam atau roti canai adalah roti pipih khas India. Roti ini mudah sekali ditemui di Singapura dan Malaysia, biasanya dijual di warung makan keturunan India di sana. ', 'Cash,Card,Cod', 25, '15000', '08:00:00', '22:00:00', 0, '2022-08-01 00:33:10', '2022-08-03 20:12:52'),
(6, 'Kopi Robusta', '1659288860266-872970393-Biji Kopi 2.jpg', 'coffee', '1 Cangkir Kopi Robusta', 'Salah satu jenis kopi yang saat ini banyak diminati kawula muda adalah kopi robusta. Kopi jenis ini merupakan turunan dari spesies Coffea canephora. Kopi jenis ini tumbuh di dataran rendah', 'Cash,Card,Cod', 25, '50000,40000,30000', '08:00:00', '22:00:00', 0, '2022-08-01 00:34:20', '2022-08-03 20:13:18'),
(7, 'Kopi Gajah', '1659351662892-356618093-Biji Kopi 1.jpg', 'coffee', '1 Cangkir Kopi Gajah', 'Kopi Tubruk Gadjah merupakan kopi bubuk instan yang terbuat dari biji kopi lokal pilihan nan berkualitas yang diproduksi oleh PT Sumber Kopi Prima.', 'Cash,Card,Cod', 25, '50000,40000,30000', '08:00:00', '22:00:00', 0, '2022-08-01 18:01:02', '2022-08-03 20:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `profile_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `profile_first_name` varchar(50) NOT NULL,
  `profile_last_name` varchar(50) NOT NULL,
  `profile_display_name` varchar(50) NOT NULL,
  `profile_picture` varchar(200) NOT NULL DEFAULT 'profile_default.png',
  `profile_phone_number` varchar(15) NOT NULL,
  `profile_gender` enum('MALE','FEMALE') NOT NULL,
  `profile_birth_date` date NOT NULL DEFAULT '2010-11-12',
  `profile_delivery_address` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`profile_id`, `account_id`, `profile_first_name`, `profile_last_name`, `profile_display_name`, `profile_picture`, `profile_phone_number`, `profile_gender`, `profile_birth_date`, `profile_delivery_address`, `created_at`, `updated_at`) VALUES
(1, 1, 'A', 'B', 'AB', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-29 22:33:03', '2022-08-01 23:54:38'),
(2, 2, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:19:48', '2022-07-31 19:19:48'),
(3, 3, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:20:41', '2022-07-31 19:20:41'),
(4, 4, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:21:52', '2022-07-31 19:21:52'),
(5, 5, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:23:05', '2022-07-31 19:23:05'),
(6, 6, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:24:25', '2022-07-31 19:24:25'),
(7, 7, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:25:01', '2022-07-31 19:25:01'),
(8, 8, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:25:17', '2022-07-31 19:25:17'),
(9, 9, '', '', '', 'profile_default.png', '0883815718369', 'MALE', '2010-11-12', '', '2022-07-31 19:25:57', '2022-07-31 19:25:57'),
(10, 10, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-08-04 10:31:17', '2022-08-04 10:31:17'),
(11, 11, '', '', '', 'profile_default.png', '083815718369', 'MALE', '2010-11-12', '', '2022-08-24 22:34:19', '2022-08-24 22:34:19'),
(12, 12, '', '', '', 'profile_default.png', '1234566789', 'MALE', '2010-11-12', '', '2022-08-24 22:45:17', '2022-08-24 22:45:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `chart`
--
ALTER TABLE `chart`
  ADD PRIMARY KEY (`chart_id`),
  ADD KEY `chart_ibfk_1` (`product_id`),
  ADD KEY `chart_ibfk_2` (`profile_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `coupon_ibfk_1` (`product_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `orders_ibfk_1` (`profile_id`),
  ADD KEY `orders_ibfk_2` (`product_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD KEY `price_ibfk_1` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `profiles_ibfk_1` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chart`
--
ALTER TABLE `chart`
  MODIFY `chart_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chart`
--
ALTER TABLE `chart`
  ADD CONSTRAINT `chart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chart_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`profile_id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`profile_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
