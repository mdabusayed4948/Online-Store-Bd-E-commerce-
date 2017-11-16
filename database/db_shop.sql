-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2017 at 03:12 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPass` varchar(32) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPass`, `level`) VALUES
(1, 'Md Abu Sayed', 'admin', 'sayedme120@gmail.com', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(1, 'ACER'),
(2, 'SAMSUNG'),
(3, 'CANON'),
(4, 'IPHONE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(1, 'Desktop'),
(2, 'Mobile Phones'),
(3, 'Laptop'),
(4, 'Accessories'),
(5, 'Software'),
(6, 'Sports &amp; Fitness'),
(7, 'Footwear'),
(8, 'Jewellery'),
(9, 'Clothing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zip`, `phone`, `email`, `pass`) VALUES
(3, 'customer one', 'panthopath,Dhaka', 'Dhaka', 'Bangladesh', '1205', '01723054948', 'one@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(4, 'customer two', '152/2-M Green Road(Panthopath signal),Dhaka', 'Dhaka', 'Bangladesh', '1205', '1723054948', 'two@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(79, 3, 4, 'Lorem ipsum dolor sit amet, sed do eiusmod.', 1, 30000.00, 'upload/05f5083f62.png', '2017-11-15 23:14:37', 2),
(80, 3, 4, 'Lorem ipsum dolor sit amet, sed do eiusmod.', 1, 30000.00, 'upload/05f5083f62.png', '2017-11-16 17:55:16', 0),
(81, 3, 3, 'orem ipsum dolor sit amet, sed do eiusmod.', 1, 40000.00, 'upload/84e8a0c7ec.jpg', '2017-11-16 18:52:47', 0),
(82, 3, 23, 'Lorem Ipsum is simply', 1, 403.66, 'upload/9068cebc9e.jpg', '2017-11-16 19:51:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(1, 'Lorem Ipsum is simply', 2, 4, '&lt;p&gt;Lorem ipsum dolor sit amet sed do eiusmod.Lorem ipsum dolor sit amet sed do eiusmod.Lorem ipsum dolor sit amet sed do eiusmod.Lorem ipsum dolor sit amet sed do eiusmod.&lt;/p&gt;', 1000.00, 'upload/bf976f57b2.png', 0),
(2, 'Lorem Ipsum is simply', 4, 2, '&lt;p&gt;Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.&lt;/p&gt;', 10000.00, 'upload/eaa482bc72.png', 0),
(3, 'Lorem Ipsum is simply', 4, 1, '&lt;p&gt;orem ipsum dolor sit amet, sed do eiusmod.orem ipsum dolor sit amet, sed do eiusmod.orem ipsum dolor sit amet, sed do eiusmod.orem ipsum dolor sit amet, sed do eiusmod.orem ipsum dolor sit amet, sed do eiusmod.orem ipsum dolor sit amet, sed do eiusmod.&lt;/p&gt;', 40000.00, 'upload/84e8a0c7ec.jpg', 0),
(4, 'Lorem Ipsum is simply', 4, 3, '&lt;p&gt;Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.Lorem ipsum dolor sit amet, sed do eiusmod.&lt;/p&gt;', 30000.00, 'upload/05f5083f62.png', 0),
(22, 'Lorem Ipsum is simply', 4, 2, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elit&lt;/p&gt;', 4000.00, 'upload/a6c8f645da.png', 1),
(23, 'Lorem Ipsum is simply', 1, 1, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elit&lt;/p&gt;', 403.66, 'upload/9068cebc9e.jpg', 1),
(24, 'Lorem Ipsum is simply', 4, 3, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elit&lt;/p&gt;', 621.75, 'upload/d71792ee9f.jpg', 1),
(25, 'Lorem Ipsum is simply', 4, 2, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elitLorem ipsum dolor sit amet, consectetur adipisicing elit&lt;/p&gt;', 457.88, 'upload/898a27e8aa.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wlist`
--

CREATE TABLE `tbl_wlist` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wlist`
--

INSERT INTO `tbl_wlist` (`id`, `cmrId`, `productId`, `productName`, `price`, `image`) VALUES
(5, 0, 3, 'orem ipsum dolor sit amet, sed do eiusmod.', 40000.00, 'upload/84e8a0c7ec.jpg'),
(7, 3, 3, 'orem ipsum dolor sit amet, sed do eiusmod.', 40000.00, 'upload/84e8a0c7ec.jpg'),
(8, 3, 2, 'Lorem ipsum dolor sit amet, sed do eiusmod.', 10000.00, 'upload/eaa482bc72.png'),
(9, 3, 1, 'Lorem ipsum dolor sit amet sed do eiusmod.', 1000.00, 'upload/bf976f57b2.png'),
(10, 3, 25, 'Lorem Ipsum is simply', 457.88, 'upload/898a27e8aa.jpg'),
(11, 3, 23, 'Lorem Ipsum is simply', 403.66, 'upload/9068cebc9e.jpg'),
(12, 3, 24, 'Lorem Ipsum is simply', 621.75, 'upload/d71792ee9f.jpg'),
(13, 0, 23, 'Lorem Ipsum is simply', 403.66, 'upload/9068cebc9e.jpg'),
(14, 0, 24, 'Lorem Ipsum is simply', 621.75, 'upload/d71792ee9f.jpg'),
(15, 3, 22, 'Lorem Ipsum is simply', 4000.00, 'upload/a6c8f645da.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
