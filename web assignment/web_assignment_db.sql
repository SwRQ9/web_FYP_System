-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2025 at 02:13 AM
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
(5, 'hey', 'yea', 15, '2025-01-28 03:52:11', '2025-01-28 11:52:11'),
(6, 'DFG', 'DFG', 1, '2025-02-02 18:14:05', '2025-02-03 02:14:05'),
(7, 'اترلارلا', 'رلرلرل', 1, '2025-02-02 18:17:56', '2025-02-03 02:17:56'),
(8, 'a', 'a', 1, '2025-02-02 18:29:35', '2025-02-03 02:29:35');

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

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_type`, `user_name`, `feedback_type`, `feedback_text`, `feedback_date`) VALUES
(22, 'student', 'John Doe', 'supervisor', 'sultan', '2025-02-02 16:20:17'),
(23, 'student', 'John Doe', 'project', 'wow', '2025-02-02 18:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `goal` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `student_id`, `goal`) VALUES
(1, 111, 'be more focused'),
(2, 1221305314, 'carry on'),
(3, 1, '1'),
(4, 1, '2'),
(5, 1, '3');

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
(2, 'Sultan', 'Nisa', 'PRS', 99, 'Great work from the goat', '2025-01-23 19:13:27'),
(3, 'sultan', 'sultan', 'none', 100, 'great', '2025-02-02 16:21:26');

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
(19, '12', '2025-01-31', '23:22:00', 'fewfwe', 18, 17, '2025-01-30 15:17:09'),
(20, 'WERT', '2025-02-27', '04:16:00', 'DFGH', 18, 17, '2025-02-02 18:14:43'),
(21, 'تعع', '2025-02-26', '14:18:00', 'بؤلبيقفؤغل', 18, 17, '2025-02-02 18:18:34'),
(22, 'شيشسيشي', '2025-02-07', '14:34:00', 'يسيشسيسي', 18, 17, '2025-02-02 18:20:21'),
(23, 'asap', '2025-02-28', '08:10:00', 'talk', 111, 222, '2025-02-03 00:06:21');

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
(6, 18, '34r34', 'r34r34', '2025-01-30 15:16:48'),
(7, 1, 'ERER', 'ERER', '2025-02-02 18:15:04'),
(8, 1, 'الاارغ', 'فرعلرع', '2025-02-02 18:18:57');

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
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `progress` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `progress`) VALUES
(22, 'Arun', 'Kumar', 0),
(23, 'James', 'Bond', 0),
(24, 'allow', 'pls', 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_assignments`
--

CREATE TABLE `project_assignments` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_assignments`
--

INSERT INTO `project_assignments` (`id`, `project_id`, `student_id`) VALUES
(1, 1, 111),
(2, 22, 111),
(3, 99, 1221305314);

-- --------------------------------------------------------

--
-- Table structure for table `project_proposals`
--

CREATE TABLE `project_proposals` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `project_title` varchar(255) DEFAULT NULL,
  `project_description` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_proposals`
--

INSERT INTO `project_proposals` (`id`, `student_id`, `project_title`, `project_description`, `status`) VALUES
(1, 123, 'Arun', 'Kumar', 'approved'),
(2, 1234, 'Please', 'Work', 'rejected'),
(3, 777, 'James', 'Bond', 'approved'),
(4, 333, 'allow', 'pls', 'approved'),
(5, 789, 'hey', 'you', NULL),
(6, 555, 'Aru ', 'Kum', 'approved'),
(7, 555, 'Aru ', 'Kum', NULL);

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
(4, 'T2430_CCS6314_Assignment_Rubrics and Marksheet.pdf', '../uploads/T2430_CCS6314_Assignment_Rubrics and Marksheet.pdf', 'Sultan', '2025-01-23 18:14:34'),
(5, 'web_assignment_db.sql', '../uploads/web_assignment_db.sql', 'sultan', '2025-02-02 16:28:35'),
(6, 'testc.sql', '../uploads/testc.sql', 'abdallah', '2025-02-02 18:28:28'),
(8, 'Assignment Specifications.pdf', '../uploads/Assignment Specifications.pdf', 'Arun', '2025-02-03 01:12:55');

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
  `role` enum('admin','student','supervisor') NOT NULL DEFAULT 'student',
  `security_question` varchar(255) NOT NULL,
  `security_answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `student_id`, `email`, `password`, `created_at`, `role`, `security_question`, `security_answer`) VALUES
(1, 'azzam', '123456789', 'azzam@gmail.com', '$2y$10$Wxhtc9AG/lMB/kbSWrr6k.AV6AdszidRytaNU0WbcMtkmVPzR9Aze', '2025-02-02 16:08:27', 'student', 'What is your favorite book?', '$2y$10$nvY0UTWqsNcMoubC5xHfr.YHE2vP6Vfo3a7fHLAYGBqR5xCZoaL9a'),
(2, 'admin ', NULL, 'admin@gmail.com', '$2y$10$DporbTrRgBF7LId.jE30HOw9M7xJudoFwSeg0yEU8UbHygU/i/3Bm', '2025-02-02 16:12:38', 'admin', 'What city were you born in?', '$2y$10$j5teNwyfd.W3TgSq34.SuO5gQxaK/ziH.byCkWWvR/92TBs8a4zV.'),
(3, 'supervisor', NULL, 'supervisor@gmail.com', '$2y$10$r.FPWZbnh2/wi7lxrDbu.udn8K1CgSSg31P6NP2M.KrSNWQtJO8uu', '2025-02-02 16:13:03', 'supervisor', 'What city were you born in?', '$2y$10$JjhfqRzBpfASWYziQr3bi.3o6xU.steS96AkmtPKACWB.WFA1MpHa'),
(4, 'Abdallah', '1211305298', '1211305298@student.mmu.edu.my', '$2y$10$tF/MzGA8WFULn7QoAqswJ.ud/weN5vNtY9tUO/t4jBtDfWc1h4.0i', '2025-02-02 18:27:17', 'student', 'What city were you born in?', '$2y$10$LLZRvRi20IuK4k6pjM6W4ehdOrD.VnL2Bt0MicCyHexq4enuWz9ky'),
(7, 'Arun Kumar Saravanan', '1221305314', 'arunkumarsaravanan19@gmail.com', '$2y$10$y1OmF2C5pkSQO8e13/e3he8Uz4QW1SnLoBtAgc/Dhyk9IVV2V8eTy', '2025-02-02 21:24:03', 'student', 'What city were you born in?', '$2y$10$IOcEStMi4MrmYgkmzMbfr.HNIIJUmg7K1EeZ8cB1V3gnE7pMlFiPa'),
(8, 'Arun', '111', 'arunkumarsaravanan17@gmail.com', '$2y$10$1d7jPuYJqSzekqy9UtBCl.ffRhCvGLx2INLACVTYSLByAaThAgHBK', '2025-02-02 21:25:58', 'student', 'What is your favorite book?', '$2y$10$AEfTtc5nvPfshezO0WqP4.DzuW.rnkcTDRC3ttX1e.vtAuaaxvUk2');

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
-- Indexes for table `goals`
--
ALTER TABLE `goals`
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
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_assignments`
--
ALTER TABLE `project_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_proposals`
--
ALTER TABLE `project_proposals`
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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marksheets`
--
ALTER TABLE `marksheets`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `presentation_slots`
--
ALTER TABLE `presentation_slots`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `project_assignments`
--
ALTER TABLE `project_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_proposals`
--
ALTER TABLE `project_proposals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `supervisor_feedback`
--
ALTER TABLE `supervisor_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
