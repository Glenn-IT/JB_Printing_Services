-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2026 at 02:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_ordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(3, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(41, 40, 62, 'Collar', 500, 1, 'Educ ColSC mockup copy.jpg'),
(42, 40, 63, 't-shirt 123', 550, 1, 'wallpaper.png');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 40, 1, '2025-10-05 06:34:40', '2025-12-07 11:11:30'),
(2, 41, 1, '2025-10-05 06:35:49', '2025-10-05 07:26:11'),
(3, 56, 1, '2025-11-05 12:25:00', '2025-11-05 12:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `conversation_messages`
--

CREATE TABLE `conversation_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `sender_type` enum('user','admin') NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conversation_messages`
--

INSERT INTO `conversation_messages` (`id`, `conversation_id`, `sender_type`, `sender_id`, `message`, `is_read`, `created_at`) VALUES
(17, 1, 'admin', 1, 'Hello! Welcome to JB Printing Services. How can we help you today?', 1, '2025-10-05 06:34:40'),
(18, 1, 'admin', 3, 'wazzzup', 1, '2025-10-05 06:35:45'),
(19, 2, 'user', 41, 'awda', 1, '2025-10-05 06:35:55'),
(20, 2, 'admin', 3, 'ikaw palaang kachat ko', 1, '2025-10-05 06:36:13'),
(21, 2, 'user', 41, 'oo namn', 1, '2025-10-05 06:36:17'),
(22, 1, 'user', 40, 'hi po', 1, '2025-10-05 06:36:42'),
(23, 1, 'admin', 3, 'o hello', 1, '2025-10-05 06:36:55'),
(24, 2, 'admin', 3, 'oo naman', 1, '2025-10-05 06:37:00'),
(25, 1, 'user', 40, 'gagu kaba', 1, '2025-10-05 06:37:13'),
(26, 1, 'admin', 3, 'kiffum', 1, '2025-10-05 06:37:20'),
(27, 2, 'user', 41, 'pepet', 1, '2025-10-05 07:25:38'),
(28, 2, 'admin', 3, 'balaya butu', 1, '2025-10-05 07:25:57'),
(29, 2, 'user', 41, 'k fie', 1, '2025-10-05 07:26:06'),
(30, 2, 'admin', 3, 'kiffum', 1, '2025-10-05 07:26:11'),
(31, 1, 'admin', 3, 'wazzzup', 1, '2025-10-05 07:26:16'),
(32, 1, 'user', 40, 'heyy', 1, '2025-10-05 07:27:48'),
(33, 3, 'user', 56, 'wow astig', 1, '2025-11-05 12:25:08'),
(34, 3, 'admin', 3, 'opkors', 1, '2025-11-05 12:25:19'),
(35, 3, 'user', 56, 'hiii', 1, '2025-11-05 12:25:27'),
(36, 3, 'admin', 3, 'yes?', 1, '2025-11-05 12:25:34'),
(37, 1, 'user', 40, 'asdsa', 0, '2025-12-07 11:11:30');

-- --------------------------------------------------------

--
-- Table structure for table `loginlogs`
--

CREATE TABLE `loginlogs` (
  `id` int(11) DEFAULT NULL,
  `IpAddress` varchar(16) NOT NULL,
  `Trytime` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loginlogs`
--

INSERT INTO `loginlogs` (`id`, `IpAddress`, `Trytime`) VALUES
(NULL, '::1', '1669560843'),
(NULL, '::1', '1669560846'),
(NULL, '::1', '1669560849');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sender_type` enum('user','admin') DEFAULT 'user',
  `admin_id` int(100) DEFAULT NULL,
  `conversation_id` varchar(50) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`, `created_at`, `sender_type`, `admin_id`, `conversation_id`, `is_read`, `updated_at`) VALUES
(8, 41, 'Glenard U Pagurayan', 'glenard2308@gmail.com', '09557997409', 'awd', '2025-10-02 10:50:16', 'user', NULL, 'conv_41_1759402216_8', 0, '2025-10-02 10:50:16'),
(9, 41, 'Glenard U Pagurayan', 'glenard2308@gmail.com', '09557997409', 'awd', '2025-10-02 10:52:39', 'user', NULL, 'conv_41_1759402216_8', 0, '2025-10-02 10:52:39'),
(10, 41, 'Glenard U Pagurayan', 'glenard2308@gmail.com', '09557997409', 'awd', '2025-10-02 10:54:46', 'user', NULL, 'conv_41_1759402216_8', 0, '2025-10-02 10:54:46'),
(11, 41, 'Glenard U Pagurayan', 'glenard2308@gmail.com', '09557997409', 'awd', '2025-10-02 11:00:45', 'user', NULL, 'conv_41_1759402216_8', 0, '2025-10-02 11:00:45'),
(12, 41, 'Glenard U Pagurayan', 'glenard2308@gmail.com', '09557997409', 'awd', '2025-10-02 11:00:47', 'user', NULL, 'conv_41_1759402216_8', 0, '2025-10-02 11:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `design_file` varchar(255) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` text DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `gcash_ref` varchar(50) DEFAULT NULL,
  `gcash_screenshot` varchar(255) DEFAULT NULL,
  `placed_on` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `expected_delivery_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `status_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cancel_reason` text DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancel_approval_status` enum('pending','approved','disapproved') DEFAULT NULL,
  `admin_response_message` text DEFAULT NULL,
  `cancel_processed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `type`, `quantity`, `size`, `price`, `design_file`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `gcash_ref`, `gcash_screenshot`, `placed_on`, `payment_status`, `expected_delivery_date`, `status`, `status_updated_at`, `cancel_reason`, `cancelled_at`, `cancel_approval_status`, `admin_response_message`, `cancel_processed_at`) VALUES
(50, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 't-shirt 123 (₱550 x 99)', 54450.00, NULL, NULL, '2025-10-05 20:33:16', 'pending', '2025-10-05', 'delivered', '2025-10-05 12:33:38', NULL, NULL, NULL, NULL, NULL),
(51, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 'Collar (₱500 x 99)', 49500.00, NULL, NULL, '2025-10-05 20:47:26', 'pending', NULL, 'cancelled', '2025-10-16 09:56:12', '', '2025-10-16 17:56:12', NULL, NULL, NULL),
(52, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 'Collar (₱500 x 1)', 500.00, NULL, NULL, '2025-10-16 19:46:51', 'pending', '2025-10-16', 'received', '2025-10-18 12:25:25', NULL, NULL, NULL, NULL, NULL),
(53, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 'Collar (₱500 x 99)', 49500.00, NULL, NULL, '2025-10-18 20:25:59', 'pending', '2025-10-18', 'received', '2025-10-18 12:26:38', NULL, NULL, NULL, NULL, NULL),
(54, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 't-shirt 123 (₱550 x 1)', 550.00, NULL, NULL, '2025-11-05 16:55:06', 'pending', '0000-00-00', 'Pre Order', '2025-11-06 00:05:06', '', '2025-11-06 08:04:44', NULL, NULL, NULL),
(55, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 't-shirt 123 (₱550 x 1)', 550.00, NULL, NULL, '2025-11-05 16:57:40', 'pending', NULL, 'pending', '2025-11-05 08:57:40', NULL, NULL, NULL, NULL, NULL),
(56, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 't-shirt 123 (₱550 x 1)', 550.00, NULL, NULL, '2025-11-05 16:59:46', 'pending', NULL, 'pending', '2025-11-05 08:59:46', NULL, NULL, NULL, NULL, NULL),
(57, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Cash On Delivery', 'Centro Sur', 't-shirt 123 (₱550 x 1)', 550.00, NULL, NULL, '2025-11-05 17:00:13', 'pending', NULL, 'pending', '2025-11-05 09:00:13', NULL, NULL, NULL, NULL, NULL),
(58, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucky Keith Padua', '09930512859', 'luckypadua4@gmail.com', 'Gcash', 'Centro Sur', 't-shirt 123 (₱550 x 1)', 550.00, 'asdsad', NULL, '2025-11-05 17:00:26', 'pending', NULL, 'pending', '2025-11-05 09:00:26', NULL, NULL, NULL, NULL, NULL),
(59, 56, NULL, NULL, NULL, NULL, NULL, NULL, 'Chrizel Jane Palafox', '09031232131', 'chrizeljanegonzales@gmail.com', 'Cash On Delivery', 'Piat Cagayan', 'Collar (₱500 x 1)', 500.00, NULL, NULL, '2025-11-05 19:41:36', 'pending', '2025-11-22', 'To Received', '2025-11-05 11:46:28', NULL, NULL, NULL, NULL, NULL),
(60, 56, NULL, NULL, NULL, NULL, NULL, NULL, 'Chrizel Jane Palafox', '09031232131', 'chrizeljanegonzales@gmail.com', 'Cash On Delivery', 'Piat Cagayan', 'Collar (₱500 x 1)', 500.00, NULL, NULL, '2025-11-05 19:42:40', 'pending', '2025-11-18', 'delivered', '2025-11-05 11:45:56', NULL, NULL, NULL, NULL, NULL),
(61, 56, NULL, NULL, NULL, NULL, NULL, NULL, 'Chrizel Jane Palafox', '09031232131', 'chrizeljanegonzales@gmail.com', 'Gcash', 'Piat Cagayan', 'Collar (₱500 x 1)', 500.00, NULL, '690b39fde4407_gcash_asf.jpg', '2025-11-05 19:50:21', 'pending', '0000-00-00', 'cancelled', '2025-11-05 12:19:13', '', '2025-11-05 20:19:13', NULL, NULL, NULL),
(62, 56, NULL, NULL, NULL, NULL, NULL, NULL, 'Chrizel Jane Palafox', '09031232131', 'chrizeljanegonzales@gmail.com', 'Cash On Delivery', 'Piat Cagayan', 't-shirt 123 (₱550 x 1)', 550.00, NULL, NULL, '2025-11-05 20:14:09', 'pending', '0000-00-00', 'Pre Order', '2025-11-05 12:14:36', '', '2025-11-05 20:14:22', NULL, NULL, NULL),
(63, 56, NULL, NULL, NULL, NULL, NULL, NULL, 'Chrizel Jane Palafox', '09031232131', 'chrizeljanegonzales@gmail.com', 'Cash On Delivery', 'Piat Cagayan', 'Collar (₱500 x 1)', 500.00, NULL, NULL, '2025-11-05 20:36:54', 'pending', NULL, 'cancelled', '2025-11-05 12:37:03', '', '2025-11-05 20:37:03', NULL, NULL, NULL),
(64, 45, NULL, NULL, NULL, NULL, NULL, NULL, 'Brian Jay Ilac', '09123213213', 'lovebrianjayilac@gmail.com', 'Cash On Delivery', 'Lasam', 'Collar (₱500 x 1)', 500.00, NULL, NULL, '2025-11-07 10:53:35', 'pending', NULL, 'pending', '2025-11-07 02:53:35', NULL, NULL, NULL, NULL, NULL),
(65, 45, NULL, NULL, NULL, NULL, NULL, NULL, 'Brian Jay Ilac', '09123213213', 'lovebrianjayilac@gmail.com', 'Cash On Delivery', 'Lasam', 'Collar (₱500 x 1)', 500.00, NULL, NULL, '2025-11-07 10:53:39', 'pending', '2025-12-07', 'To Received', '2025-12-07 11:07:52', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 40, 64, 1, 600.00),
(2, 41, 64, 1, 600.00),
(3, 42, 64, 1, 600.00),
(4, 43, 64, 1, 600.00),
(5, 44, 64, 1, 600.00),
(6, 45, 64, 1, 600.00),
(7, 46, 64, 1, 600.00),
(8, 47, 64, 1, 600.00),
(9, 48, 62, 1, 500.00),
(10, 49, 63, 1, 550.00),
(11, 50, 63, 99, 550.00),
(12, 51, 62, 99, 500.00),
(13, 52, 62, 1, 500.00),
(14, 53, 62, 99, 500.00),
(15, 54, 63, 1, 550.00),
(16, 55, 63, 1, 550.00),
(17, 56, 63, 1, 550.00),
(18, 57, 63, 1, 550.00),
(19, 58, 63, 1, 550.00),
(20, 59, 62, 1, 500.00),
(21, 60, 62, 1, 500.00),
(22, 61, 62, 1, 500.00),
(23, 62, 63, 1, 550.00),
(24, 63, 62, 1, 500.00),
(25, 64, 62, 1, 500.00),
(26, 65, 62, 1, 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_ratings`
--

CREATE TABLE `order_ratings` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(1) NOT NULL,
  `review` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_ratings`
--

INSERT INTO `order_ratings` (`id`, `order_id`, `user_id`, `product_id`, `rating`, `review`, `created_at`) VALUES
(6, 52, 40, 62, 5, '', '2025-10-18 20:25:32'),
(7, 53, 40, 62, 5, 'wow bilis', '2025-10-18 20:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(56, 'tarpaulin', 'Tarpaulin', 123, '03.png'),
(57, 'Souvenir', 'Souvenirs', 100, '04.png'),
(58, 'Sticker', 'Customize stickers', 300, '02.png'),
(61, 'Chinese Collar', 'Full sublimation', 500, 'CA ML mockup copy.jpg'),
(62, 'Collar', 'Full sublimation', 500, 'Educ ColSC mockup copy.jpg'),
(63, 't-shirt 123', 'Full sublimation', 550, 'wallpaper.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `valid_id` varchar(255) DEFAULT NULL,
  `security_question_1` varchar(255) DEFAULT NULL,
  `security_answer_1` varchar(255) DEFAULT NULL,
  `security_question_2` varchar(255) DEFAULT NULL,
  `security_answer_2` varchar(255) DEFAULT NULL,
  `security_question_3` varchar(255) DEFAULT NULL,
  `security_answer_3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`, `valid_id`, `security_question_1`, `security_answer_1`, `security_question_2`, `security_answer_2`, `security_question_3`, `security_answer_3`) VALUES
(40, 'Lucky Keith Padua', 'luckypadua4@gmail.com', '09930512859', '$2y$10$N2Q1Bhjv7f6WFWc.q16puOqkaBlNQ0EYpNkoQ1AE8FwenTtIJbAO2', 'Centro Sur', 'uploaded_ids/68dccee3a0f52_ATTY.png', 'What is your favorite movie?', '123', 'What is your dream job?', '123', 'What is your pet&#39;s name?', '123'),
(43, 'LuckyPadua', 'luckypadua1@gmail.com', '09059353907', '$2y$10$Uzoa1WaaaWa0/8sFN4PHO.9ZWx91NS05BVXzI7bHyn4QETbR9ahBa', 'Piat ', 'uploaded_ids/690af01a8b874_trademark1.jpg', 'What is your favorite movie?', 'qwe', 'What is your dream job?', 'qwe', 'What is your pet&#39;s name?', 'qwe'),
(44, 'Jomar Medina', 'medinajomar69@gmail.com', '09213213213', '$2y$10$AIBhi/89ILf9H4j8ieIkVuhGUGyz2TpJx7eUZsrW18K5jj6anjPRW', 'Solana', 'uploaded_ids/690af286116fa_asf.jpg', 'What is your favorite movie?', 'qew', 'What is your dream job?', 'qwe', 'What is your pet&#39;s name?', 'qwe'),
(45, 'Brian Jay Ilac', 'lovebrianjayilac@gmail.com', '09123213213', '$2y$10$pazhTNbx5mkZIqPih1/nfOKbBArnYvomSAyFJT.dZdZZDRW5KeQSS', 'Lasam', 'uploaded_ids/690af36ed47f7_trademark1.jpg', 'What is your favorite movie?', 'asd', 'What is your dream job?', 'asd', 'What is your pet&#39;s name?', 'asd'),
(46, 'Lucky Padua', 'luckybaltazar21@gmail.com', '09132132132', '$2y$10$4t23SPiazOg3T1CLeWfDNe5rgYgZk1dRFw/kUKatKsdkyV9APTzvO', 'Piat', 'uploaded_ids/690af3f5e65bd_asf.jpg', 'What is your favorite movie?', 'qwe', 'What is your dream job?', 'qwe', 'What is your pet&#39;s name?', 'qwe'),
(49, 'Brian ', 'brianjayilac05@gmail.com', '09213213213', '$2y$10$G833LYwgHRxY0d51w0Q.0O1bPROJyUn4WU3M/D3vU3sdnSVrSqHVu', 'Lasam', 'uploaded_ids/690b0bdce3245_trademark.jpg', 'What is your favorite movie?', 'qwe', 'What is your dream job?', 'qwe', 'What is your pet&#39;s name?', 'qwe'),
(52, 'Lucky Baltazar Padua', 'luckypadua03@gmail.com', '09213213213', '$2y$10$XSHlfBKm/kTgthDSsmIaS.OEFovVlkUU1nD8JH1DvPWbierGEX24m', 'Poblacion 1', 'uploaded_ids/690b0d3ef11e9_JOY.jpg', 'What is your favorite movie?', 'qwe', 'What is your dream job?', 'qwe', 'What is your pet&#39;s name?', 'qwe'),
(53, 'Lucky', 'luckypadua123@gmail.com', '09123213213', '$2y$10$z2T.titgjU8oJCTl.dctY.2c71wozN2ERryVSY5orn9Q/AXKFL4pi', 'Faire, Cagayan', 'uploaded_ids/690b0e05b39db_Skye.jpg', 'What is your favorite movie?', 'qew', 'What is your dream job?', 'qwe', 'What school did you go to?', 'qwe'),
(56, 'Chrizel Jane Palafox', 'chrizeljanegonzales@gmail.com', '09031232131', '$2y$10$ldtHeYPKZIExVsuyQpXnje6oW9I5heUlHaNe2uu5Kfa1yhyQT0KFO', 'Piat Cagayan', 'uploaded_ids/690b3735b6d81_JOY.jpg', 'What is your favorite movie?', 'qwe', 'What is your dream job?', 'qwe', 'What is your pet&#39;s name?', 'qwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `conversation_messages`
--
ALTER TABLE `conversation_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_ratings`
--
ALTER TABLE `order_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_ratings_product_fk` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversation_messages`
--
ALTER TABLE `conversation_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_ratings`
--
ALTER TABLE `order_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_ratings`
--
ALTER TABLE `order_ratings`
  ADD CONSTRAINT `order_ratings_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_ratings_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
