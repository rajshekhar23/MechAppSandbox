-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2018 at 12:28 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mechapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingId` int(11) NOT NULL,
  `bookingDate` bigint(20) NOT NULL,
  `bookingLocationLatitude` float NOT NULL,
  `bookingLocationLongitude` float NOT NULL,
  `bookingUserId` int(11) NOT NULL,
  `bookingVehicalServiceId` int(11) NOT NULL,
  `bookingUserVehicalId` int(11) NOT NULL,
  `bookingCreateDate` bigint(20) NOT NULL,
  `bookingStatus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceId` int(11) NOT NULL,
  `invoiceOrderId` int(11) NOT NULL,
  `invoiceAmount` int(11) NOT NULL,
  `invoiceDate` bigint(20) NOT NULL,
  `invoiceStatus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lookup`
--

CREATE TABLE `lookup` (
  `lookupId` int(11) NOT NULL,
  `lookupGroupId` int(11) NOT NULL,
  `lookupName` varchar(100) NOT NULL,
  `lookupValue` varchar(100) NOT NULL,
  `lookupUpdateDate` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `orderBookingId` int(11) NOT NULL,
  `orderStartTime` bigint(20) NOT NULL,
  `orderEndTime` bigint(20) NOT NULL,
  `orderMechanicUserId` int(11) NOT NULL,
  `orderCreateDate` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_master`
--

CREATE TABLE `service_master` (
  `serviceId` int(11) NOT NULL,
  `serviceGroupId` int(11) NOT NULL,
  `serviceName` varchar(100) NOT NULL,
  `serviceValue` varchar(100) NOT NULL,
  `serviceCost` int(11) NOT NULL,
  `serviceDuration` float NOT NULL,
  `serviceCreateDate` bigint(20) NOT NULL,
  `serviceUpdateDate` bigint(20) NOT NULL,
  `serviceCreatedByUserId` int(11) NOT NULL,
  `serviceUpdatedByUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userFirstName` varchar(100) NOT NULL,
  `userLastName` varchar(100) NOT NULL,
  `userMobileNo` varchar(100) NOT NULL,
  `userEmailId` varchar(100) NOT NULL,
  `userAuthSrcId` int(11) NOT NULL,
  `userAuthToken` varchar(100) NOT NULL,
  `userAuthTokenExpiryDate` bigint(20) NOT NULL,
  `userRoleId` int(11) NOT NULL,
  `userIsActive` tinyint(1) NOT NULL,
  `userCreateDate` bigint(20) NOT NULL,
  `userUpdateDate` bigint(20) NOT NULL,
  `userCreatedByUserId` int(11) NOT NULL,
  `userUpdatedByUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userFirstName`, `userLastName`, `userMobileNo`, `userEmailId`, `userAuthSrcId`, `userAuthToken`, `userAuthTokenExpiryDate`, `userRoleId`, `userIsActive`, `userCreateDate`, `userUpdateDate`, `userCreatedByUserId`, `userUpdatedByUserId`) VALUES
(1, 'aaa', 'bbb', '9090493402', 'aaa@gmail.com', 2342, 'cxvksvjsndn235xvkjq3sdDDFG35SgSSG5AA', 23082018, 23, 1, 30042015, 30042015, 2, 3),
(2, 'bbb', 'bbb', '9090493402', 'bbb@gmail.com', 3546, 'FG35SgSSG5AAcxvksvjsndn235xv35SgSSG5AA', 22082015, 64, 1, 30042015, 30042015, 3, 4),
(3, '', '', '', 'ccc@gmail.com', 3454, '34634ssddgsgSESD35ASRdetete5D', 32220145544632, 3, 1, 32220145544632, 32220145544632, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_device`
--

CREATE TABLE `user_device` (
  `udDeviceId` int(11) NOT NULL,
  `udUserId` int(11) NOT NULL,
  `udDeviceIMEI` varchar(100) NOT NULL,
  `udDeviceOS` varchar(100) NOT NULL,
  `udDeviceActivatedDate` bigint(20) NOT NULL,
  `udDeviceLastActiveDate` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_location`
--

CREATE TABLE `user_location` (
  `ulUserId` int(11) NOT NULL,
  `ulDeviceId` int(11) NOT NULL,
  `ulLocationLatitude` float NOT NULL,
  `ulLocationLongitude` float NOT NULL,
  `ulUpdateDate` bigint(20) NOT NULL,
  `ulRefreshDuration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_vehical_mapping`
--

CREATE TABLE `user_vehical_mapping` (
  `uvMappingId` int(11) NOT NULL,
  `uvUserId` int(11) NOT NULL,
  `uvVehicalId` int(11) NOT NULL,
  `uvCreateDate` bigint(20) NOT NULL,
  `uvUpdateDate` bigint(20) NOT NULL,
  `uvCreatedByUserId` int(11) NOT NULL,
  `uvUpdatedByUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehical_master`
--

CREATE TABLE `vehical_master` (
  `vId` int(11) NOT NULL,
  `vGroupId` int(11) DEFAULT NULL,
  `vName` varchar(100) NOT NULL,
  `vValue` varchar(100) NOT NULL,
  `vUpdateDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehical_master`
--

INSERT INTO `vehical_master` (`vId`, `vGroupId`, `vName`, `vValue`, `vUpdateDate`) VALUES
(1, NULL, 'MARUTI SUZUKI', 'MARUTI SUZUKI', '2018-05-16'),
(2, NULL, 'HONDA', 'HONDA', '2018-05-08'),
(3, NULL, 'HYUNDAI', 'HYUNDAI', '2018-05-30'),
(4, NULL, 'TOYOTA', 'TOYOTA', '2018-05-15'),
(5, NULL, 'TATA', 'TATA', '2018-05-15'),
(6, NULL, 'CHEVEROLET', 'CHEVEROLET', '2018-05-14'),
(7, NULL, 'MAHINDRA', 'MAHINDRA', '2018-06-12'),
(8, NULL, 'FORD', 'FORD', '2018-04-24'),
(9, NULL, 'NISSAN', 'NISSAN', '2018-05-27'),
(10, NULL, 'SKODA', 'SKODA', '2018-05-21'),
(11, NULL, 'RENAULT', 'RENAULT', '2018-05-29'),
(12, NULL, 'FIAT', 'FIAT', '2018-05-21'),
(13, NULL, 'DATSUN', 'DATSUN', '2018-05-14'),
(14, NULL, 'AUDI', 'AUDI', '2018-05-31'),
(15, NULL, 'BMW', 'BMW', '2018-05-22'),
(16, NULL, 'VOLKSWAGEN', 'VOLKSWAGEN', '2018-05-16'),
(17, NULL, 'MERCEDES', 'MERCEDES', '2018-05-29'),
(18, 1, '800', '800', '2018-05-01'),
(19, 1, 'A-STAR', 'A-STAR', '2018-05-16'),
(20, 1, 'ALTO K-10', 'ALTO K-10', '2018-05-28'),
(21, 1, 'ALTO', 'ALTO', '2018-05-09'),
(22, 1, 'BALENO', 'BALENO', '2018-05-14'),
(23, 1, 'CELERIO', 'CELERIO', '2018-05-16'),
(24, 1, 'CIAZ', 'CIAZ', '2018-05-16'),
(25, 1, 'EECO', 'EECO', '2018-05-16'),
(26, 1, 'ERTIGA', 'ERTIGA', '2018-05-07'),
(27, 1, 'ESTEEM', 'ESTEEM', '2018-05-16'),
(28, 1, 'ZEN ESTILO', 'ZEN ESTILO', '2018-05-15'),
(29, 1, 'GYPSY', 'GYPSY', '2018-05-30'),
(30, 1, 'OMNI', 'OMNI', '2018-05-23'),
(31, 1, 'RITZ', 'RITZ', '2018-05-15'),
(32, 1, 'S-CROSS', 'S-CROSS', '2018-05-15'),
(33, 1, 'SWIFT', 'SWIFT', '2018-05-17'),
(34, 1, 'SWIFT-DEZIRE', 'SWIFT-DEZIRE', '2018-05-29'),
(35, 1, 'VERSA', 'VERSA', '2018-05-24'),
(36, 1, 'VITARA BREEZA', 'VITARA BREEZA', '2018-05-23'),
(37, 1, 'WAGON-R', 'WAGON-R', '2018-05-16'),
(38, 1, 'SX4', 'SX4', '2018-05-16'),
(39, 1, 'ZEN', 'ZEN', '2018-05-30'),
(40, 2, 'ACCORD', 'ACCORD', '2018-05-24'),
(41, 2, 'AMAZE', 'AMAZE', '2018-05-23'),
(42, 2, 'BRIO', 'BRIO', '2018-05-30'),
(43, 2, 'CITY', 'CITY', '2018-05-23'),
(44, 2, 'CIVIC', 'CIVIC', '2018-05-16'),
(45, 2, '800', '800', '2018-05-23'),
(46, 2, 'JAZZ', 'JAZZ', '2018-05-22'),
(47, 2, 'MOBILIO', 'MOBILIO', '2018-05-02'),
(48, 3, 'ACCENT', 'ACCENT', '2018-05-17'),
(49, 3, 'CRETA', 'CRETA', '2018-05-18'),
(50, 3, 'ELANTRA', 'ELANTRA', '2018-05-07'),
(51, 3, 'EON', 'EON', '2018-05-22'),
(52, 3, 'FLUIDIC', 'FLUIDIC', '2018-05-27'),
(53, 3, 'GETZ', 'GETZ', '2018-05-20'),
(54, 3, 'GRAND I10', 'GRAND I10', '2018-05-22'),
(55, 3, 'I10', 'I10', '2018-05-09'),
(56, 3, 'I20 ELITE', 'I20 ELITE', '2018-05-15'),
(57, 3, 'I20', 'I20', '2018-05-11'),
(58, 3, 'SANTA FE', 'SANTA FE', '2018-05-09'),
(59, 3, 'SANTRO', 'SANTRO', '2018-05-16'),
(60, 3, 'SONATA', 'SONATA', '2018-05-23'),
(61, 3, 'VERNA', 'VERNA', '2018-05-08'),
(62, 3, 'XCENT', 'XCENT', '2018-05-08'),
(63, 4, 'ALTIS', 'ALTIS', '2018-05-09'),
(64, 4, 'COROLLA', 'COROLLA', '2018-05-22'),
(65, 4, 'ETIOS CROSS', 'ETIOS CROSS', '2018-05-23'),
(66, 4, 'ETIOS LIVA', 'ETIOS LIVA', '2018-05-16'),
(67, 4, 'ETIOS', 'ETIOS', '2018-05-21'),
(68, 4, 'FORTUNER', 'FORTUNER', '2018-05-13'),
(69, 4, 'INNOVA', 'INNOVA', '2018-05-31'),
(70, 4, 'QUALIS', 'QUALIS', '2018-05-09'),
(71, 5, 'ARIA', 'ARIA', '2018-05-27'),
(72, 5, 'BOLT', 'BOLT', '2018-05-14'),
(73, 5, 'INDICA', 'INDICA', '2018-05-22'),
(74, 5, 'INDICA VISTA', 'INDICA VISTA', '2018-05-14'),
(75, 5, 'INDICA', 'INDICA', '2018-05-29'),
(76, 5, 'INDIGO MANZA', 'INDIGO MANZA', '2018-05-16'),
(77, 5, 'INDIGO', 'INDIGO', '2018-05-07'),
(78, 5, 'NANO', 'NANO', '2018-05-16'),
(79, 5, 'SAFARI STORME', 'SAFARI STORME', '2018-05-21'),
(80, 5, 'SAFARI', 'SAFARI', '2018-05-28'),
(81, 5, 'SUMO', 'SUMO', '2018-05-28'),
(82, 5, 'TIAGO', 'TIAGO', '2018-05-20'),
(83, 5, 'TIGOR', 'TIGOR', '2018-05-27'),
(84, 5, 'ZEST', 'ZEST', '2018-05-26'),
(85, 6, 'AVEO SAIL', 'AVEO SAIL', '2018-05-26'),
(86, 6, 'BEAT', 'BEAT', '2018-05-24'),
(87, 6, 'CAPTIVA', 'CAPTIVA', '2018-05-30'),
(88, 6, 'CRUZE', 'CRUZE', '2018-05-31'),
(89, 6, 'ENJOY', 'ENJOY', '2018-05-22'),
(90, 6, 'OPTRA SRV', 'OPTRA SRV', '2018-05-22'),
(91, 6, 'OPTRA', 'OPTRA', '2018-05-24'),
(92, 6, 'SPARK', 'SPARK', '2018-05-16'),
(93, 6, 'TAVERA', 'TAVERA', '2018-05-16'),
(94, 6, 'UVA', 'UVA', '2018-05-01'),
(95, 7, 'BOLERO', 'BOLERO', '2018-04-25'),
(96, 7, 'KUV 100', 'KUV 100', '2018-05-27'),
(97, 7, 'OUANTO', 'OUANTO', '2018-05-28'),
(98, 7, 'SCORPIO GETAWAY', 'SCORPIO GETAWAY', '2018-05-21'),
(99, 7, 'SCORPIO', 'SCORPIO', '2018-05-27'),
(100, 7, 'THAR', 'THAR', '2018-05-21'),
(101, 7, 'TUV 300', 'TUV 300', '2018-05-22'),
(102, 7, 'VERITO', 'VERITO', '2018-05-27'),
(103, 7, 'VERITO VIBE', 'VERITO VIBE', '2018-05-07'),
(104, 7, 'XUV500', 'XUV500', '2018-05-09'),
(105, 7, 'XYLO', 'XYLO', '2018-05-08'),
(106, 8, 'ECO SPORT', 'ECO SPORT', '2018-05-14'),
(107, 8, 'ENDEAVOUR', 'ENDEAVOUR', '2018-05-27'),
(108, 8, 'FIESTA', 'FIESTA', '2018-05-20'),
(109, 8, 'FIGO ASPIRE', 'FIGO ASPIRE', '2018-05-13'),
(110, 8, 'FIGO', 'FIGO', '2018-05-27'),
(111, 8, 'FUSION', 'FUSION', '2018-03-20'),
(112, 8, 'IKON', 'IKON', '2018-05-22'),
(113, 9, 'MICRA', 'MICRA', '2018-05-28'),
(114, 9, 'SUNNY', 'SUNNY', '2018-05-22'),
(115, 9, 'TERRANO', 'TERRANO', '2018-05-09'),
(116, 10, 'FABIA', 'FABIA', '2018-05-15'),
(117, 10, 'LAURA', 'LAURA', '2018-05-11'),
(118, 10, 'OCTAVIA', 'OCTAVIA', '2018-05-22'),
(119, 10, 'RAPID', 'RAPID', '2018-05-28'),
(120, 10, 'SUPERB', 'SUPERB', '2018-05-20'),
(121, 10, 'YETI', 'YETI', '2018-04-16'),
(122, 11, 'DUSTER', 'DUSTER', '2018-05-21'),
(123, 11, 'KWID', 'KWID', '2018-05-14'),
(124, 11, 'LOGAN', 'LOGAN', '2018-05-29'),
(125, 11, 'PULSE', 'PULSE', '2018-05-14'),
(126, 11, 'SCALA', 'SCALA', '2018-05-13'),
(127, 12, 'LINEA', 'LINEA', '2018-05-13'),
(128, 12, 'PUNTO', 'PUNTO', '2018-05-21'),
(129, 13, 'GO', 'GO', '2018-05-21'),
(130, 13, 'GO+', 'GO+', '2018-05-06'),
(131, 14, 'A4', 'A4', '2018-05-22'),
(132, 14, 'A6', 'A6', '2018-05-08'),
(133, 14, 'Q3', 'Q3', '2018-05-09'),
(134, 14, 'Q5', 'Q5', '2018-05-08'),
(135, 14, 'Q7', 'Q7', '2018-05-14'),
(136, 15, '320D', '320D', '2018-05-16'),
(137, 15, '320I', '320I', '2018-05-07'),
(138, 15, '520D', '520D', '2018-05-21'),
(139, 15, 'X1', 'X1', '2018-05-28'),
(140, 15, 'X3', 'X3', '2018-05-21'),
(141, 16, 'JETTA', 'JETTA', '2018-05-15'),
(142, 16, 'PASSAT', 'PASSAT', '2018-05-22'),
(143, 16, 'POLO', 'POLO', '2018-05-08'),
(144, 16, 'VENTO', 'VENTO', '2018-05-07'),
(145, 17, 'A180', 'A180', '2018-05-22'),
(146, 17, 'B180', 'B180', '2018-05-08'),
(147, 17, 'C200', 'C200', '2018-05-29'),
(148, 17, 'E CLASS', 'E CLASS', '2018-05-08'),
(149, 17, 'ML 250', 'ML 250', '2018-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `vehical_service_mapping`
--

CREATE TABLE `vehical_service_mapping` (
  `vsMappingId` int(11) NOT NULL,
  `vsVehicalId` int(11) NOT NULL,
  `vsServiceId` int(11) NOT NULL,
  `vsServiceCost` int(11) NOT NULL,
  `vsServiceDuration` float NOT NULL,
  `vsServiceCreateDate` bigint(20) NOT NULL,
  `vsServiceUpdateDate` bigint(20) NOT NULL,
  `vsServiceCreatedByUserId` int(11) NOT NULL,
  `vsServiceUpdatedByUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceId`);

--
-- Indexes for table `lookup`
--
ALTER TABLE `lookup`
  ADD PRIMARY KEY (`lookupId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `service_master`
--
ALTER TABLE `service_master`
  ADD PRIMARY KEY (`serviceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `user_device`
--
ALTER TABLE `user_device`
  ADD PRIMARY KEY (`udDeviceId`);

--
-- Indexes for table `user_location`
--
ALTER TABLE `user_location`
  ADD PRIMARY KEY (`ulUserId`);

--
-- Indexes for table `user_vehical_mapping`
--
ALTER TABLE `user_vehical_mapping`
  ADD PRIMARY KEY (`uvMappingId`);

--
-- Indexes for table `vehical_master`
--
ALTER TABLE `vehical_master`
  ADD PRIMARY KEY (`vId`);

--
-- Indexes for table `vehical_service_mapping`
--
ALTER TABLE `vehical_service_mapping`
  ADD PRIMARY KEY (`vsMappingId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lookup`
--
ALTER TABLE `lookup`
  MODIFY `lookupId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_master`
--
ALTER TABLE `service_master`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_device`
--
ALTER TABLE `user_device`
  MODIFY `udDeviceId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_location`
--
ALTER TABLE `user_location`
  MODIFY `ulUserId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_vehical_mapping`
--
ALTER TABLE `user_vehical_mapping`
  MODIFY `uvMappingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehical_master`
--
ALTER TABLE `vehical_master`
  MODIFY `vId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `vehical_service_mapping`
--
ALTER TABLE `vehical_service_mapping`
  MODIFY `vsMappingId` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
