-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2024 at 10:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms1`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

CREATE TABLE `contributions` (
  `full_name` varchar(200) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `type` enum('Tithe','Building','Meeting') DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contributions`
--

INSERT INTO `contributions` (`full_name`, `member_id`, `type`, `amount`, `date`) VALUES
('JENIPHER SELUNGE MAHENDE', 21, 'Tithe', 22000.00, '2024-09-12'),
('PRETER KYAMBA', 16, 'Meeting', 2000.00, '2024-09-27'),
('samson haule', 11, 'Meeting', 1233123.00, '2024-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `event_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `event_date`) VALUES
(22, 'OUTREACH', 'WILL BE CONDUCTED AT TABORA', '2024-09-19'),
(23, 'VOICE OF PRAISE', 'GOD WILL BE THERE', '2024-09-13'),
(24, 'INREACH', 'JEHOVA RAPHER', '2024-09-28'),
(25, 'CHARITY', 'LOVE IS POWER', '2024-09-21');

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

CREATE TABLE `event_registrations` (
  `id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `role` enum('Pastor','Permanent Secretary','Treasurer','Member') NOT NULL,
  `marital_status` enum('Single','Married','Divorced','Widowed') NOT NULL,
  `address` text NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `username`, `password`, `first_name`, `middle_name`, `last_name`, `gender`, `role`, `marital_status`, `address`, `phone_number`, `profile_picture`) VALUES
(1, 'shoo', '12345', 'NDESALIO', 'CHARLES', 'SHOO', 'Male', 'Pastor', 'Single', 'shoondesalio@gmail.com', '0682433024', NULL),
(9, 'VICTORY', '1234', 'USHINDI', 'HOSSEA', 'KILAS', 'Female', 'Member', 'Single', 'NJOMBE', '622444352', NULL),
(10, 'fundi', '333fundi', 'MSAFIRI', 'ALLY', 'FUNDI', 'Male', 'Member', 'Single', 'MOROGORO', '76388728', NULL),
(11, 'sam', '123SAM', 'SAMSON', 'CARLOS', 'HAULE', 'Male', 'Member', 'Single', 'DODOMA', '75563560', NULL),
(14, 'ndonyi', '1234', 'BARAKA', 'OGONGI', 'NDONYI', 'Male', 'Treasurer', 'Single', 'MARA', '745446144', NULL),
(15, 'agy', '1234', 'AGNES', 'RAMSON', 'FENEAS', 'Female', 'Permanent Secretary', 'Single', 'MBEYA', '76543232', 'myfile.php66e00c6dc09986.33537846.png'),
(16, 'peter', '1234', 'PETER', 'TUNTUFYE', 'KYAMBA', 'Male', 'Member', 'Single', 'DAR ES SALAAM', '758697856', 'myfile.php66e1422a88e8b2.29592478.png'),
(21, '21selunge', '10@', 'JENIPHER', 'SELUNGE', 'MAHENDE', 'Female', 'Member', 'Single', 'IRINGA', '0754536425', 'myfile.php66df60ef8e9559.22164553.jpg'),
(24, 'wea', '1234', 'gian', 'ric', 'sankala', 'Male', 'Member', 'Married', 'aada', '0234534234', NULL),
(25, 'mlimwa', '1234', 'EMENAULI', 'KIDATO', 'MLIMWA', 'Male', 'Member', 'Single', 'TABORA', '0765435543', NULL),
(26, 'NAME', '1234', 'JACOB', 'KIBALO', 'JUMMNE', 'Male', 'Member', 'Single', 'KIGOMA', '07866456646', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offering`
--

CREATE TABLE `offering` (
  `offering_type` varchar(100) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offering`
--

INSERT INTO `offering` (`offering_type`, `amount`, `date`) VALUES
('Thanks Giving', 2000000, '2024-09-29'),
('Offering', 30000, '2024-09-21');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `member_id`, `event_id`, `registration_date`) VALUES
(84, 10, 22, '2024-09-11 06:03:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contributions`
--
ALTER TABLE `contributions`
  ADD PRIMARY KEY (`full_name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `registrations_ibfk_2` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `event_registrations`
--
ALTER TABLE `event_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `event_registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
