-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2018 at 08:31 PM
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
(1, 'aaa', 'bbb', '9090493402', 'aaa@gmail.com', 2342, 'cxvksvjsndn235xvkjq3sdDDFG35SgSSG5AA', 23082018, 23, 1, 30042015, 30042015, 2, 3);

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
  `vGroupId` int(11) NOT NULL,
  `vName` varchar(100) NOT NULL,
  `vValue` varchar(100) NOT NULL,
  `vUpdateDate` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `vId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehical_service_mapping`
--
ALTER TABLE `vehical_service_mapping`
  MODIFY `vsMappingId` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
