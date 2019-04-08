-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2018 at 07:01 PM
-- Server version: 5.6.11
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salesgenie`
--

-- --------------------------------------------------------

--
-- Table structure for table `sg_data`
--

CREATE TABLE `sg_data` (
  `id` int(10) NOT NULL,
  `Date List Produced` varchar(10) DEFAULT NULL,
  `Record Expiration Date` varchar(10) DEFAULT NULL,
  `Company Name` varchar(28) DEFAULT NULL,
  `Verified Record` varchar(3) DEFAULT NULL,
  `Phone Number Combined` varchar(14) DEFAULT NULL,
  `Executive First Name` varchar(5) DEFAULT NULL,
  `Executive Last Name` varchar(5) DEFAULT NULL,
  `Executive Title` varchar(5) DEFAULT NULL,
  `Professional Title` varchar(10) DEFAULT NULL,
  `Executive Gender` varchar(6) DEFAULT NULL,
  `Mailing Address` varchar(20) DEFAULT NULL,
  `Mailing City` varchar(10) DEFAULT NULL,
  `Mailing State` varchar(2) DEFAULT NULL,
  `Mailing Zip Code` int(5) DEFAULT NULL,
  `Mailing Zip 4` int(4) DEFAULT NULL,
  `Mailing Carrier Route` varchar(4) DEFAULT NULL,
  `Mailing Delivery Point Barcode` int(3) DEFAULT NULL,
  `Location Address` varchar(20) DEFAULT NULL,
  `Location City` varchar(10) DEFAULT NULL,
  `Location State` varchar(2) DEFAULT NULL,
  `Location ZIP Code` int(5) DEFAULT NULL,
  `Location ZIP+4` int(4) DEFAULT NULL,
  `Location Address Delivery Point Barcode` int(3) DEFAULT NULL,
  `Location Address Carrier Route` varchar(4) DEFAULT NULL,
  `Fax Number Combined` varchar(10) DEFAULT NULL,
  `Toll Free Number Combined` varchar(10) DEFAULT NULL,
  `County Description` varchar(10) DEFAULT NULL,
  `Metro Area` varchar(16) DEFAULT NULL,
  `Neighborhood` varchar(10) DEFAULT NULL,
  `Latitude` decimal(9,6) DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL,
  `Company Website` varchar(10) DEFAULT NULL,
  `Location Employee Size Actual` varchar(2) DEFAULT NULL,
  `Location Employee Size Range` varchar(8) DEFAULT NULL,
  `Location Sales Volume Actual` varchar(10) DEFAULT NULL,
  `Location Sales Volume Range` varchar(14) DEFAULT NULL,
  `Corporate Employee Size Actual` varchar(10) DEFAULT NULL,
  `Corporate Employee Size Range` varchar(10) DEFAULT NULL,
  `Corporate Sales Volume Actual` varchar(2) DEFAULT NULL,
  `Corporate Sales Volume Range` varchar(10) DEFAULT NULL,
  `Primary SIC Code` varchar(7) DEFAULT NULL,
  `Primary SIC Code Description` varchar(28) DEFAULT NULL,
  `Primary SIC Year Appeared` int(4) DEFAULT NULL,
  `Primary SIC Ad Size` varchar(7) DEFAULT NULL,
  `SIC Code 1` varchar(7) DEFAULT NULL,
  `SIC Code Description 1` varchar(28) DEFAULT NULL,
  `Year Appeared 1` int(4) DEFAULT NULL,
  `Ad Size 1` varchar(7) DEFAULT NULL,
  `Primary NAICS Code` int(8) DEFAULT NULL,
  `Primary NAICS Description` varchar(45) DEFAULT NULL,
  `NAICS 1` varchar(8) DEFAULT NULL,
  `NAICS 1 Description` varchar(16) DEFAULT NULL,
  `Primary Franchise/Specialty` varchar(10) DEFAULT NULL,
  `Franchise Code 2` varchar(10) DEFAULT NULL,
  `Cuisine Type` varchar(10) DEFAULT NULL,
  `Credit Rating Score` varchar(1) DEFAULT NULL,
  `Credit Rating Score Numeric` int(3) DEFAULT NULL,
  `Location Type` varchar(10) DEFAULT NULL,
  `Holding Status` int(1) DEFAULT NULL,
  `Home Business` varchar(2) DEFAULT NULL,
  `Own or Lease` varchar(10) DEFAULT NULL,
  `Foreign Parent` varchar(10) DEFAULT NULL,
  `Fortune 1000 Ranking` int(4) DEFAULT NULL,
  `Year Established` int(4) DEFAULT NULL,
  `Office Size` varchar(10) DEFAULT NULL,
  `Square Footage` varchar(15) DEFAULT NULL,
  `IUSA Number` int(9) DEFAULT NULL,
  `Parent IUSA Number` int(9) DEFAULT NULL,
  `EIN 1` varchar(10) DEFAULT NULL,
  `EIN 2` varchar(10) DEFAULT NULL,
  `EIN 3` varchar(10) DEFAULT NULL,
  `Executive First Name 1` varchar(5) DEFAULT NULL,
  `Executive Last Name 1` varchar(5) DEFAULT NULL,
  `Executive Title 1` varchar(5) DEFAULT NULL,
  `Executive Gender 1` varchar(6) DEFAULT NULL,
  `Executive First Name 2` varchar(10) DEFAULT NULL,
  `Executive Last Name 2` varchar(10) DEFAULT NULL,
  `Executive Title 2` varchar(10) DEFAULT NULL,
  `Executive Gender 2` varchar(10) DEFAULT NULL,
  `Executive First Name 3` varchar(10) DEFAULT NULL,
  `Executive Last Name 3` varchar(10) DEFAULT NULL,
  `Executive Title 3` varchar(10) DEFAULT NULL,
  `Executive Gender 3` varchar(10) DEFAULT NULL,
  `Executive First Name 4` varchar(10) DEFAULT NULL,
  `Executive Last Name 4` varchar(10) DEFAULT NULL,
  `Executive Title 4` varchar(10) DEFAULT NULL,
  `Executive Gender 4` varchar(10) DEFAULT NULL,
  `Executive First Name 5` varchar(10) DEFAULT NULL,
  `Executive Last Name 5` varchar(10) DEFAULT NULL,
  `Executive Title 5` varchar(10) DEFAULT NULL,
  `Executive Gender 5` varchar(10) DEFAULT NULL,
  `Executive First Name 6` varchar(10) DEFAULT NULL,
  `Executive Last Name 6` varchar(10) DEFAULT NULL,
  `Executive Title 6` varchar(10) DEFAULT NULL,
  `Executive Gender 6` varchar(10) DEFAULT NULL,
  `Executive First Name 7` varchar(10) DEFAULT NULL,
  `Executive Last Name 7` varchar(10) DEFAULT NULL,
  `Executive Title 7` varchar(10) DEFAULT NULL,
  `Executive Gender 7` varchar(10) DEFAULT NULL,
  `Executive First Name 8` varchar(10) DEFAULT NULL,
  `Executive Last Name 8` varchar(10) DEFAULT NULL,
  `Executive Title 8` varchar(10) DEFAULT NULL,
  `Executive Gender 8` varchar(10) DEFAULT NULL,
  `Executive First Name 9` varchar(10) DEFAULT NULL,
  `Executive Last Name 9` varchar(10) DEFAULT NULL,
  `Executive Title 9` varchar(10) DEFAULT NULL,
  `Executive Gender 9` varchar(10) DEFAULT NULL,
  `Executive First Name 10` varchar(10) DEFAULT NULL,
  `Executive Last Name 10` varchar(10) DEFAULT NULL,
  `Executive Title 10` varchar(10) DEFAULT NULL,
  `Executive Gender 10` varchar(10) DEFAULT NULL,
  `Executive First Name 11` varchar(10) DEFAULT NULL,
  `Executive Last Name 11` varchar(10) DEFAULT NULL,
  `Executive Title 11` varchar(10) DEFAULT NULL,
  `Executive Gender 11` varchar(10) DEFAULT NULL,
  `Executive First Name 12` varchar(10) DEFAULT NULL,
  `Executive Last Name 12` varchar(10) DEFAULT NULL,
  `Executive Title 12` varchar(10) DEFAULT NULL,
  `Executive Gender 12` varchar(10) DEFAULT NULL,
  `Executive First Name 13` varchar(10) DEFAULT NULL,
  `Executive Last Name 13` varchar(10) DEFAULT NULL,
  `Executive Title 13` varchar(10) DEFAULT NULL,
  `Executive Gender 13` varchar(10) DEFAULT NULL,
  `Executive First Name 14` varchar(10) DEFAULT NULL,
  `Executive Last Name 14` varchar(10) DEFAULT NULL,
  `Executive Title 14` varchar(10) DEFAULT NULL,
  `Executive Gender 14` varchar(10) DEFAULT NULL,
  `Executive First Name 15` varchar(10) DEFAULT NULL,
  `Executive Last Name 15` varchar(10) DEFAULT NULL,
  `Executive Title 15` varchar(10) DEFAULT NULL,
  `Executive Gender 15` varchar(10) DEFAULT NULL,
  `Executive First Name 16` varchar(10) DEFAULT NULL,
  `Executive Last Name 16` varchar(10) DEFAULT NULL,
  `Executive Title 16` varchar(10) DEFAULT NULL,
  `Executive Gender 16` varchar(10) DEFAULT NULL,
  `Executive First Name 17` varchar(10) DEFAULT NULL,
  `Executive Last Name 17` varchar(10) DEFAULT NULL,
  `Executive Title 17` varchar(10) DEFAULT NULL,
  `Executive Gender 17` varchar(10) DEFAULT NULL,
  `Executive First Name 18` varchar(10) DEFAULT NULL,
  `Executive Last Name 18` varchar(10) DEFAULT NULL,
  `Executive Title 18` varchar(10) DEFAULT NULL,
  `Executive Gender 18` varchar(10) DEFAULT NULL,
  `Executive First Name 19` varchar(10) DEFAULT NULL,
  `Executive Last Name 19` varchar(10) DEFAULT NULL,
  `Executive Title 19` varchar(10) DEFAULT NULL,
  `Executive Gender 19` varchar(10) DEFAULT NULL,
  `Executive First Name 20` varchar(10) DEFAULT NULL,
  `Executive Last Name 20` varchar(10) DEFAULT NULL,
  `Executive Title 20` varchar(10) DEFAULT NULL,
  `Executive Gender 20` varchar(10) DEFAULT NULL,
  `Credit Cards Accepted` varchar(10) DEFAULT NULL,
  `Accounting Expenses` varchar(16) DEFAULT NULL,
  `Advertising Expense` varchar(18) DEFAULT NULL,
  `Computer Expenses` varchar(18) DEFAULT NULL,
  `Contract Labor Expenses` varchar(18) DEFAULT NULL,
  `Insurance Expenses` varchar(17) DEFAULT NULL,
  `Legal Expenses` varchar(18) DEFAULT NULL,
  `Management/Administration Expenses` varchar(18) DEFAULT NULL,
  `Office Supplies Expenses` varchar(17) DEFAULT NULL,
  `Package/Container Expenses` varchar(10) DEFAULT NULL,
  `Payroll and Benefits Expenses` varchar(22) DEFAULT NULL,
  `Purchase Print Expenses` varchar(16) DEFAULT NULL,
  `Rent Expenses` varchar(18) DEFAULT NULL,
  `Telcom Expenses` varchar(16) DEFAULT NULL,
  `Transportation Expenses` varchar(17) DEFAULT NULL,
  `Utilities Expense` varchar(18) DEFAULT NULL,
  `Lead Status` varchar(10) DEFAULT NULL,
  `Tags` varchar(10) DEFAULT NULL,
  `Affiliated Records` int(6) DEFAULT NULL,
  `Affiliated Locations` int(6) DEFAULT NULL,
  `Geo DNA` varchar(15) DEFAULT NULL,
  `NAICS` int(8) DEFAULT NULL,
  `spanish` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sg_data`
--
ALTER TABLE `sg_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Company Name` (`Company Name`);
ALTER TABLE `sg_data` ADD FULLTEXT KEY `Company Name_2` (`Company Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sg_data`
--
ALTER TABLE `sg_data`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
