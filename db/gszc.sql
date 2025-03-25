-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
<<<<<<< HEAD
-- Generation Time: Mar 23, 2025 at 03:05 PM
=======
-- Generation Time: Mar 24, 2025 at 08:01 PM
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gszc_events`
--
CREATE DATABASE IF NOT EXISTS `gszc_events` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gszc_events`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_sheets`
--

CREATE TABLE `attendance_sheets` (
  `attendance_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_workshop_id` int(11) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `name`, `date`, `location`, `status`) VALUES
<<<<<<< HEAD
(7, 'Erdély visszafoglalása', '2025-03-24', 'Erdély', 'ready');
=======
(6, 'Hygger', '2025-03-27', 'home', 'failed'),
(8, 'fsdfsdfsdf', '2025-03-19', 'fdsfsd', 'ready');
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710

-- --------------------------------------------------------

--
-- Table structure for table `event_workshop`
--

CREATE TABLE `event_workshop` (
  `event_workshop_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `max_workable_hours` int(11) NOT NULL DEFAULT 0,
  `number_of_mentors_required` int(11) NOT NULL DEFAULT 0,
  `number_of_teachers_required` int(11) NOT NULL DEFAULT 0,
  `busyness` enum('low','high') NOT NULL DEFAULT 'high'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

<<<<<<< HEAD
=======
--
-- Dumping data for table `event_workshop`
--

INSERT INTO `event_workshop` (`event_workshop_id`, `event_id`, `workshop_id`, `max_workable_hours`, `number_of_mentors_required`, `number_of_teachers_required`, `busyness`) VALUES
(10, 6, 6, 3, 3, 1, 'high'),
(14, 8, 4, 5, 3, 1, 'high'),
(15, 8, 5, 5, 3, 1, 'high'),
(16, 8, 6, 5, 3, 1, 'high');

>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710
-- --------------------------------------------------------

--
-- Table structure for table `mentor_workshop`
--

CREATE TABLE `mentor_workshop` (
  `mentor_workshop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `ranking_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` enum('student','teacher') NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `total_hours_worked` int(11) DEFAULT 0,
  `events_elapsed` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`user_id`, `name`, `email`, `type`, `teacher_id`, `school_id`, `total_hours_worked`, `events_elapsed`) VALUES
(13, 'Gizmó', 'gizmo@gmail.com', 'teacher', NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `participant_invitations`
--

CREATE TABLE `participant_invitations` (
  `invitation_id` int(11) NOT NULL,
  `event_workshop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ranking_number` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rankings`
--

CREATE TABLE `rankings` (
  `ranking_id` int(11) NOT NULL,
  `event_workshop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ranking_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `school_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`school_id`, `name`, `address`) VALUES
(1, 'Iskola-1', 'Iskola-1 címe');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `email` varchar(130) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `name`, `school_id`, `email`, `phone`) VALUES
(1, 'Kis Jenő', 1, 'kisjeno@gmail.com', '01234567');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(8, 'fsdfdsfs', '$2y$10$E.QzrEsvd4WZR1z4Y/oeMO4ksgWZsWqEf2kf/2dh9.NagKWlne6Em'),
(9, 'gizmo', '$2y$10$dJnCofk1XDxG8FkoWwa7xOj8sc9tp2Mq8/H5zpvsfHm3HXCfe/tJm'),
(10, 'fsdfsdfsdfsd', '$2y$10$d0cyuAmYmuNTTfbXImZ91utRUUi1l5uKRqpv7aZhZAlBWcKULkYBa'),
(11, 'fsdfsd', '$2y$10$Hl.OUQH/AEyiE/nnRLEAK.DdhrsnYBKO2k2ijJJtQl95W3chLoAUy'),
(13, 'gizmoszorosteste', '$2y$10$JzggukA.HjfSRjoPb9yyY.SXoRqlY8xCI4jpZmULRAz7sJUwpGjL.');

-- --------------------------------------------------------

--
-- Table structure for table `workshops`
--

CREATE TABLE `workshops` (
  `workshop_id` int(11) NOT NULL,
  `name` varchar(130) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workshops`
--

INSERT INTO `workshops` (`workshop_id`, `name`, `description`) VALUES
<<<<<<< HEAD
(10, 'Visszafoglalás békével', 'Iskolai foglalkozás'),
(11, 'Diplomáciai úton', 'Iskolai foglalkozás');
=======
(4, 'Kyra simogatás', 'Iskolai foglalkozás'),
(5, 'Chug simogatás', 'Iskolai foglalkozás'),
(6, 'Gizmo simogatás', 'Iskolai foglalkozás');
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710

-- --------------------------------------------------------

--
-- Table structure for table `workshop_ranking`
--

CREATE TABLE `workshop_ranking` (
  `workshop_ranking_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ranking_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `attendance_sheets`
--
ALTER TABLE `attendance_sheets`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_workshop_id` (`event_workshop_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event_workshop`
--
ALTER TABLE `event_workshop`
  ADD PRIMARY KEY (`event_workshop_id`),
  ADD KEY `fk_event_workshop_event` (`event_id`),
  ADD KEY `fk_event_workshop_workshop` (`workshop_id`);

--
-- Indexes for table `mentor_workshop`
--
ALTER TABLE `mentor_workshop`
  ADD PRIMARY KEY (`mentor_workshop_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `workshop_id` (`workshop_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `participant_invitations`
--
ALTER TABLE `participant_invitations`
  ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `event_workshop_id` (`event_workshop_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rankings`
--
ALTER TABLE `rankings`
  ADD PRIMARY KEY (`ranking_id`),
  ADD KEY `event_workshop_id` (`event_workshop_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
<<<<<<< HEAD
  ADD KEY `school_id` (`school_id`);
=======
  ADD KEY `fk_teacher_school` (`school_id`);
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `workshops`
--
ALTER TABLE `workshops`
  ADD PRIMARY KEY (`workshop_id`);

--
-- Indexes for table `workshop_ranking`
--
ALTER TABLE `workshop_ranking`
  ADD PRIMARY KEY (`workshop_ranking_id`),
  ADD KEY `workshop_id` (`workshop_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_sheets`
--
ALTER TABLE `attendance_sheets`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
<<<<<<< HEAD
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
=======
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710

--
-- AUTO_INCREMENT for table `event_workshop`
--
ALTER TABLE `event_workshop`
<<<<<<< HEAD
  MODIFY `event_workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
=======
  MODIFY `event_workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710

--
-- AUTO_INCREMENT for table `mentor_workshop`
--
ALTER TABLE `mentor_workshop`
  MODIFY `mentor_workshop_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant_invitations`
--
ALTER TABLE `participant_invitations`
  MODIFY `invitation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rankings`
--
ALTER TABLE `rankings`
  MODIFY `ranking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `workshops`
--
ALTER TABLE `workshops`
<<<<<<< HEAD
  MODIFY `workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
=======
  MODIFY `workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710

--
-- AUTO_INCREMENT for table `workshop_ranking`
--
ALTER TABLE `workshop_ranking`
  MODIFY `workshop_ranking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attendance_sheets`
--
ALTER TABLE `attendance_sheets`
  ADD CONSTRAINT `attendance_sheets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `participants` (`user_id`),
  ADD CONSTRAINT `attendance_sheets_ibfk_2` FOREIGN KEY (`event_workshop_id`) REFERENCES `event_workshop` (`event_workshop_id`);

--
-- Constraints for table `event_workshop`
--
ALTER TABLE `event_workshop`
  ADD CONSTRAINT `fk_event_workshop` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`workshop_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_event_workshop_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_event_workshop_workshop` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`workshop_id`) ON DELETE CASCADE;

--
-- Constraints for table `mentor_workshop`
--
ALTER TABLE `mentor_workshop`
  ADD CONSTRAINT `mentor_workshop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `participants` (`user_id`),
  ADD CONSTRAINT `mentor_workshop_ibfk_2` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`workshop_id`);

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`),
  ADD CONSTRAINT `participants_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `participant_invitations`
--
ALTER TABLE `participant_invitations`
  ADD CONSTRAINT `participant_invitations_ibfk_1` FOREIGN KEY (`event_workshop_id`) REFERENCES `event_workshop` (`event_workshop_id`),
  ADD CONSTRAINT `participant_invitations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `participants` (`user_id`);

--
-- Constraints for table `rankings`
--
ALTER TABLE `rankings`
  ADD CONSTRAINT `rankings_ibfk_1` FOREIGN KEY (`event_workshop_id`) REFERENCES `event_workshop` (`event_workshop_id`),
  ADD CONSTRAINT `rankings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `participants` (`user_id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
<<<<<<< HEAD
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON DELETE CASCADE;
=======
  ADD CONSTRAINT `fk_teacher_school` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON DELETE CASCADE;
>>>>>>> 8fccd0851cda706eb4f37428a97606482bedf710

--
-- Constraints for table `workshop_ranking`
--
ALTER TABLE `workshop_ranking`
  ADD CONSTRAINT `workshop_ranking_ibfk_1` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`workshop_id`),
  ADD CONSTRAINT `workshop_ranking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
