-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2018 at 02:16 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbsn`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `getcustomers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcustomers` ()  SELECT * FROM customers$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

DROP TABLE IF EXISTS `admin_login`;
CREATE TABLE IF NOT EXISTS `admin_login` (
  `adminid` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`adminid`, `password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `b_id` int(9) NOT NULL AUTO_INCREMENT,
  `bnk_name` varchar(200) CHARACTER SET armscii8 NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`b_id`, `bnk_name`) VALUES
(1, 'Apex Bank'),
(2, 'Axis'),
(3, 'Canara Bank'),
(4, 'Citi Bank'),
(5, 'HDFC Bank'),
(6, 'ICICI'),
(7, 'Federal Bank'),
(8, 'State Bank Of India Bank'),
(9, 'Union Bank'),
(10, 'Yes Bank');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `name` varchar(30) NOT NULL,
  `cid` int(3) NOT NULL,
  `place` varchar(30) NOT NULL,
  `billno` int(3) NOT NULL,
  `units` int(3) NOT NULL,
  `amount` int(3) NOT NULL,
  `due` int(3) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalamt` int(3) NOT NULL,
  KEY `class` (`place`),
  KEY `name` (`name`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`name`, `cid`, `place`, `billno`, `units`, `amount`, `due`, `date`, `totalamt`) VALUES
('Vijay', 1401957, 'R T Nagar', 257, 77, 629, 19, '2018-11-26 22:39:59', 648);

--
-- Triggers `bill`
--
DROP TRIGGER IF EXISTS `addbill`;
DELIMITER $$
CREATE TRIGGER `addbill` AFTER INSERT ON `bill` FOR EACH ROW insert into bill_logs values(new.name,new.cid,new.place,new.billno,new.units,new.amount,new.due,now(),new.totalamt,'generated')
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `deletebill`;
DELIMITER $$
CREATE TRIGGER `deletebill` AFTER DELETE ON `bill` FOR EACH ROW insert into bill_logs values(old.name,old.cid,old.place,old.billno,old.units,old.amount,old.due,now(),old.totalamt,'paid')
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `updatebill`;
DELIMITER $$
CREATE TRIGGER `updatebill` AFTER UPDATE ON `bill` FOR EACH ROW insert into bill_logs values(new.name,new.cid,new.place,new.billno,new.units,new.amount,new.due,now(),new.totalamt,'updated')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_logs`
--

DROP TABLE IF EXISTS `bill_logs`;
CREATE TABLE IF NOT EXISTS `bill_logs` (
  `name` varchar(30) NOT NULL,
  `cid` int(3) NOT NULL,
  `place` varchar(30) NOT NULL,
  `billno` int(3) NOT NULL,
  `units` int(3) NOT NULL,
  `amount` int(3) NOT NULL,
  `due` int(3) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalamt` int(3) NOT NULL,
  `status` varchar(30) NOT NULL,
  KEY `class` (`place`),
  KEY `name` (`name`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_logs`
--

INSERT INTO `bill_logs` (`name`, `cid`, `place`, `billno`, `units`, `amount`, `due`, `date`, `totalamt`, `status`) VALUES
('Raghav', 1401958, 'Yeshwanthpur', 256, 67, 540, 20, '2018-11-26 22:37:00', 560, 'generated'),
('Vijay', 1401957, 'R T Nagar', 257, 77, 629, 19, '2018-11-26 22:39:59', 648, 'generated'),
('Raghav', 1401958, 'Yeshwanthpur', 256, 67, 540, 20, '2018-11-26 22:43:22', 560, 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `c_id` int(9) NOT NULL AUTO_INCREMENT,
  `card_name` varchar(200) CHARACTER SET armscii8 NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`c_id`, `card_name`) VALUES
(1, 'Visa'),
(2, 'Union Card'),
(3, 'MasterCard'),
(4, 'Maestro');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `name` varchar(30) NOT NULL,
  `cid` int(3) NOT NULL,
  `place_name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`,`cid`),
  KEY `class_name` (`place_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`name`, `cid`, `place_name`) VALUES
('Raj', 1401959, 'Hesaraghatta'),
('Vijay', 1401957, 'R T Nagar'),
('Raghav', 1401958, 'Yeshwanthpur');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `name` varchar(30) NOT NULL,
  `id` int(3) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`name`, `id`) VALUES
('Yeshwanthpur', 560022),
('R T Nagar', 560032),
('Hesaraghatta', 560088);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`place`) REFERENCES `place` (`name`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`name`,`cid`) REFERENCES `customers` (`name`, `cid`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`place_name`) REFERENCES `place` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
