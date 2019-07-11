-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 11, 2019 at 10:18 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `ms_company`
--

CREATE TABLE `ms_company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` text NOT NULL,
  `company_phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_company`
--

INSERT INTO `ms_company` (`company_id`, `company_name`, `company_address`, `company_phone`) VALUES
(12, 'PT. Mutiara', 'Bandung', 98765654),
(13, 'PT. BRI', 'Jakarta Selatan', 987654343),
(16, 'PT. Cafe', 'Bekasi Barat', 99999999),
(18, 'PT. GSI', 'Jakarta Utara', 56565656);

-- --------------------------------------------------------

--
-- Table structure for table `ms_employee`
--

CREATE TABLE `ms_employee` (
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_gender` int(11) NOT NULL,
  `employee_birthday` date NOT NULL,
  `employee_picture` varchar(100) NOT NULL,
  `employee_phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ms_company`
--
ALTER TABLE `ms_company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `ms_employee`
--
ALTER TABLE `ms_employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `index` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ms_company`
--
ALTER TABLE `ms_company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ms_employee`
--
ALTER TABLE `ms_employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ms_employee`
--
ALTER TABLE `ms_employee`
  ADD CONSTRAINT `fk_employee_company` FOREIGN KEY (`company_id`) REFERENCES `ms_company` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
