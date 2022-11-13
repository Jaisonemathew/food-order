-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 02:01 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(10, 'Jaison', 'Jaison', 'f3ed11bbdb94fd9ebdefbaf646ab94d3'),
(12, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(4, 'Pizza', 'Food_Category_790.jpg', 'No', 'Yes'),
(5, 'Burger', 'Food_Category_344.jpg', 'No', 'Yes'),
(9, 'Biriyani', 'Food_Category_385.jpg', 'No', 'Yes'),
(10, 'Chinese', 'Food_Category_697.jpg', 'Yes', 'Yes'),
(11, 'Arabic', 'Food_Category_447.jpg', 'Yes', 'Yes'),
(12, 'Indian', 'Food_Category_333.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(4, 'Best Burger', 'Burger with Ham and lots of Cheese,onion and sauce', '250.00', 'Food-Name-6340.jpg', 5, 'No', 'Yes'),
(5, 'Smoky BBQ Pizza', 'Best Firewood Pizza in Town made with thin cheese', '525.00', 'Food-Name-8298.jpg', 4, 'No', 'Yes'),
(10, 'Chicken Biriyani', 'Richly flavored aromatic rice layered with marinated chicken ', '120.00', 'Food-Name-6512.jpg', 9, 'Yes', 'Yes'),
(11, 'Hyderabadi Veg Biryani', 'Mixed vegetables inside layers of fluffy basmati rice', '110.00', 'Food-Name-306.jpg', 9, 'No', 'Yes'),
(12, 'Thalaserry Beef Biryani', 'Unlike other biryani dishes thalassery biryani is unique', '170.00', 'Food-Name-7044.jpg', 9, 'No', 'Yes'),
(13, 'Mutton Biriyani', 'Succulent pieces of mutton slow cooked on bed of aromatic rice', '300.00', 'Food-Name-114.jpg', 9, 'No', 'Yes'),
(14, 'Bbq Chicken Pizza', 'BBQ chicken on a pizza base with loads of cheese', '135.00', 'Food-Name-9607.jpg', 4, 'Yes', 'Yes'),
(15, 'Mediterranean Pizza', 'Pizza sauce, mozzarella, pesto and fresh mozzarella.', '325.00', 'Food-Name-1876.jpg', 4, 'No', 'Yes'),
(16, 'Classic Paneer Pizza', 'Multigrain base, yumm paneer tikka with thin crust', '308.00', 'Food-Name-5931.jpg', 4, 'No', 'Yes'),
(17, 'Pepper Al Faham', 'Al Faham is basically the Arabian barbecued chicken usually grilled', '230.00', 'Food-Name-4667.jpg', 11, 'Yes', 'Yes'),
(18, 'Schezwan Chicken Fried Rice', 'Wholesome stir-fried rice topped with juicy chicken chunks ', '225.00', 'Food-Name-5970.jpg', 10, 'Yes', 'Yes'),
(19, 'Butter Chicken', 'Perfectly cooked tendered pieces of chicken with a rich tomato and onion ', '255.00', 'Food-Name-5958.jpg', 12, 'Yes', 'Yes'),
(20, 'Chilly Chicken', 'Chicken marinated with herbs with batter and gravy made with Chinese sauces', '235.00', 'Food-Name-2105.jpg', 10, 'Yes', 'Yes'),
(21, ' Kanthari Al Faham', 'Kanthari alfaham chicken is one of the most spicy version of chicken Alfaham ', '245.00', 'Food-Name-7380.jpg', 11, 'No', 'Yes'),
(22, 'Desi Spice Khichdi Box', 'Special Chef-curated Khichdi bowls that will take you on Great Indian spice tour', '229.00', 'Food-Name-1329.jpg', 12, 'No', 'Yes'),
(23, 'Peri Peri Alfaham Mandhi', 'Spicy peri peri alfaham alongs with kuzhimandhi with salad mayonise', '240.00', 'Food-Name-9164.jpg', 11, 'No', 'Yes'),
(24, 'Kuzhi Mandhi', 'A flavor-packed combo with mandi chicken , mandi rice and dips ', '199.00', 'Food-Name-6628.jpg', 11, 'Yes', 'Yes'),
(25, 'Rumali Chicken Shawarma', 'Chicken shawarma wrap with romali rotti contanis chicken meat mayonise', '150.00', 'Food-Name-7422.jpg', 11, 'No', 'Yes'),
(26, 'Chicken Tikka Masala', 'Chicken tikka masala served as a portion goes best with rice,breads.\r\n\r\n', '280.00', 'Food-Name-3204.jpg', 12, 'No', 'Yes'),
(27, 'Kadai Paneer', 'Delicious Indian delicacy made of paneer, thick gravy of cream', '157.00', 'Food-Name-2376.jpg', 12, 'No', 'Yes'),
(28, 'Chicken Fried Rice', 'A deliciously hearty combo of wholesome chicken fried rice.', '215.00', 'Food-Name-9721.jpg', 12, 'No', 'Yes'),
(29, 'Chicken Noodles', 'Chicken noodles served for one person from hygeinic kitchen of 12 to 12.', '215.00', 'Food-Name-1771.jpg', 10, 'No', 'Yes'),
(30, 'Chilli Gobi', 'A deliciously aromatic dish with deep-fried cauliflower', '122.00', 'Food-Name-6250.jpg', 10, 'No', 'Yes'),
(31, 'McChicken Burger', 'Tender and juicy chicken patty cooked to perfection with mayonnaise', '131.00', 'Food-Name-7625.jpg', 5, 'No', 'Yes'),
(32, 'Tandoori Zinger Burger', 'Chicken zinger with a delicious tandoori sauce', '199.00', 'Food-Name-3025.jpg', 5, 'No', 'Yes'),
(33, 'Cheese Shawarma Burger', 'kahif special big chicken cheese made with a cheesy twist', '333.00', 'Food-Name-391.jpg', 5, 'No', 'Yes'),
(34, 'Kizhi Porotta ', '3 porotta is mixed with beef curry and served ', '199.00', 'Food-Name-4088.jpg', 12, 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `u_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `u_id`) VALUES
(13, 'Biriyani', '200.00', 1, '200.00', '2022-11-12 12:50:24', 'Delivered', 6),
(14, 'Best Burger', '250.00', 1, '250.00', '2022-11-12 12:56:39', 'Delivered', 6),
(15, 'Best Burger', '250.00', 1, '250.00', '2022-11-12 02:20:43', 'Delivered', 7),
(16, 'Smoky BBQ Pizza', '525.00', 1, '525.00', '2022-11-12 02:20:53', 'Delivered', 7),
(17, 'Thalaserry Beef Biryani', '170.00', 1, '170.00', '2022-11-13 07:44:42', 'Ordered', 6),
(18, 'Peri Peri Alfaham Mandhi', '240.00', 1, '240.00', '2022-11-13 01:54:44', 'Delivered', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_contact` int(20) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `customer_name`, `customer_email`, `customer_contact`, `customer_address`, `created_at`) VALUES
(6, 'jaison_e_mathew', '$2y$10$d//Ey6eukf3xhnFlHUhrwet/xaTQEmhmjyvEF.MTT1a5NgBbMbhke', 'Jaison E Mathew', 'jaisone.bca2023@saintgits.org', 2147483647, 'Enchakattil Chengannur', '2022-11-12 17:20:06'),
(7, 'febin_binoy', '$2y$10$3.3PY8VemjmGEiYcynAB7uoRrBeAok/Sw3rv2Zo1/.P0bNi66gNbe', 'Febin Binoy', 'febin.bca2023@saintgits.org', 2147483647, 'Febin Villa ,Chenganassery', '2022-11-12 18:48:54'),
(8, 'varghese', '$2y$10$eF5TxEyY1AS/xuJMurhvferx76E1fRe3ABxzBZQMZtJf4p3J32RRO', 'Varghese Babu', 'varghesebabu@gmail.com', 2147483647, 'Varghese Villa ,Chengannur', '2022-11-12 19:06:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
