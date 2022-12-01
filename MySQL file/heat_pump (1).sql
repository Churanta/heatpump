-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 12:38 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
  `photo` varchar(1000) NOT NULL,
  `url` longtext NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `name`, `email`, `password`, `photo`, `url`, `logo`, `created_time`) VALUES
('14', 'hasbh', 'fvggsqe@hfghd.com', '123', '0', '0', '0', '2022-10-29 17:04:54.338948'),
('2', 'hasbh', 'qwqe@hfghd.com', '123', '0', '0', '0', '2022-10-29 17:03:57.173109'),
('268', 'hdgfhg', 'kyyu@s.jhg', 'sddfsz', '0', '0', '0', '2022-10-29 16:49:35.114160'),
('3', 'hgjdf', 'bdnffgd@ee.vrr', '126d', '0', '0', '0', '2022-10-29 17:01:33.947078'),
('aGTMFjC616909134', 'churanta mondal', '132@ghs.com', 'cm12', '0', '0', '0', '2022-10-29 17:13:22.594958'),
('FDlPivc85', 'lzjhdgilaujsg', '154@hgsdfjhbj.dd', '152', '0', '0', '0', '2022-10-29 17:06:16.563994'),
('LbyNtLE941891503', 'vinay sv', 'vinay@gmail.com', 'v12', '0', '0', '0', '2022-10-29 17:14:10.233763'),
('veJLYmy070016540', 'churanta mondal', 'churantamondal@gmail.com', '123', '0', '0', '0', '2022-11-09 11:35:46.851248'),
('vshdbjhds1', 'test', 'test@123.com', '123', '0', '0', '0', '0000-00-00 00:00:00.000000'),
('vshvddbjhs1', 'vfvsdv', 'sdvsd@fsd.bbr', 'fds', '0', '0', '0', '2022-10-29 16:31:09.762573'),
('Wj372508599', 'zxc', 'zxc@fg.cc', 'zxc', '0', '0', '0', '2022-10-29 17:18:33.157249'),
('Wjfnjaj372508599', 'vinay', 'vinay@test.com', '123', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-exp1.licdn.com%2Fdms%2Fimage%2FC4D03AQHybY7GKQmkTQ%2Fprofile-displayphoto-shrink_800_800%2F0%2F1653193749137%3Fe%3D2147483647%26v%3Dbeta%26t%3DSjhZYks3mqEf4wBJA1oKsrwnRK1pkjnfmNmUYNy2Das&imgrefurl=h', 'https://thinkfinitylabs.com/', 'https://thinkfinitylabs.com/wp-content/uploads/2021/11/cropped-Untitled-design-9-150x150.png', '2022-10-29 16:31:09.762573');

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

--
-- Dumping data for table `tbl_devices`
--

INSERT INTO `tbl_devices` (`device_id`, `UserId`, `device_nm`, `device_state`, `time_left`, `mqtt_ep`, `device_count`, `created_time`, `present_recipe`, `recipe_id`) VALUES
('vinay_device', 'Wjfnjaj372508599', 'test_module', 1, 12, 'gfdh', 1, '0000-00-00 00:00:00.000000', '0', '0');

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

--
-- Dumping data for table `tbl_notifuy`
--

INSERT INTO `tbl_notifuy` (`uid`, `Dev_id`, `not_type`, `not_comment`, `not_time`) VALUES
('Wjfnjaj372508599', 'vinay_device', 'allert', 'he is not working well', '0000-00-00 00:00:00.000000');

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

-- --------------------------------------------------------

--
-- Table structure for table `uid_detail`
--

CREATE TABLE `uid_detail` (
  `id_usage` int(1) NOT NULL,
  `id` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='to store all kind of id''s for future reference.';

--
-- Dumping data for table `uid_detail`
--

INSERT INTO `uid_detail` (`id_usage`, `id`) VALUES
(1, 'Wjfnjaj372508599'),
(1, 'veJLYmy070016540');

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
