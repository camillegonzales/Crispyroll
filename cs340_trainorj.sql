-- Project Title: Crispyroll
-- Group Name: Query Queens
-- Group 50: Camille Gonzales, Jennifer Trainor

-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2023 at 11:24 AM
-- Server version: 10.6.15-MariaDB-log
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_trainorj`
--

-- --------------------------------------------------------

--
-- Table structure for table `Animes`
--

CREATE TABLE `Animes` (
  `anime_id` int(11) NOT NULL,
  `title` varchar(145) NOT NULL,
  `studio_id` int(11) NOT NULL,
  `num_episode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Animes`
--

INSERT INTO `Animes` (`anime_id`, `title`, `studio_id`, `num_episode`) VALUES
(1, 'Hunter x Hunter', 1, 148),
(2, 'Attack on Titan', 2, 88),
(3, 'Terror in Resonance', 2, 11),
(4, 'Jujutsu Kaisen', 2, 24),
(5, 'The Promised Neverland', 3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `Ratings`
--

CREATE TABLE `Ratings` (
  `rating_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(218) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Ratings`
--

INSERT INTO `Ratings` (`rating_id`, `anime_id`, `user_id`, `rating`, `review`) VALUES
(1, 1, 1, 5, 'My favorite anime of all time'),
(2, 2, 1, 5, 'One of the best animes out there, the plot is so thought out and the characters are all brilliantly written'),
(3, 3, 1, 5, 'Really sad but very well written and unique'),
(4, 4, 3, 5, 'Love everything about this anime. You get attached to every character and their backstory. The animation during the fighting scenes is also wild.'),
(5, 4, 2, 5, 'One of my favorites!!'),
(6, 5, 2, 4, 'Season 1 was amazing, but season 2 was really bad');

-- --------------------------------------------------------

--
-- Table structure for table `Studios`
--

CREATE TABLE `Studios` (
  `studio_id` int(11) NOT NULL,
  `studio_name` varchar(45) NOT NULL,
  `year_founded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Studios`
--

INSERT INTO `Studios` (`studio_id`, `studio_name`, `year_founded`) VALUES
(1, 'NipponTV', 1952),
(2, 'MAPPA', 2011),
(3, 'CloverWorks', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(145) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `user_name`, `user_email`) VALUES
(1, 'Honestliz', 'liz_re6@gmail.com'),
(2, 'Serexolik', 'mparker22@gmail.com'),
(3, 'Pebbles44', 'seanmorg@yahoo.com'),
(4, 'PeppermintP', 'pmin873@gmail.com'),
(5, 'wstr000', 'lilyt@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `Users_Animes`
--

CREATE TABLE `Users_Animes` (
  `user_anime_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Users_Animes`
--

INSERT INTO `Users_Animes` (`user_anime_id`, `user_id`, `anime_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 3, 4),
(7, 2, 4),
(8, 2, 5),
(9, 4, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Animes`
--
ALTER TABLE `Animes`
  ADD PRIMARY KEY (`anime_id`),
  ADD UNIQUE KEY `anime_id_UNIQUE` (`anime_id`),
  ADD KEY `fk_Animes_Studios1_idx` (`studio_id`);

--
-- Indexes for table `Ratings`
--
ALTER TABLE `Ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `rating_id_UNIQUE` (`rating_id`),
  ADD KEY `fk_Ratings_Animes1_idx` (`anime_id`),
  ADD KEY `fk_Ratings_Users` (`user_id`);

--
-- Indexes for table `Studios`
--
ALTER TABLE `Studios`
  ADD PRIMARY KEY (`studio_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`);

--
-- Indexes for table `Users_Animes`
--
ALTER TABLE `Users_Animes`
  ADD PRIMARY KEY (`user_anime_id`),
  ADD UNIQUE KEY `user_anime_id_UNIQUE` (`user_anime_id`),
  ADD KEY `fk_Animes_has_Users_Animes1_idx` (`anime_id`),
  ADD KEY `fk_Animes_has_Users_Users1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Animes`
--
ALTER TABLE `Animes`
  MODIFY `anime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Ratings`
--
ALTER TABLE `Ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Studios`
--
ALTER TABLE `Studios`
  MODIFY `studio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Users_Animes`
--
ALTER TABLE `Users_Animes`
  MODIFY `user_anime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Animes`
--
ALTER TABLE `Animes`
  ADD CONSTRAINT `fk_Animes_Studios1` FOREIGN KEY (`studio_id`) REFERENCES `Studios` (`studio_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `Ratings`
--
ALTER TABLE `Ratings`
  ADD CONSTRAINT `fk_Ratings_Animes1` FOREIGN KEY (`anime_id`) REFERENCES `Animes` (`anime_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ratings_Users` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `Users_Animes`
--
ALTER TABLE `Users_Animes`
  ADD CONSTRAINT `fk_Animes_has_Users_Animes1` FOREIGN KEY (`anime_id`) REFERENCES `Animes` (`anime_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Animes_has_Users_Users1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
