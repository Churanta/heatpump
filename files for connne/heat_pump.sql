-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2022 at 07:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `heat_pump`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `url` longtext NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_devices`
--

CREATE TABLE `tbl_devices` (
  `device_id` varchar(16) NOT NULL COMMENT 'device name ',
  `UserId` varchar(16) NOT NULL COMMENT 'user id owner of device.',
  `device_nm` varchar(50) NOT NULL COMMENT 'name of device.',
  `device_state` int(2) NOT NULL COMMENT 'preseent working state of a device.',
  `time_left` int(10) DEFAULT NULL COMMENT 'work time left for finishing.\r\n',
  `mqtt_ep` varchar(255) NOT NULL COMMENT 'mqtt end point for the device.',
  `device_count` int(10) NOT NULL COMMENT 'total devices count per owner.',
  `created_time` datetime(6) NOT NULL DEFAULT current_timestamp(6) COMMENT 'creation time of a device.',
  `present_recipe` varchar(50) NOT NULL COMMENT 'presen recipy name',
  `recipe_id` varchar(16) NOT NULL COMMENT 'present recipy id.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifuy`
--

CREATE TABLE `tbl_notifuy` (
  `uid` varchar(16) NOT NULL COMMENT 'notification for perticular user id',
  `Dev_id` varchar(16) NOT NULL COMMENT 'device id for any notification',
  `not_type` varchar(10) NOT NULL COMMENT 'it will be the type of error of just a status.',
  `not_comment` varchar(255) NOT NULL COMMENT 'detailed explaination on perticular error.',
  `not_time` datetime(6) NOT NULL DEFAULT current_timestamp(6) COMMENT 'perticular time of notification triggered.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recipe`
--

CREATE TABLE `tbl_recipe` (
  `rcp_id` varchar(16) NOT NULL COMMENT 'recipe id',
  `rcp_name` varchar(50) NOT NULL COMMENT 'recipe nanme',
  `rcp_uid` varchar(16) NOT NULL COMMENT 'user created recipe',
  `rcp_temp` varchar(5) NOT NULL COMMENT 'temperature setup of a recipe.',
  `rcp_humidity` varchar(5) NOT NULL COMMENT 'perticular humidity of recipe',
  `rcp_cmt` varchar(255) NOT NULL COMMENT 'any note on the perticular recipe.',
  `rcp_tmpC` tinyint(1) NOT NULL COMMENT 'dose recipe controle on temperature basis.\r\n',
  `rcp_humC` tinyint(1) NOT NULL COMMENT 'dose recipe controle on humiditu basis.',
  `rcp_ctime` datetime(6) NOT NULL DEFAULT current_timestamp(6) COMMENT 'recipe initiated time.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_devices`
--
ALTER TABLE `tbl_devices`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `tbl_notifuy`
--
ALTER TABLE `tbl_notifuy`
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `tbl_recipe`
--
ALTER TABLE `tbl_recipe`
  ADD PRIMARY KEY (`rcp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
