-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2025 at 04:22 PM
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
-- Database: `web_assignment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_posted` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `admin_id`, `created_at`, `date_posted`) VALUES
(4, 'hey', 'there', 18, '2025-01-28 03:41:52', '2025-01-28 11:41:52'),
(5, 'hey', 'yea', 15, '2025-01-28 03:52:11', '2025-01-28 11:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_type` enum('student','supervisor') NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `feedback_type` enum('project','supervisor','system') NOT NULL,
  `feedback_text` text NOT NULL,
  `feedback_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marksheets`
--

CREATE TABLE `marksheets` (
  `id` int(6) UNSIGNED NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `supervisor_name` varchar(50) NOT NULL,
  `project_title` varchar(100) NOT NULL,
  `marks` int(3) NOT NULL,
  `feedback` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marksheets`
--

INSERT INTO `marksheets` (`id`, `student_name`, `supervisor_name`, `project_title`, `marks`, `feedback`, `submitted_at`) VALUES
(2, 'Sultan', 'Nisa', 'PRS', 99, 'Great work from the goat', '2025-01-23 19:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `agenda` text NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `title`, `date`, `time`, `agenda`, `supervisor_id`, `student_id`, `created_at`) VALUES
(1, 'Project Discussion', '2025-02-01', '14:00:00', 'Discuss project progress and next steps.', 16, 17, '2025-01-26 10:31:43'),
(9, 'azzam1234', '2025-01-31', '22:38:00', 'dasd', 16, 16, '2025-01-27 12:39:47'),
(10, 'azzam1234', '2025-01-31', '22:38:00', 'dasd', 16, 16, '2025-01-27 12:40:06'),
(12, 'azzam1234', '2025-01-31', '22:38:00', 'dasd', 16, 15, '2025-01-27 12:41:29'),
(13, 'azzam1234', '2025-01-31', '22:38:00', 'dasd', 15, 15, '2025-01-27 12:41:36'),
(16, 'a', '2025-01-31', '22:38:00', 'dasd', 15, 15, '2025-01-27 12:41:57'),
(17, 'wfwef', '2025-01-31', '12:48:00', 'test1', 15, 17, '2025-01-27 14:45:30'),
(18, 'log', '2025-01-31', '14:29:00', 'hello', 15, 17, '2025-01-27 15:27:06'),
(19, '12', '2025-01-31', '23:22:00', 'fewfwe', 18, 17, '2025-01-30 15:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_logs`
--

CREATE TABLE `meeting_logs` (
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `notes` text NOT NULL,
  `action_items` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meeting_logs`
--

INSERT INTO `meeting_logs` (`id`, `meeting_id`, `notes`, `action_items`, `created_at`) VALUES
(4, 1, 'cscsacs', 'dscdscds', '2025-01-27 15:50:41'),
(5, 18, 'cscsacs', 'dscdscds', '2025-01-27 15:50:54'),
(6, 18, '34r34', 'r34r34', '2025-01-30 15:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `presentation_slots`
--

CREATE TABLE `presentation_slots` (
  `id` int(6) UNSIGNED NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `project_title` varchar(100) NOT NULL,
  `slot_date` date NOT NULL,
  `slot_time` time NOT NULL,
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presentation_slots`
--

INSERT INTO `presentation_slots` (`id`, `student_name`, `project_title`, `slot_date`, `slot_time`, `booked_at`) VALUES
(1, 'Sultan', 'PRS', '2025-01-28', '12:30:00', '2025-01-23 18:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(6) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_by` varchar(50) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `file_name`, `file_path`, `uploaded_by`, `uploaded_at`) VALUES
(3, 'T2430_CCS6314_Assignment Guidelines.pdf', '../uploads/T2430_CCS6314_Assignment Guidelines.pdf', 'Sultan', '2025-01-23 18:11:05'),
(4, 'T2430_CCS6314_Assignment_Rubrics and Marksheet.pdf', '../uploads/T2430_CCS6314_Assignment_Rubrics and Marksheet.pdf', 'Sultan', '2025-01-23 18:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor_feedback`
--

CREATE TABLE `supervisor_feedback` (
  `id` int(11) NOT NULL,
  `supervisor_name` varchar(100) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `feedback_type` enum('performance','system') NOT NULL,
  `feedback_text` text NOT NULL,
  `feedback_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin','student','supervisor') NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `student_id`, `email`, `password`, `created_at`, `role`) VALUES
(7, 'azzam1234', '123456', 'azzam@gmail.com', '$2y$10$FIKcH2QZM.xTwbfqAZdPl.z.t6fNuYKUtMODQsQggnXhGOfNTVcJS', '2025-01-16 17:52:40', 'student'),
(15, 'Admin1', NULL, 'admin1@gmail.com', '$2y$10$zqFCqCy6PwceWEfstGQ/T.xqJaJMhuwGns559UlTCZj7SzOKnw5r6', '2025-01-18 19:49:53', 'admin'),
(16, 'supervisor', NULL, 'supervisor@gmail.com', '$2y$10$W/pcUC4O3HKNJdHW369iZ.cXRr296lU5L2396aBP.J5JugT/tjh6e', '2025-01-18 19:50:22', 'supervisor'),
(17, 'azzam', NULL, 'azzam_student@gmail.com', '$2y$10$AN2BAY5eEz69WkCoTrcV1eJFX.Sno7RSLJ/i3O1QZWte9YPeZEwXa', '2025-01-18 19:55:56', 'student'),
(18, 'sultan', '1111111', 'sultan@gmail.com', '$2y$10$KpMUnnNb.2TEBVWVmAPPRu8Y/ZuDwML6q7vtwCy5tiTyK5zkWkQda', '2025-01-18 20:29:34', 'student'),
(19, 'ahmed', '12345', 'ahmed@gmail.com', '$2y$10$o/Demmxk6Kj87YITXBb.7eclZnygkNtY9EIK2SYqWkrXug7T7vqxq', '2025-01-18 21:10:42', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marksheets`
--
ALTER TABLE `marksheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_id` (`supervisor_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_id` (`meeting_id`);

--
-- Indexes for table `presentation_slots`
--
ALTER TABLE `presentation_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supervisor_feedback`
--
ALTER TABLE `supervisor_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `marksheets`
--
ALTER TABLE `marksheets`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `presentation_slots`
--
ALTER TABLE `presentation_slots`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supervisor_feedback`
--
ALTER TABLE `supervisor_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  ADD CONSTRAINT `meeting_logs_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
