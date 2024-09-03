-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 09:14 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.23
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
  time_zone = "+00:00";
  /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
  /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
  /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
  /*!40101 SET NAMES utf8mb4 */;
--
  -- Database: `ptp`
  --
  -- --------------------------------------------------------
  --
  -- Table structure for table `email_send`
  --
  CREATE TABLE `email_send` (
    `id` int(10) NOT NULL,
    `uniqueId` int(20) NOT NULL,
    `title` varchar(50) NOT NULL,
    `message` varchar(100) NOT NULL,
    `users` varchar(150) NOT NULL,
    `date` varchar(50) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- --------------------------------------------------------
  --
  -- Table structure for table `notice`
  --
  CREATE TABLE `notice` (
    `nid` int(10) NOT NULL,
    `uniqueId` int(20) NOT NULL,
    `title` varchar(100) NOT NULL,
    `message` varchar(200) NOT NULL,
    `date` varchar(50) NOT NULL,
    `pdfFile` varchar(50) NOT NULL,
    `pageName` varchar(20) NOT NULL,
    `forPage` varchar(20) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
  --
  -- Table structure for table `signup`
  --
  CREATE TABLE `signup` (
    `id` int(10) NOT NULL,
    `uniqueId` int(20) NOT NULL,
    `fullName` varchar(20) NOT NULL,
    `email` varchar(30) NOT NULL,
    `password` varchar(20) NOT NULL,
    `role` varchar(10) NOT NULL,
    `otp` int(6) NOT NULL,
    `status` varchar(10) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
  -- Indexes for dumped tables
  --
  --
  -- Indexes for table `email_send`
  --
ALTER TABLE
  `email_send`
ADD
  PRIMARY KEY (`id`);
--
  -- Indexes for table `notice`
  --
ALTER TABLE
  `notice`
ADD
  PRIMARY KEY (`nid`);
--
  -- Indexes for table `signup`
  --
ALTER TABLE
  `signup`
ADD
  PRIMARY KEY (`id`, `uniqueId`);
--
  -- AUTO_INCREMENT for dumped tables
  --
  --
  -- AUTO_INCREMENT for table `email_send`
  --
ALTER TABLE
  `email_send`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 23;
--
  -- AUTO_INCREMENT for table `notice`
  --
ALTER TABLE
  `notice`
MODIFY
  `nid` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
--
  -- AUTO_INCREMENT for table `signup`
  --
ALTER TABLE
  `signup`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
COMMIT;
  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
