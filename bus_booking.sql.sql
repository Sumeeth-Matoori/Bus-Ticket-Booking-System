-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2025 at 11:56 AM
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
-- Database: `bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `seats` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('CONFIRMED','CANCELLED') NOT NULL DEFAULT 'CONFIRMED',
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `bus_id`, `seats`, `amount`, `status`, `booked_at`) VALUES
(1, 1, 3, 1, 450.00, 'CONFIRMED', '2025-11-09 06:39:43'),
(2, 1, 10, 1, 400.00, 'CONFIRMED', '2025-11-09 06:56:49'),
(3, 3, 10, 12, 4800.00, 'CONFIRMED', '2025-11-11 11:12:27'),
(4, 4, 13, 1, 700.00, 'CANCELLED', '2025-11-14 07:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `bus_no` varchar(20) NOT NULL,
  `travel_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `seats_total` int(11) NOT NULL,
  `seats_available` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `route_id`, `bus_no`, `travel_date`, `departure_time`, `arrival_time`, `seats_total`, `seats_available`) VALUES
(1, 1, 'RJ-101', '2025-11-14', '08:00:00', '12:15:00', 40, 40),
(2, 1, 'RJ-202', '2025-11-14', '16:30:00', '20:45:00', 40, 40),
(3, 2, 'RJ-303', '2025-11-14', '07:15:00', '12:30:00', 36, 35),
(8, 3, 'HYD-YGT-101', '2025-11-14', '08:00:00', '12:00:00', 40, 40),
(9, 6, 'HYD-VZG-102', '2025-11-14', '06:00:00', '13:00:00', 40, 40),
(10, 7, 'HYD-VJD-103', '2025-11-14', '09:00:00', '13:00:00', 40, 27),
(11, 8, 'HYD-BLR-104', '2025-11-09', '07:00:00', '15:00:00', 40, 40),
(12, 9, 'HYD-MAA-105', '2025-11-09', '10:00:00', '18:00:00', 40, 40),
(13, 10, 'HYD-PUN-106', '2025-11-14', '05:30:00', '12:30:00', 40, 40),
(14, 11, 'HYD-MUM-107', '2025-11-09', '06:00:00', '15:00:00', 40, 40),
(15, 12, 'HYD-TPT-108', '2025-11-09', '08:00:00', '14:00:00', 40, 40),
(16, 13, 'HYD-WRL-109', '2025-11-09', '09:00:00', '11:30:00', 40, 40),
(17, 14, 'HYD-NLR-110', '2025-11-09', '06:30:00', '12:30:00', 40, 40);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `source` varchar(80) NOT NULL,
  `destination` varchar(80) NOT NULL,
  `distance_km` int(11) DEFAULT NULL,
  `base_fare` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `source`, `destination`, `distance_km`, `base_fare`) VALUES
(1, 'Rajkot', 'Ahmedabad', 225, 300.00),
(2, 'Rajkot', 'Surat', 375, 450.00),
(3, 'hyd', 'ygt', 300, 450.00),
(4, 'hyd', 'ygt', 300, 450.00),
(5, 'hyd', 'ygt', 300, 450.00),
(6, 'hyd', 'vizag', 620, 800.00),
(7, 'hyd', 'vijayawada', 275, 400.00),
(8, 'hyd', 'bangalore', 575, 750.00),
(9, 'hyd', 'chennai', 625, 850.00),
(10, 'hyd', 'pune', 560, 700.00),
(11, 'hyd', 'mumbai', 710, 950.00),
(12, 'hyd', 'tirupati', 560, 780.00),
(13, 'hyd', 'warangal', 150, 250.00),
(14, 'hyd', 'nellore', 470, 650.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`) VALUES
(1, 'sdfgh', '7894561230', 'zxcvbn@gmail.com'),
(3, 'jay ram', '789651345', 'hcghjey@hgd'),
(4, 'sumreth', '952366', 'h');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`);

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
