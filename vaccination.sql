-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2022 at 07:33 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaccination`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `empId` int(11) NOT NULL,
  `empFullName` varchar(50) NOT NULL,
  `empNIC` varchar(50) NOT NULL,
  `empGender` varchar(50) NOT NULL,
  `empEmail` varchar(50) NOT NULL,
  `empContactNo` varchar(50) NOT NULL,
  `empAddress` varchar(50) NOT NULL,
  `empBirth` varchar(50) NOT NULL,
  `empJoin` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `repassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`empId`, `empFullName`, `empNIC`, `empGender`, `empEmail`, `empContactNo`, `empAddress`, `empBirth`, `empJoin`, `password`, `repassword`) VALUES
(1, 'Thenuka', '982442214V', 'M', 'thenu@gmail.com', '0789644682', 'kandy', '1998-08-31', '2022-01-01', 'hane@123', 'hane@123');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `empId` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `vaccineType` varchar(50) NOT NULL,
  `noVaccines` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `employeeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`empId`, `location`, `date`, `vaccineType`, `noVaccines`, `employeeId`, `employeeName`) VALUES
(1, 'belihuloya', '2022-01-01', 'Moderna', '100', 'em1', 'sasanka');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_details`
--

CREATE TABLE `vaccine_details` (
  `vaccineNo` int(11) NOT NULL,
  `vaccineName` varchar(50) NOT NULL,
  `batchNumber` varchar(50) NOT NULL,
  `receiveDate` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `expireDate` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine_details`
--

INSERT INTO `vaccine_details` (`vaccineNo`, `vaccineName`, `batchNumber`, `receiveDate`, `country`, `expireDate`, `quantity`) VALUES
(1, 'Pfizer', 'pft4701001', '2022-04-13', 'USA', '2022-05-19', 10000),
(2, 'Sputnik', 'spt00457', '2022-04-14', 'USA', '2022-08-24', 450000),
(4, 'Moderna', 'mdr4500123', '2022-04-15', 'canada', '2022-07-21', 50000),
(5, 'Moderna', 'mdr4500123', '2022-04-21', 'canada', '2022-07-21', 50000),
(6, 'Sinopharm', 'fr34689', '2022-04-13', 'CHINA', '2022-05-19', 1000),
(8, 'AstraZeneca', 'mdr4500123', '2022-05-03', 'brazil', '2022-06-23', 10000),
(9, 'Sinopharm', 'pft4701001', '2022-05-06', 'CHINA', '2022-07-27', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `vaccin_details`
--

CREATE TABLE `vaccin_details` (
  `vaccineNo` int(11) NOT NULL,
  `vaccineName` varchar(50) NOT NULL,
  `batchNo` varchar(50) NOT NULL,
  `dose` varchar(50) NOT NULL,
  `vaccinedDate` varchar(10) NOT NULL,
  `province` varchar(30) NOT NULL,
  `district` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contactNo` varchar(50) NOT NULL,
  `NIC` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccin_details`
--

INSERT INTO `vaccin_details` (`vaccineNo`, `vaccineName`, `batchNo`, `dose`, `vaccinedDate`, `province`, `district`, `name`, `age`, `email`, `contactNo`, `NIC`, `gender`) VALUES
(1, 'Moderna', 'ht764534', 'second done', '2022-01-01', 'sabaragamuwa', 'kegalla', 'dulitha', 22, 'dulitha@gmial.com', '0773469263', '985462973V', 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `vaccine_details`
--
ALTER TABLE `vaccine_details`
  ADD PRIMARY KEY (`vaccineNo`);

--
-- Indexes for table `vaccin_details`
--
ALTER TABLE `vaccin_details`
  ADD PRIMARY KEY (`vaccineNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `empId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `empId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vaccine_details`
--
ALTER TABLE `vaccine_details`
  MODIFY `vaccineNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vaccin_details`
--
ALTER TABLE `vaccin_details`
  MODIFY `vaccineNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
