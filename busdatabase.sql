-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2021 at 06:33 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `class` varchar(10) NOT NULL DEFAULT 'second',
  `no` int(11) NOT NULL DEFAULT '1',
  `seat` varchar(30) NOT NULL,
  `date` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `schedule_id`, `payment_id`, `user_id`, `code`, `class`, `no`, `seat`, `date`) VALUES
(21, 18, 19, 1, '2020/018/1671', 'first', 8, 'F01 -F08', 'Tue, 11-Aug-2020 04:10:29 PM'),
(25, 24, 23, 2, '2020/024/197', 'second', 2, 'S001 - S002', 'Sun, 15-Nov-2020 02:25:27 PM');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(400) NOT NULL,
  `response` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `message`, `response`) VALUES
(1, 1, 'This is a demo test.', NULL),
(3, 2, 'Demo Test - 2', 'Are you sure that this is another test? ');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `loc` varchar(40) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`id`, `name`, `email`, `password`, `phone`, `address`, `loc`, `status`) VALUES
(1, 'Amir Khan', 'amir@yahoo.com', '1f87051e29a6927b2e6651dfb9b66387', '01234567999', 'Gulshan-2', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1),
(2, 'Malinga', 'malinga@yahoo.com', '1526755d438e395e551f229a484f8a1d', '01588887777', 'Gulshan-1', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1);
-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `date` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `passenger_id`, `schedule_id`, `amount`, `ref`, `date`) VALUES
(19, 1, 18, '1080', '3TVSHVBQII', 'Tue, 11-Aug-2020 04:10:29 PM'),
(23, 2, 24, '5050', '4TRM9FIFEV', 'Sun, 15-Nov-2020 02:25:27 PM');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `start` varchar(100) NOT NULL,
  `stop` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `start`, `stop`) VALUES
(3, 'Niketon', 'Banani'),
(4, 'Mohakhali', 'Bashundhara'),
(5, 'Badda', 'Uttara'),
(6, 'Banani', 'Gulshan-1'),
(7, 'Uttara', 'Dhanmondi'),
(8, 'Baridhara', 'Farmgate'),
(9, 'Gulshan-1', 'Bashundhara'),
(10, 'Gulshan-2', 'Rampura'),
(11, 'Malibagh', 'Tejgaon'),
(12, 'Rampura', 'Banani'),
(13, 'Mohammadpur', 'Badda'),
(14, 'Hatkhola', 'Mirpur'),
(15, 'Polton', 'Wari'),
(16, 'Mirpur', 'Banani'),
(17, 'Badda', 'Polton'),
(18, 'Uttara', 'Farmgate'),
(19, 'Baridhara', 'Hatkhola');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(10) NOT NULL,
  `first_fee` float NOT NULL,
  `second_fee` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `bus_id`, `route_id`, `date`, `time`, `first_fee`, `second_fee`) VALUES
(5, 7, 7, '11-08-2020', '18:30', 180, 80),
(6, 11, 6, '11-08-2020', '18:30', 200, 85),
(7, 11, 5, '12-08-2020', '18:30', 130, 45),
(8, 11, 4, '13-08-2020', '18:30', 130, 60),
(9, 11, 3, '14-08-2020', '18:30', 100, 40),
(10, 7, 5, '15-08-2020', '18:30', 160, 100),
(11, 9, 7, '16-08-2020', '18:30', 180, 100),
(12, 10, 5, '17-08-2020', '18:30', 310, 150),
(16, 2, 7, '16-08-2020', '11:00', 265, 180),
(17, 9, 3, '23-08-2020', '11:00', 180, 115),
(18, 10, 4, '30-08-2020', '11:00', 180, 100),
(20, 8, 4, '07-11-2020', '22:24', 165, 100),
(22, 8, 3, '08-11-2020', '15:13', 130, 70),
(23, 3, 3, '07-11-2020', '15:10', 100, 85),
(24, 2, 3, '15-11-2020', '15:22', 130, 95),
(25, 1, 3, '11-06-2021', '05:37', 65, 55),
(26, 2, 3, '18-09-2021', '09:00', 130, 90),
(97, 11, 8, '11-10-2021', '11:05', 185, 90),
(98, 10, 14, '12-10-2021', '09:00', 150, 85),
(99, 8, 11, '12-10-2021', '11:10', 166, 79),
(100, 9, 12, '12-10-2021', '12:20', 100, 50),
(101, 2, 10, '12-10-2021', '22:59', 105, 55),
(102, 7, 4, '12-10-2021', '11:02', 105, 65),
(103, 9, 11, '12-10-2021', '04:45', 120, 75),
(104, 12, 15, '14-10-2021', '10:00', 160, 72);

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `first_seat` int(11) NOT NULL,
  `second_seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table ``bus`
--

INSERT INTO `bus` (`id`, `name`, `first_seat`, `second_seat`) VALUES
(1, 'Cholachol', 3, 40),
(2, 'Desh Travels', 2, 30),
(3, 'Green Line', 1, 60),
(7, 'BRTA', 4, 20),
(8, 'Volvo Travels', 3, 25),
(9, 'ENA Express', 4, 850),
(10, 'Sakib Poribahon', 5, 44),
(11, 'Ayan Travels', 2, 50),
(12, 'Sadiq Express', 2, 35),
(13, 'Dhaka Chaka', 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'D00F5D5217896FB7FD601412CB890830');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `schedule_id` (`schedule_id`,`user_id`,`payment_id`) USING BTREE,
  ADD KEY `schedule_id_2` (`schedule_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passenger_id` (`passenger_id`,`schedule_id`),
  ADD KEY `passenger_id_2` (`passenger_id`) USING BTREE,
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `booked_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  ADD CONSTRAINT `booked_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `passenger` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;