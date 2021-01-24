-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2021 at 09:35 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter_sentiment`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_name`
--

CREATE TABLE `account_name` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_name`
--

INSERT INTO `account_name` (`account_id`, `account_name`, `date`) VALUES
(6, 'somadanish', '24-Jan-21 19:52:49'),
(7, 'somadanish', '24-Jan-21 19:59:50'),
(8, 'somadanish', '24-Jan-21 20:20:34'),
(9, 'narendramodi', '24-Jan-21 20:59:24'),
(10, 'drharshvardhan', '24-Jan-21 21:00:23'),
(11, 'SomaDanish', '24-Jan-21 21:00:43'),
(12, 'JPNadda', '24-Jan-21 21:03:29'),
(13, 'zarkmuckerberg9', '24-Jan-21 21:04:24'),
(14, 'iamarjunbharti', '24-Jan-21 21:06:11'),
(15, 'SomaDanish', '24-Jan-21 21:06:59'),
(16, 'SomaDanish', '24-Jan-21 21:07:38'),
(17, 'SomaDanish', '24-Jan-21 21:08:10'),
(18, '', '24-Jan-21 21:09:05'),
(19, 'SomaDanish', '24-Jan-21 21:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `sentiment`
--

CREATE TABLE `sentiment` (
  `sentiment_id` int(11) NOT NULL,
  `sentiment` varchar(20) NOT NULL,
  `dated` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sentiment`
--

INSERT INTO `sentiment` (`sentiment_id`, `sentiment`, `dated`) VALUES
(1, 'POSITIVE', '24-1-2021'),
(2, 'NEGATIVE', '2021-01-25 01:25:37.'),
(3, 'NEGATIVE', '2021-01-25 01:26:14.'),
(4, 'MIXED', '2021-01-25 01:29:32.'),
(5, 'NEUTRAL', '2021-01-25 01:30:28.'),
(6, 'NEGATIVE', '2021-01-25 01:30:49.'),
(7, 'NEUTRAL', '2021-01-25 01:33:36.'),
(8, 'NEUTRAL', '2021-01-25 01:34:30.'),
(9, 'NEUTRAL', '2021-01-25 01:36:16.'),
(10, 'MIXED', '2021-01-25 01:37:04.'),
(11, 'MIXED', '2021-01-25 01:37:43.'),
(12, 'NEUTRAL', '2021-01-25 01:38:15.'),
(13, 'NEGATIVE', '2021-01-25 01:39:33.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_name`
--
ALTER TABLE `account_name`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `sentiment`
--
ALTER TABLE `sentiment`
  ADD PRIMARY KEY (`sentiment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_name`
--
ALTER TABLE `account_name`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sentiment`
--
ALTER TABLE `sentiment`
  MODIFY `sentiment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
