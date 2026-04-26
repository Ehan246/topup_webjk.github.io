-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2026 at 10:00 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `primetopup_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'mraiprime', '$2y$10$DwWX04NWVR2bhzpKu9Fw7uZRnGu1KCY/Jjz79.6OEeUZQxpAy.vli');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `priority`) VALUES
(1, 'FREE FIRE TOPUP', 1),
(2, 'FRIDAY OFFER', 0),
(3, 'APP SUBSCRIPTION', 2);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `wallet_number` varchar(50) DEFAULT NULL,
  `trx_id` varchar(100) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('uid','voucher') DEFAULT 'uid',
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `type`, `description`, `image`, `api_key`, `category_id`) VALUES
(2, 'Free Fire Topup (BD)', 'uid', 'âœ”ï¸ à¦¶à§à¦§à§à¦®à¦¾à¦¤à§à¦° Bangladesh à¦¸à¦¾à¦°à§à¦­à¦¾à¦°à§‡ UID Code à¦¦à¦¿à§Ÿà§‡ à¦Ÿà¦ª à¦†à¦ª à¦¹à¦¬à§‡ à¥¤\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nâœ”ï¸ Player ID Code à¦­à§à¦² à¦¦à¦¿à§Ÿà§‡ Diamond à¦¨à¦¾ à¦ªà§‡à¦²à§‡ à¦•à¦°à§à¦¤à§ƒà¦ªà¦•à§à¦· à¦¦à¦¾à¦¯à¦¼à§€ à¦¨à¦¯à¦¼ à¥¤\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nâœ”ï¸ Order à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦¹à¦“à¦¯à¦¼à¦¾à¦° à¦ªà¦°à§‡à¦“ à¦†à¦‡à¦¡à¦¿à¦¤à§‡ à¦¡à¦¾à¦‡à¦®à¦¨à§à¦¡ à¦¨à¦¾ à¦—à§‡à¦²à§‡ à¦šà§‡à¦• à¦•à¦°à¦¾à¦° à¦œà¦¨à§à¦¯ ID Pass à¦¦à¦¿à¦¤à§‡ à¦¹à¦¬à§‡ à¥¤\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nâŒ à¦…à¦°à§à¦¡à¦¾à¦° Cancel à¦¹à¦²à§‡ à¦•à¦¿ à¦•à¦¾à¦°à¦£à§‡ à¦¤à¦¾ Cancel à¦¹à§Ÿà§‡à¦›à§‡ à¦¤à¦¾ à¦…à¦°à§à¦¡à¦¾à¦° à¦¹à¦¿à¦¸à§à¦Ÿà§‹à¦°à¦¿à¦¤à§‡ à¦¦à§‡à¦“à§Ÿà¦¾ à¦¥à¦¾à¦•à§‡ à¦…à¦¨à§à¦—à§à¦°à¦¹ à¦ªà§à¦°à§à¦¬à¦• à¦¦à§‡à¦–à§‡ à¦ªà§à¦¨à¦°à¦¾à§Ÿ à¦¸à¦ à¦¿à¦• à¦¤à¦¥à§à¦¯ à¦¦à¦¿à§Ÿà§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¬à§‡à¦¨ âœ˜', 'uploads/game_1769669087.png', 'TPBD-1B87AB7E6594F330', 1),
(3, 'Weekly / Monthly', 'uid', 'â—‹ à¦¶à§à¦§à§à¦®à¦¾à¦¤à§à¦° Bangladesh à¦¸à¦¾à¦°à§à¦­à¦¾à¦°à§‡ UID Code à¦¦à¦¿à§Ÿà§‡ à¦Ÿà¦ª à¦†à¦ª à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâ—‹ Player ID Code à¦­à§à¦² à¦¦à¦¿à§Ÿà§‡ Diamond à¦¨à¦¾ à¦ªà§‡à¦²à§‡ à¦•à¦°à§à¦¤à§ƒà¦ªà¦•à§à¦· à¦¦à¦¾à¦¯à¦¼à§€ à¦¨à¦¯à¦¼ à¥¤\\\\r\\\\nâ—‹ Order à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦¹à¦“à¦¯à¦¼à¦¾à¦° à¦ªà¦°à§‡à¦“ à¦†à¦‡à¦¡à¦¿à¦¤à§‡ à¦¡à¦¾à¦‡à¦®à¦¨à§à¦¡ à¦¨à¦¾ à¦—à§‡à¦²à§‡ à¦šà§‡à¦• à¦•à¦°à¦¾à¦° à¦œà¦¨à§à¦¯ ID Pass à¦¦à¦¿à¦¤à§‡ à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâ—‹ à¦…à¦°à§à¦¡à¦¾à¦° Cancel à¦¹à¦²à§‡ à¦•à¦¿ à¦•à¦¾à¦°à¦£à§‡ à¦¤à¦¾ Cancel à¦¹à§Ÿà§‡à¦›à§‡ à¦¤à¦¾ à¦…à¦°à§à¦¡à¦¾à¦° à¦¹à¦¿à¦¸à§à¦Ÿà§‹à¦°à¦¿à¦¤à§‡ à¦¦à§‡à¦“à§Ÿà¦¾ à¦¥à¦¾à¦•à§‡ à¦…à¦¨à§à¦—à§à¦°à¦¹ à¦ªà§à¦°à§à¦¬à¦• à¦¦à§‡à¦–à§‡ à¦ªà§à¦¨à¦°à¦¾à§Ÿ à¦¸à¦ à¦¿à¦• à¦¤à¦¥à§à¦¯ à¦¦à¦¿à§Ÿà§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¬à§‡à¦¨ ', 'uploads/game_1769753042.png', '', 1),
(4, 'Level Up Pass', 'uid', 'âœ”ï¸ à¦¶à§à¦§à§à¦®à¦¾à¦¤à§à¦° Bangladesh à¦¸à¦¾à¦°à§à¦­à¦¾à¦°à§‡ UID Code à¦¦à¦¿à§Ÿà§‡ à¦Ÿà¦ª à¦†à¦ª à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâœ”ï¸ Player ID Code à¦­à§à¦² à¦¦à¦¿à§Ÿà§‡ Diamond à¦¨à¦¾ à¦ªà§‡à¦²à§‡ à¦•à¦°à§à¦¤à§ƒà¦ªà¦•à§à¦· à¦¦à¦¾à¦¯à¦¼à§€ à¦¨à¦¯à¦¼ à¥¤\\\\r\\\\nâœ”ï¸ Order à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦¹à¦“à¦¯à¦¼à¦¾à¦° à¦ªà¦°à§‡à¦“ à¦†à¦‡à¦¡à¦¿à¦¤à§‡ à¦¡à¦¾à¦‡à¦®à¦¨à§à¦¡ à¦¨à¦¾ à¦—à§‡à¦²à§‡ à¦šà§‡à¦• à¦•à¦°à¦¾à¦° à¦œà¦¨à§à¦¯ ID Pass à¦¦à¦¿à¦¤à§‡ à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâŒ à¦…à¦°à§à¦¡à¦¾à¦° Cancel à¦¹à¦²à§‡ à¦•à¦¿ à¦•à¦¾à¦°à¦£à§‡ à¦¤à¦¾ Cancel à¦¹à§Ÿà§‡à¦›à§‡ à¦¤à¦¾ à¦…à¦°à§à¦¡à¦¾à¦° à¦¹à¦¿à¦¸à§à¦Ÿà§‹à¦°à¦¿à¦¤à§‡ à¦¦à§‡à¦“à§Ÿà¦¾ à¦¥à¦¾à¦•à§‡ à¦…à¦¨à§à¦—à§à¦°à¦¹ à¦ªà§à¦°à§à¦¬à¦• à¦¦à§‡à¦–à§‡ à¦ªà§à¦¨à¦°à¦¾à§Ÿ à¦¸à¦ à¦¿à¦• à¦¤à¦¥à§à¦¯ à¦¦à¦¿à§Ÿà§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¬à§‡à¦¨ âœ˜', 'uploads/game_1769753160.png', '', 1),
(5, 'Weekly Lite [BD]', 'uid', 'âœ”ï¸ à¦¶à§à¦§à§à¦®à¦¾à¦¤à§à¦° Bangladesh à¦¸à¦¾à¦°à§à¦­à¦¾à¦°à§‡ UID Code à¦¦à¦¿à§Ÿà§‡ à¦Ÿà¦ª à¦†à¦ª à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâœ”ï¸ Player ID Code à¦­à§à¦² à¦¦à¦¿à§Ÿà§‡ Diamond à¦¨à¦¾ à¦ªà§‡à¦²à§‡ à¦•à¦°à§à¦¤à§ƒà¦ªà¦•à§à¦· à¦¦à¦¾à¦¯à¦¼à§€ à¦¨à¦¯à¦¼ à¥¤\\\\r\\\\nâœ”ï¸ Order à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦¹à¦“à¦¯à¦¼à¦¾à¦° à¦ªà¦°à§‡à¦“ à¦†à¦‡à¦¡à¦¿à¦¤à§‡ à¦¡à¦¾à¦‡à¦®à¦¨à§à¦¡ à¦¨à¦¾ à¦—à§‡à¦²à§‡ à¦šà§‡à¦• à¦•à¦°à¦¾à¦° à¦œà¦¨à§à¦¯ ID Pass à¦¦à¦¿à¦¤à§‡ à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâŒ à¦…à¦°à§à¦¡à¦¾à¦° Cancel à¦¹à¦²à§‡ à¦•à¦¿ à¦•à¦¾à¦°à¦£à§‡ à¦¤à¦¾ Cancel à¦¹à§Ÿà§‡à¦›à§‡ à¦¤à¦¾ à¦…à¦°à§à¦¡à¦¾à¦° à¦¹à¦¿à¦¸à§à¦Ÿà§‹à¦°à¦¿à¦¤à§‡ à¦¦à§‡à¦“à§Ÿà¦¾ à¦¥à¦¾à¦•à§‡ à¦…à¦¨à§à¦—à§à¦°à¦¹ à¦ªà§à¦°à§à¦¬à¦• à¦¦à§‡à¦–à§‡ à¦ªà§à¦¨à¦°à¦¾à§Ÿ à¦¸à¦ à¦¿à¦• à¦¤à¦¥à§à¦¯ à¦¦à¦¿à§Ÿà§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¬à§‡à¦¨ âœ˜', 'uploads/game_1769753210.png', '', 1),
(6, 'E badge Evo_Access_UID', 'uid', 'âœ”ï¸ à¦¶à§à¦§à§à¦®à¦¾à¦¤à§à¦° Bangladesh à¦¸à¦¾à¦°à§à¦­à¦¾à¦°à§‡ UID Code à¦¦à¦¿à§Ÿà§‡ à¦Ÿà¦ª à¦†à¦ª à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâœ”ï¸ Player ID Code à¦­à§à¦² à¦¦à¦¿à§Ÿà§‡ Diamond à¦¨à¦¾ à¦ªà§‡à¦²à§‡ à¦•à¦°à§à¦¤à§ƒà¦ªà¦•à§à¦· à¦¦à¦¾à¦¯à¦¼à§€ à¦¨à¦¯à¦¼ à¥¤\\\\r\\\\nâœ”ï¸ Order à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦¹à¦“à¦¯à¦¼à¦¾à¦° à¦ªà¦°à§‡à¦“ à¦†à¦‡à¦¡à¦¿à¦¤à§‡ à¦¡à¦¾à¦‡à¦®à¦¨à§à¦¡ à¦¨à¦¾ à¦—à§‡à¦²à§‡ à¦šà§‡à¦• à¦•à¦°à¦¾à¦° à¦œà¦¨à§à¦¯ ID Pass à¦¦à¦¿à¦¤à§‡ à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâŒ à¦…à¦°à§à¦¡à¦¾à¦° Cancel à¦¹à¦²à§‡ à¦•à¦¿ à¦•à¦¾à¦°à¦£à§‡ à¦¤à¦¾ Cancel à¦¹à§Ÿà§‡à¦›à§‡ à¦¤à¦¾ à¦…à¦°à§à¦¡à¦¾à¦° à¦¹à¦¿à¦¸à§à¦Ÿà§‹à¦°à¦¿à¦¤à§‡ à¦¦à§‡à¦“à§Ÿà¦¾ à¦¥à¦¾à¦•à§‡ à¦…à¦¨à§à¦—à§à¦°à¦¹ à¦ªà§à¦°à§à¦¬à¦• à¦¦à§‡à¦–à§‡ à¦ªà§à¦¨à¦°à¦¾à§Ÿ à¦¸à¦ à¦¿à¦• à¦¤à¦¥à§à¦¯ à¦¦à¦¿à§Ÿà§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¬à§‡à¦¨ âœ˜', 'uploads/game_1769753257.png', '', 1),
(7, 'Indonesia Topup', 'uid', 'âœ”ï¸ à¦¶à§à¦§à§à¦®à¦¾à¦¤à§à¦° Indonesia à¦¸à¦¾à¦°à§à¦­à¦¾à¦°à§‡ UID Code à¦¦à¦¿à§Ÿà§‡ à¦Ÿà¦ª à¦†à¦ª à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâœ”ï¸ Player ID Code à¦­à§à¦² à¦¦à¦¿à§Ÿà§‡ Diamond à¦¨à¦¾ à¦ªà§‡à¦²à§‡ à¦•à¦°à§à¦¤à§ƒà¦ªà¦•à§à¦· à¦¦à¦¾à¦¯à¦¼à§€ à¦¨à¦¯à¦¼ à¥¤\\\\r\\\\nâœ”ï¸ Order à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦¹à¦“à¦¯à¦¼à¦¾à¦° à¦ªà¦°à§‡à¦“ à¦†à¦‡à¦¡à¦¿à¦¤à§‡ à¦¡à¦¾à¦‡à¦®à¦¨à§à¦¡ à¦¨à¦¾ à¦—à§‡à¦²à§‡ à¦šà§‡à¦• à¦•à¦°à¦¾à¦° à¦œà¦¨à§à¦¯ ID Pass à¦¦à¦¿à¦¤à§‡ à¦¹à¦¬à§‡ à¥¤\\\\r\\\\nâŒ à¦…à¦°à§à¦¡à¦¾à¦° Cancel à¦¹à¦²à§‡ à¦•à¦¿ à¦•à¦¾à¦°à¦£à§‡ à¦¤à¦¾ Cancel à¦¹à§Ÿà§‡à¦›à§‡ à¦¤à¦¾ à¦…à¦°à§à¦¡à¦¾à¦° à¦¹à¦¿à¦¸à§à¦Ÿà§‹à¦°à¦¿à¦¤à§‡ à¦¦à§‡à¦“à§Ÿà¦¾ à¦¥à¦¾à¦•à§‡ à¦…à¦¨à§à¦—à§à¦°à¦¹ à¦ªà§à¦°à§à¦¬à¦• à¦¦à§‡à¦–à§‡ à¦ªà§à¦¨à¦°à¦¾à§Ÿ à¦¸à¦ à¦¿à¦• à¦¤à¦¥à§à¦¯ à¦¦à¦¿à§Ÿà§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¬à§‡à¦¨ âœ˜', 'uploads/game_1769753287.png', '', 1),
(8, '100% Bonus Topup', 'uid', 'âœ”ï¸ à¦¶à§à¦§à§à¦®à¦¾à¦¤à§à¦° Bangladesh à¦¸à¦¾à¦°à§à¦­à¦¾à¦°à§‡ UID Code à¦¦à¦¿à§Ÿà§‡ à¦Ÿà¦ª à¦†à¦ª à¦¹à¦¬à§‡ à¥¤\\\\\\\\r\\\\\\\\nâœ”ï¸ Player ID Code à¦­à§à¦² à¦¦à¦¿à§Ÿà§‡ Diamond à¦¨à¦¾ à¦ªà§‡à¦²à§‡ à¦•à¦°à§à¦¤à§ƒà¦ªà¦•à§à¦· à¦¦à¦¾à¦¯à¦¼à§€ à¦¨à¦¯à¦¼ à¥¤\\\\\\\\r\\\\\\\\nâœ”ï¸ Order à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦¹à¦“à¦¯à¦¼à¦¾à¦° à¦ªà¦°à§‡à¦“ à¦†à¦‡à¦¡à¦¿à¦¤à§‡ à¦¡à¦¾à¦‡à¦®à¦¨à§à¦¡ à¦¨à¦¾ à¦—à§‡à¦²à§‡ à¦šà§‡à¦• à¦•à¦°à¦¾à¦° à¦œà¦¨à§à¦¯ ID Pass à¦¦à¦¿à¦¤à§‡ à¦¹à¦¬à§‡ à¥¤\\\\\\\\r\\\\\\\\nâŒ à¦…à¦°à§à¦¡à¦¾à¦° Cancel à¦¹à¦²à§‡ à¦•à¦¿ à¦•à¦¾à¦°à¦£à§‡ à¦¤à¦¾ Cancel à¦¹à§Ÿà§‡à¦›à§‡ à¦¤à¦¾ à¦…à¦°à§à¦¡à¦¾à¦° à¦¹à¦¿à¦¸à§à¦Ÿà§‹à¦°à¦¿à¦¤à§‡ à¦¦à§‡à¦“à§Ÿà¦¾ à¦¥à¦¾à¦•à§‡ à¦…à¦¨à§à¦—à§à¦°à¦¹ à¦ªà§à¦°à§à¦¬à¦• à¦¦à§‡à¦–à§‡ à¦ªà§à¦¨à¦°à¦¾à§Ÿ à¦¸à¦ à¦¿à¦• à¦¤à¦¥à§à¦¯ à¦¦à¦¿à§Ÿà§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¬à§‡à¦¨ âœ˜', 'uploads/game_1769753441.png', '', 2),
(9, 'YouTube Premium', 'uid', 'à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦°à¦¾à¦° à¦†à¦—à§‡ à¦­à¦¾à¦²à§‹ à¦­à¦¾à¦¬à§‡ à¦ªà§œà§‡ à¦¨à¦¿à¦¨\\r\\nâ¦¿ à¦¯à§‡à¦‡ gmail à¦¦à¦¿à§Ÿà§‡ youtube à¦–à§à¦²à¦¾ à¦ Gmail à¦Ÿà¦¿ à¦¦à¦¿à¦¬à§‡à¦¨à¥¤\\r\\n\\r\\nâ¦¿ à¦…à¦°à§à¦¡à¦¾à¦°  complete à¦¹à¦²à§‡ mail à¦¥à§‡à¦•à§‡ invitation accept à¦•à¦°à¦¬à§‡à¦¨à¥¤\\r\\n\\r\\nâ¦¿ à¦¡à§‡à¦²à¦¿à¦­à¦¾à¦°à¦¿ à¦Ÿà¦¾à¦‡à¦® à§©à§¦-à§¬à§¦ à¦®à¦¿à¦¨à¦¿à¦Ÿà§‡à¦° à¦®à¦§à§à¦¯à§‡à¥¤à¥¤ ', 'uploads/game_1769795899.png', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `player_id` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `game_id`, `product_id`, `amount`, `status`, `player_id`, `transaction_id`, `payment_method`, `created_at`) VALUES
(1, 1, 1, 2, NULL, 'pending', '65544', '', 'wallet', '2026-01-28 17:14:07'),
(2, 1, 1, 2, NULL, 'pending', '65544', '', 'wallet', '2026-01-28 17:14:48'),
(3, 1, 1, 2, NULL, 'pending', '65544', '', 'wallet', '2026-01-28 17:16:13'),
(4, 1, 1, 2, NULL, 'pending', '65544', '', 'wallet', '2026-01-28 17:16:16'),
(5, 1, 1, 1, NULL, 'pending', '6654444', '', 'wallet', '2026-01-28 17:18:36'),
(6, 1, 1, 1, NULL, 'pending', '6654444', '', 'wallet', '2026-01-28 17:18:43'),
(7, 1, 1, 1, NULL, 'pending', '664433', '', 'wallet', '2026-01-28 17:25:52'),
(8, 1, 1, 1, NULL, 'pending', '65555', '', 'wallet', '2026-01-28 18:10:17'),
(9, 1, 1, 1, NULL, 'completed', '6655', '', 'wallet', '2026-01-28 18:12:53'),
(10, 1, 1, 1, 26.00, 'pending', '5433555', 'ULVHHLWCLR', 'wallet', '2026-01-28 18:27:53'),
(11, 1, 2, 3, 23.00, 'completed', '3843829963', 'P2KYV2HVNX', 'wallet', '2026-01-29 07:04:11'),
(12, 1, 2, 3, 23.00, 'completed', '3843829963', 'NPD622D9GP', 'wallet', '2026-01-29 07:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `qr_image` varchar(255) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `short_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unipin_code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `game_id`, `name`, `price`, `unipin_code`) VALUES
(3, 2, '25 Daimond', 23.00, 'UPBD-Q-S-0147305');

-- --------------------------------------------------------

--
-- Table structure for table `redeem_codes`
--

CREATE TABLE `redeem_codes` (
  `id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `status` enum('active','used','expired') DEFAULT 'active',
  `order_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `marquee_text` text DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT 'res/logo.png',
  `site_name` varchar(100) DEFAULT 'TopupBD',
  `fab_link` varchar(255) DEFAULT 'https://wa.me/1234567890',
  `google_client_id` text DEFAULT NULL,
  `google_client_secret` text DEFAULT NULL,
  `google_redirect_url` varchar(255) DEFAULT 'http://yoursite.com/google_login.php',
  `facebook` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `youtube` text DEFAULT NULL,
  `telegram_link` text DEFAULT NULL,
  `contact_email` text DEFAULT NULL,
  `whatsapp_number` text DEFAULT NULL,
  `firebase_api_key` text DEFAULT NULL,
  `firebase_auth_domain` text DEFAULT NULL,
  `firebase_database_url` text DEFAULT NULL,
  `firebase_project_id` text DEFAULT NULL,
  `firebase_storage_bucket` text DEFAULT NULL,
  `firebase_messaging_sender_id` text DEFAULT NULL,
  `firebase_app_id` text DEFAULT NULL,
  `admin_bkash_number` text DEFAULT NULL,
  `admin_nagad_number` text DEFAULT NULL,
  `admin_rocket_number` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `marquee_text`, `site_logo`, `site_name`, `fab_link`, `google_client_id`, `google_client_secret`, `google_redirect_url`, `facebook`, `instagram`, `youtube`, `telegram_link`, `contact_email`, `whatsapp_number`, `firebase_api_key`, `firebase_auth_domain`, `firebase_database_url`, `firebase_project_id`, `firebase_storage_bucket`, `firebase_messaging_sender_id`, `firebase_app_id`, `admin_bkash_number`, `admin_nagad_number`, `admin_rocket_number`) VALUES
(1, 'site_name', 'TOPUP BD', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(2, 'site_desc', 'TOPUP BD à¦¥à§‡à¦•à§‡ à¦¸à¦¬à¦šà§‡à¦¯à¦¼à§‡ à¦•à¦® à¦¦à¦¾à¦®à§‡ à¦«à§à¦°à¦¿ à¦«à¦¾à¦¯à¦¼à¦¾à¦° à¦¡à¦¾à¦¯à¦¼à¦®à¦¨à§à¦¡ à¦à¦¬à¦‚ à¦¸à§‹à¦¶à§à¦¯à¦¾à¦² à¦®à¦¿à¦¡à¦¿à¦¯à¦¼à¦¾ à¦¸à¦¾à¦¬à¦¸à§à¦•à§à¦°à¦¿à¦ªà¦¶à¦¨ à¦•à¦¿à¦¨à§à¦¨à¥¤ à¦à¦–à¦¾à¦¨à§‡ à¦ªà¦¾à¦šà§à¦›à§‡à¦¨ AI à¦šà¦¾à¦²à¦¿à¦¤ à§§à§¦à§¦% à¦…à¦Ÿà§‹ à¦Ÿà¦ª-à¦†à¦ª à¦“ à¦…à¦Ÿà§‹ à¦¡à§‡à¦²à¦¿à¦­à¦¾à¦°à¦¿ à¦¸à§à¦¬à¦¿à¦§à¦¾à¥¤ à¦¬à¦¿à¦•à¦¾à¦¶, à¦¨à¦—à¦¦ à¦“ à¦°à¦•à§‡à¦Ÿà§‡à¦° à¦®à¦¾à¦§à§à¦¯à¦®à§‡ à¦ªà§‡à¦®à§‡à¦¨à§à¦Ÿ à¦•à¦°à§à¦¨ à¦¨à¦¿à¦¶à§à¦šà¦¿à¦¨à§à¦¤à§‡ à¦à¦¬à¦‚ à¦¦à§à¦°à§à¦¤à¥¤', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(3, 'currency', 'à§³', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(4, 'marquee_text', '', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(5, 'marquee_active', '1', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(6, 'fab_link', 'https://t.me/DeveloperSketvia01', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(7, 'add_money_video', 'https://youtu.be/buEOvbgRw5o?si=6WyP-py1Lvj8zv18', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(15, 'new_pass', '', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(16, NULL, NULL, 'Notice: Beep Bazar à¦ à§¨à§ª à¦˜à¦¨à§à¦Ÿà¦¾à¦‡ à¦Ÿà¦ªà¦†à¦ª à¦šà¦¾à¦²à§ à¦¥à¦¾à¦•à§‡....!!! à¦¯à§‡à¦•à§‹à¦¨à§‹ à¦¸à¦®à¦¸à§à¦¯à¦¾à¦¯à¦¼ à¦†à¦®à¦¾à¦¦à§‡à¦° à¦Ÿà§‡à¦²à¦¿à¦—à§à¦°à¦¾à¦® à¦ à¦®à§‡à¦¸à§‡à¦œ à¦¦à¦¿à¦¨à¥¤', 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', 'kapabazar-6215d.firebaseapp.com', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', 'kapabazar-6215d', 'kapabazar-6215d.firebasestorage.app', '257446278700', '1:257446278700:web:31e0a8895f5e4690e08389', '01797488769', '01797488769', '01797488769'),
(17, 'home_notice', 'â€Œà¦†à¦®à¦¾à¦¦à§‡à¦° à¦¸à¦¾à¦°à§à¦­à¦¿à¦¸ à§¨à§ª à¦˜à¦¨à§à¦Ÿà¦¾ à¦–à§‹à¦²à¦¾ à¦¥à¦¾à¦•à§‡à¥¤ à¦†à¦ªà¦¨à¦¾à¦°à¦¾ à¦°à¦¾à¦¤-à¦¦à¦¿à¦¨ à§¨à§ª à¦˜à¦¨à§à¦Ÿà¦¾ à§§ à¦®à¦¿à¦¨à¦¿à¦Ÿà§‡à¦° à¦®à¦§à§à¦¯à§‡ à¦…à¦°à§à¦¡à¦¾à¦° à¦•à¦®à¦ªà§à¦²à¦¿à¦Ÿ à¦ªà§‡à§Ÿà§‡ à¦¯à¦¾à¦¬à§‡à¦¨à¥¤ à¦¯à§‡à¦•à§‹à¦¨à§‹ à¦¸à¦®à¦¸à§à¦¯à¦¾à§Ÿ à¦¹à¦²à§‡ à¦†à¦®à¦¾à¦¦à§‡à¦° à¦¹à§‹à¦¯à¦¼à¦¾à¦Ÿà¦¸à¦…à§à¦¯à¦¾à¦ª-à¦ à¦®à§‡à¦¸à§‡à¦œ à¦¦à¦¿à¦¨à¥¤', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'admin_bkash_number', '01797488769', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'admin_nagad_number', '01797488769', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'admin_rocket_number', '01797488769', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'firebase_api_key', 'AIzaSyB-OBIwkj_RWzE7aH1dX_sSMO3LTTzh_0U', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'firebase_database_url', 'https://kapabazar-6215d-default-rtdb.firebaseio.com', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'firebase_path', '', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'google_client_id', '', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'google_client_secret', '', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'google_redirect_url', '', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'firebase_auth_domain', 'http://kapabazar-6215d.firebaseapp.com', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'firebase_project_id', 'kapabazar-6215d', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'firebase_storage_bucket', 'http://kapabazar-6215d.firebasestorage.app', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'firebase_messaging_sender_id', '257446278700', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'firebase_app_id', '1:257446278700:web:31e0a8895f5e4690e08389', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'facebook', 'https://t.me/DeveloperSketvia01', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'instagram', 'https://t.me/DeveloperSketvia01', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'youtube', 'https://t.me/DeveloperSketvia01', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'telegram_link', 'https://t.me/DeveloperSketvia01', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'whatsapp_number', '01797488769', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'contact_email', 'muhammadashfaqbusiness@gmail.com', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'seo_keywords', 'TOPUP BD, Free Fire TopUp, Social Media Subscription, Free Fire Diamond BD, Auto Topup, AI Delivery, SMM Panel BD, Bkash Payment, Nagad Payment, Rocket Payment, Cheap Diamond, Game TopUp BD, Social Media Boost, Instant Delivery\r\n', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'site_logo', 'res/logo.png', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'popup_image', 'uploads/popup_1769795439.png', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'popup_link', 'https://t.me/DeveloperSketvia01', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'popup_btn_text', 'à¦Ÿà§‡à¦²à¦¿à¦—à§à¦°à¦¾à¦® - à¦•à§à¦²à¦¿à¦• à¦•à¦°à§à¦¨', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'popup_description', 'à¦¸à¦•à¦² à¦ªà§à¦°à¦•à¦¾à¦° à¦—à¦¿à¦­à¦“à§Ÿà§‡ à¦“ à¦…à¦«à¦¾à¦° à¦¸à¦®à§à¦ªà¦°à§à¦•à§‡ à¦œà¦¾à¦¨à¦¤à§‡ à¦•à§à¦²à¦¿à¦• à¦•à¦°à§‡ à¦†à¦®à¦¾à¦¦à§‡à¦° Telegram Channel à¦ à¦œà§Ÿà§‡à¦¨ à¦•à¦°à§à¦¨ à¥¤', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'admin_upay_number', '', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'popup_text', 'à¦¸à¦•à¦² à¦ªà§à¦°à¦•à¦¾à¦° à¦—à¦¿à¦­à¦“à§Ÿà§‡ à¦“ à¦…à¦«à¦¾à¦° à¦¸à¦®à§à¦ªà¦°à§à¦•à§‡ à¦œà¦¾à¦¨à¦¤à§‡ à¦•à§à¦²à¦¿à¦• à¦•à¦°à§‡ à¦†à¦®à¦¾à¦¦à§‡à¦° Telegram Channel à¦ à¦œà§Ÿà§‡à¦¨ à¦•à¦°à§à¦¨ à¥¤', NULL, 'res/logo.png', 'TopupBD', 'https://wa.me/1234567890', NULL, NULL, 'http://yoursite.com/google_login.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `link`) VALUES
(1, 'uploads/slider_1769589300.png', 'https://t.me/DeveloperSketvia01'),
(2, 'uploads/slider_1769589314.png', 'https://t.me/DeveloperSketvia01');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(20) DEFAULT 'debit',
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'completed',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `support_pin` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `balance`, `created_at`, `support_pin`, `image`, `avatar`) VALUES
(1, 'Shafin Chowdhury', '01797488769', 'muhammadashfaqbusiness11@gmail.com', '$2y$10$xVqQMISSzVKsWZd9usF/kOgLSu/XTtSw2tiH4szhPrJqfnCCCi0p6', 1028.00, '2026-01-28 08:16:13', 30535, NULL, NULL),
(2, 'Developer Sketvia', '02797488791', 'muhammadashfaqbusiness@gmail.com', '$2y$10$rlocdx8qgA0kf/RpxvqA1OFgYOSesj//r9QsuUZllzciF3ZzUdJRW', 0.00, '2026-01-29 19:37:08', 60153, NULL, NULL),
(4, 'Tobi Islam', '01797488799', 'muhammadashfaqbusines777s@gmail.com', '$2y$10$ZpqdhKtuBRVe3EiAhSQJJ.QFNoPatrY7KME0Dy/arzBkxab4EMHwW', 0.00, '2026-01-31 08:34:20', 89200, NULL, 'https://ui-avatars.com/api/?name=Tobi+Islam&background=random&color=fff'),
(5, 'Tobi Islam', '0179748866', 'muhammadashfaqbusinessvgh@gmail.com', '$2y$10$MTH2y/Y2oxeXJaATi8G6MuOzSvlNurKbaMM37mvI56JcMHBP1C9/6', 0.00, '2026-02-01 12:21:45', 61567, NULL, 'https://ui-avatars.com/api/?name=Tobi+Islam&background=random&color=fff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indexes for table `redeem_codes`
--
ALTER TABLE `redeem_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `redeem_codes`
--
ALTER TABLE `redeem_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
