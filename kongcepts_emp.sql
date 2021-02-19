-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2021 at 09:06 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kongcepts_emp`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(10) NOT NULL,
  `bank_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `bank_name`) VALUES
(2, 'BOC'),
(1, 'HNB');

-- --------------------------------------------------------

--
-- Table structure for table `bank_branch`
--

CREATE TABLE `bank_branch` (
  `branch_id` int(10) NOT NULL,
  `branch_name` varchar(10) NOT NULL,
  `branch_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank_branch`
--

INSERT INTO `bank_branch` (`branch_id`, `branch_name`, `branch_address`) VALUES
(1, 'Nawala', 'nawala road'),
(2, 'pilayandal', 'p.p road');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `empid` int(10) NOT NULL,
  `empname` varchar(10) NOT NULL,
  `nmp_name` varchar(10) NOT NULL,
  `empaddress` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`empid`, `empname`, `nmp_name`, `empaddress`) VALUES
(90, 'kar', 'nkarmi', 'nallur'),
(91, 'banu', 'nkarmi', 'ttty');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(10) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_email` varchar(20) NOT NULL,
  `emp_photo` varchar(100) NOT NULL,
  `emp_address` varchar(50) NOT NULL,
  `emp_password` varchar(20) NOT NULL,
  `branch_name` varchar(10) NOT NULL,
  `bank_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_email`, `emp_photo`, `emp_address`, `emp_password`, `branch_name`, `bank_name`) VALUES
(2, 'karmi', 'kar@gmail.com', 'E:\\seenu\\karmi.png', 'colombo', '1234', 'Nawala', 'HNB'),
(4, 'Sirojan', 'siro@gmail.com', 'E:\\\\seenu\\\\siro.png', 'Dehiwala', '098790', 'Nawala', 'BOC'),
(6, 'banu', 'b@gmail.com', 'c\\\\banu.png', 'kandy', '7778888', 'Nawala', 'BOC'),
(7, 'adnan', 'ad@gmail.com', 'c\\\\ad.png', 'dehiwala', '66544', 'Nawala', 'BOC'),
(8, 'raj', 'raj@gmail.com', 'c\\\\raj.png', 'galle', '990098', 'Nawala', 'HNB'),
(9, 'thala', 'thala@gmail.com', 'c:\\\\th.png', 'matare', '77788444', 'pilayandal', 'BOC');

-- --------------------------------------------------------

--
-- Table structure for table `nmp`
--

CREATE TABLE `nmp` (
  `nmp_id` int(10) NOT NULL,
  `nmp_name` varchar(10) NOT NULL,
  `nmp_address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nmp`
--

INSERT INTO `nmp` (`nmp_id`, `nmp_name`, `nmp_address`) VALUES
(1, 'nkarmi', 'jaff'),
(2, 'nbanu', 'coll');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`),
  ADD UNIQUE KEY `bank_name` (`bank_name`);

--
-- Indexes for table `bank_branch`
--
ALTER TABLE `bank_branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `branch_name` (`branch_name`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`empid`),
  ADD KEY `nn` (`nmp_name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `branchname` (`branch_name`),
  ADD KEY `bankname` (`bank_name`);

--
-- Indexes for table `nmp`
--
ALTER TABLE `nmp`
  ADD PRIMARY KEY (`nmp_id`),
  ADD UNIQUE KEY `nmp_name` (`nmp_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank_branch`
--
ALTER TABLE `bank_branch`
  MODIFY `branch_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `empid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `nmp`
--
ALTER TABLE `nmp`
  MODIFY `nmp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `nn` FOREIGN KEY (`nmp_name`) REFERENCES `nmp` (`nmp_name`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `bankname` FOREIGN KEY (`bank_name`) REFERENCES `bank` (`bank_name`),
  ADD CONSTRAINT `branchname` FOREIGN KEY (`branch_name`) REFERENCES `bank_branch` (`branch_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
