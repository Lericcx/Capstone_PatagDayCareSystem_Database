-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2026 at 04:47 AM
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
-- Database: `daycaremanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `log_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_status_id` int(11) NOT NULL,
  `attendance_method_id` int(11) NOT NULL,
  `check_in_time` datetime DEFAULT NULL,
  `check_out_time` datetime DEFAULT NULL,
  `remarks` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance_logs`
--

INSERT INTO `attendance_logs` (`log_id`, `student_id`, `attendance_date`, `attendance_status_id`, `attendance_method_id`, `check_in_time`, `check_out_time`, `remarks`) VALUES
(1, 1, '2026-06-08', 1, 1, '2026-06-08 07:45:00', '2026-06-08 11:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendance_methods`
--

CREATE TABLE `attendance_methods` (
  `attendance_method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_methods`
--

INSERT INTO `attendance_methods` (`attendance_method_id`, `method_name`) VALUES
(1, 'QR Scan'),
(2, 'Manual'),
(3, 'Biometric');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_statuses`
--

CREATE TABLE `attendance_statuses` (
  `attendance_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_statuses`
--

INSERT INTO `attendance_statuses` (`attendance_status_id`, `status_name`) VALUES
(1, 'Present'),
(2, 'Absent'),
(3, 'Late'),
(4, 'Excused');

-- --------------------------------------------------------

--
-- Table structure for table `child_feeding_logs`
--

CREATE TABLE `child_feeding_logs` (
  `feeding_log_id` int(11) NOT NULL,
  `meal_schedule_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `feeding_status_id` int(11) NOT NULL,
  `remarks` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `child_feeding_logs`
--

INSERT INTO `child_feeding_logs` (`feeding_log_id`, `meal_schedule_id`, `student_id`, `feeding_status_id`, `remarks`) VALUES
(1, 1, 1, 1, 'Finished entire bowl and drank water afterward.');

-- --------------------------------------------------------

--
-- Table structure for table `class_levels`
--

CREATE TABLE `class_levels` (
  `class_level_id` int(11) NOT NULL,
  `level_name` varchar(50) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `min_age` int(11) DEFAULT NULL,
  `max_age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class_levels`
--

INSERT INTO `class_levels` (`class_level_id`, `level_name`, `description`, `min_age`, `max_age`) VALUES
(1, 'Nursery', 'Early childhood introduction for toddlers', 3, 4),
(2, 'Kindergarten 1', 'Foundational learning for 4-year-olds', 4, 5),
(3, 'Kindergarten 2', 'Advanced preparatory learning before elementary', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `class_schedules`
--

CREATE TABLE `class_schedules` (
  `schedule_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `schedule_type_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class_schedules`
--

INSERT INTO `class_schedules` (`schedule_id`, `section_id`, `teacher_id`, `schedule_type_id`, `title`, `description`, `start_datetime`, `end_datetime`) VALUES
(1, 1, 1, 1, 'Morning Session - K1', 'Regular morning class session for nursery/kinder 1 children at Zone 12 Center.', '2026-06-08 08:00:00', '2026-06-08 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `section_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `class_level_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `section_name` varchar(100) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `room_assignment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`section_id`, `zone_id`, `class_level_id`, `teacher_id`, `section_name`, `school_year`, `room_assignment`) VALUES
(1, 1, 2, 1, 'Morning Session - Section A', '2026-2027', 'Room 101 - Main Center'),
(2, 1, 2, 1, 'Afternoon Session - Section B', '2026-2027', 'Room 101 - Main Center');

-- --------------------------------------------------------

--
-- Table structure for table `eligibility_status`
--

CREATE TABLE `eligibility_status` (
  `eligibility_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eligibility_status`
--

INSERT INTO `eligibility_status` (`eligibility_status_id`, `status_name`, `description`) VALUES
(1, 'Eligible', 'Child meets age and residency requirements for enrollment'),
(2, 'Under Review', 'Child eligibility criteria currently being evaluated'),
(3, 'Not Eligible', 'Child does not meet age brackets or criteria requirements');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `eligibility_status_id` int(11) DEFAULT NULL,
  `school_year` varchar(20) NOT NULL,
  `enrollment_date` date NOT NULL,
  `review_remarks` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `section_id`, `status_id`, `eligibility_status_id`, `school_year`, `enrollment_date`, `review_remarks`) VALUES
(1, 1, 1, 2, 1, '2026-2027', '2026-06-05', 'All credentials verified successfully.');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_requirement`
--

CREATE TABLE `enrollment_requirement` (
  `enrollment_requirement_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `requirement_type_id` int(11) NOT NULL,
  `requirement_status_id` int(11) NOT NULL,
  `storage_path` varchar(255) DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `remarks` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollment_requirement`
--

INSERT INTO `enrollment_requirement` (`enrollment_requirement_id`, `enrollment_id`, `requirement_type_id`, `requirement_status_id`, `storage_path`, `file_url`, `submitted_at`, `verified_at`, `remarks`) VALUES
(1, 1, 1, 1, 'documents/birth_cert_andrei.pdf', 'https://res.cloudinary.com/patag-daycare/raw/upload/v1/birth_cert_andrei.pdf', '2026-06-05 09:00:00', '2026-06-05 10:15:00', 'Officially verified PSA birth certificate.'),
(2, 1, 2, 2, 'documents/immunization_andrei.pdf', 'https://res.cloudinary.com/patag-daycare/raw/upload/v1/immunization_andrei.pdf', '2026-06-05 09:00:00', NULL, 'Temporary immunization record pending full clearance.');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_statuses`
--

CREATE TABLE `enrollment_statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollment_statuses`
--

INSERT INTO `enrollment_statuses` (`status_id`, `status_name`, `description`) VALUES
(1, 'Pending', 'Enrollment application submitted and pending review'),
(2, 'Approved', 'Enrollment requirements verified and student officially admitted'),
(3, 'Rejected', 'Enrollment denied due to invalid or incomplete documents'),
(4, 'Waitlisted', 'Student placed on waiting list pending available slot capacity');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_criteria`
--

CREATE TABLE `evaluation_criteria` (
  `criteria_id` int(11) NOT NULL,
  `criteria_name` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluation_criteria`
--

INSERT INTO `evaluation_criteria` (`criteria_id`, `criteria_name`, `description`) VALUES
(1, 'Cognitive Skills', 'Thinking, problem-solving, and memory retention'),
(2, 'Motor Skills', 'Fine and gross motor coordination development'),
(3, 'Social Behavior', 'Interaction, sharing, and behavior with peers and teachers'),
(4, 'Language Skills', 'Verbal communication and expression vocabulary'),
(5, 'Creativity', 'Imagination through arts, music, and play'),
(6, 'Independence', 'Self-reliance and personal hygiene habits');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_periods`
--

CREATE TABLE `evaluation_periods` (
  `evaluation_period_id` int(11) NOT NULL,
  `period_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluation_periods`
--

INSERT INTO `evaluation_periods` (`evaluation_period_id`, `period_name`) VALUES
(1, 'First Quarter'),
(2, 'Second Quarter'),
(3, 'Third Quarter'),
(4, 'Fourth Quarter');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_scores`
--

CREATE TABLE `evaluation_scores` (
  `evaluation_score_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `criteria_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `remarks` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `evaluation_scores`
--

INSERT INTO `evaluation_scores` (`evaluation_score_id`, `evaluation_id`, `criteria_id`, `score`, `remarks`) VALUES
(1, 1, 1, 4, 'Very good recognition of shapes and colors.'),
(2, 1, 2, 4, 'Able to hold pencils and scissors correctly.');

-- --------------------------------------------------------

--
-- Table structure for table `feeding_statuses`
--

CREATE TABLE `feeding_statuses` (
  `feeding_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feeding_statuses`
--

INSERT INTO `feeding_statuses` (`feeding_status_id`, `status_name`, `description`) VALUES
(1, 'Ate Well', 'Child consumed all or nearly all of the served meal portion'),
(2, 'Ate Some', 'Child consumed part of the meal portion'),
(3, 'Refused', 'Child declined or refused to eat the meal'),
(4, 'Allergic Reaction Alert', 'Child showed adverse sensitivity symptoms and feeding was stopped');

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `guardian_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guardians`
--

INSERT INTO `guardians` (`guardian_id`, `user_id`, `contact_number`, `address`, `zone_id`) VALUES
(1, 3, '09171234567', 'Door 3, Zone 12, Mayor P. N. Roa Street, Patag, Cagayan de Oro City', 1);

-- --------------------------------------------------------

--
-- Table structure for table `learning_materials`
--

CREATE TABLE `learning_materials` (
  `material_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `media_type` varchar(50) DEFAULT NULL,
  `storage_path` varchar(255) DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `learning_materials`
--

INSERT INTO `learning_materials` (`material_id`, `teacher_id`, `category_id`, `title`, `description`, `media_type`, `storage_path`, `file_url`) VALUES
(1, 1, 1, 'Patag Daycare ABC Phonics Video', 'Interactive alphabet learning video for young children.', 'Video', 'materials/abc_video.mp4', 'https://res.cloudinary.com/patag-daycare/video/upload/v1/abc_video.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_plans`
--

CREATE TABLE `lesson_plans` (
  `lesson_plan_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `subject_topic` varchar(200) DEFAULT NULL,
  `objective` mediumtext DEFAULT NULL,
  `activities_description` mediumtext DEFAULT NULL,
  `lesson_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_plans`
--

INSERT INTO `lesson_plans` (`lesson_plan_id`, `teacher_id`, `title`, `subject_topic`, `objective`, `activities_description`, `lesson_date`) VALUES
(1, 1, 'Introduction to Colors', 'Basic Colors', 'Identify and name primary colors correctly.', 'Color sorting game using colored blocks and drawing worksheets.', '2026-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `material_categories`
--

CREATE TABLE `material_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material_categories`
--

INSERT INTO `material_categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Reading', 'Alphabet books, short stories, and vocabulary guides'),
(2, 'Writing', 'Stroke tracing, handwriting, and coloring worksheets'),
(3, 'Arts & Crafts', 'Paper folding, drawing, and motor skill craft activities'),
(4, 'Music', 'Children nursery rhymes and rhythm practice videos'),
(5, 'Numbers', 'Basic counting, shapes, and mathematical logic blocks'),
(6, 'Science', 'Basic nature exploration and health awareness materials');

-- --------------------------------------------------------

--
-- Table structure for table `meal_schedules`
--

CREATE TABLE `meal_schedules` (
  `meal_schedule_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `meal_title` varchar(150) NOT NULL,
  `menu_description` mediumtext NOT NULL,
  `serving_date` date NOT NULL,
  `session_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_schedules`
--

INSERT INTO `meal_schedules` (`meal_schedule_id`, `teacher_id`, `meal_title`, `menu_description`, `serving_date`, `session_time`) VALUES
(1, 1, 'Nutritious Lugaw with Boiled Egg & Malunggay', 'Rice porridge infused with fresh malunggay leaves and protein-rich boiled egg bits.', '2026-06-08', 'Morning Snack');

-- --------------------------------------------------------

--
-- Table structure for table `performance_evaluations`
--

CREATE TABLE `performance_evaluations` (
  `evaluation_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `evaluation_period_id` int(11) NOT NULL,
  `remarks` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `performance_evaluations`
--

INSERT INTO `performance_evaluations` (`evaluation_id`, `student_id`, `teacher_id`, `evaluation_period_id`, `remarks`) VALUES
(1, 1, 1, 1, 'Andrei shows active participation in group activities and good listening skills.');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `instructions` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`quiz_id`, `teacher_id`, `title`, `instructions`) VALUES
(1, 1, 'Color Identification Quiz', 'Point to or tap the correct color requested on the screen.');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `result_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `max_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`result_id`, `quiz_id`, `student_id`, `score`, `max_score`) VALUES
(1, 1, 1, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `requirement_status`
--

CREATE TABLE `requirement_status` (
  `requirement_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `requirement_status`
--

INSERT INTO `requirement_status` (`requirement_status_id`, `status_name`) VALUES
(1, 'Officially Verified'),
(2, 'Temporary'),
(3, 'Missing'),
(4, 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `requirement_types`
--

CREATE TABLE `requirement_types` (
  `requirement_type_id` int(11) NOT NULL,
  `requirement_name` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requirement_types`
--

INSERT INTO `requirement_types` (`requirement_type_id`, `requirement_name`, `description`, `is_required`) VALUES
(1, 'Birth Certificate (PSA)', 'Official Philippine Statistics Authority birth certificate', 1),
(2, 'Immunization Record', 'Validated childhood vaccination card', 1),
(3, 'Barangay Clearance', 'Proof of residency within the barangay', 1),
(4, 'Parent Valid ID', 'Government-issued ID of parent or guardian', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Teacher'),
(3, 'Guardian');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_students`
--

CREATE TABLE `schedule_students` (
  `schedule_student_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_students`
--

INSERT INTO `schedule_students` (`schedule_student_id`, `schedule_id`, `student_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_types`
--

CREATE TABLE `schedule_types` (
  `schedule_type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_types`
--

INSERT INTO `schedule_types` (`schedule_type_id`, `type_name`) VALUES
(1, 'Regular Class'),
(2, 'Early Dismissal'),
(3, 'Special Event'),
(4, 'Holiday'),
(5, 'Parent-Teacher Meeting');

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

CREATE TABLE `sex` (
  `sex_id` int(11) NOT NULL,
  `sex_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`sex_id`, `sex_name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `sex_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `guardian_id`, `sex_id`, `first_name`, `middle_name`, `last_name`, `birth_date`) VALUES
(1, 1, 1, 'Andrei', 'Mercado', 'Cruz', '2021-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `student_qr_codes`
--

CREATE TABLE `student_qr_codes` (
  `qr_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `qr_token_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_qr_codes`
--

INSERT INTO `student_qr_codes` (`qr_id`, `student_id`, `qr_token_hash`, `is_active`) VALUES
(1, 1, '777e6cc71291feb3082f6b227c23b0a034d043bc89b1b28acc908c222b155bb0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `license_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `user_id`, `zone_id`, `license_number`) VALUES
(1, 2, 1, 'LPR-2021-0894562');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `first_name`, `middle_name`, `last_name`, `email`, `password_hash`) VALUES
(1, 1, 'Maria', 'Santos', 'Dela Cruz', 'patagdaycare.admin@cdo.gov.ph', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHe1HlCS4bZJ18JuywdB3g8b0lR0G1l0G'),
(2, 2, 'Ana', 'Ramos', 'Villanueva', 'teacher.ana@patagdaycare.edu', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHe1HlCS4bZJ18JuywdB3g8b0lR0G1l0G'),
(3, 3, 'Juan', 'Mercado', 'Cruz', 'juan.cruz@gmail.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHe1HlCS4bZJ18JuywdB3g8b0lR0G1l0G');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL,
  `zone_name` varchar(100) NOT NULL,
  `zone_code` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_name`, `zone_code`, `location`, `contact_number`) VALUES
(1, 'Zone 12 (Main / Central Location)', 'Z12-MAIN', 'Mayor P. N. Roa Street, Zone 12, Patag, Cagayan de Oro City (Adjacent to St. Joseph Chapel and the Philippine Army 4th I.D. Masjid, just off Zosima Gaboa Street)', NULL),
(2, 'Zone 1B (Mother of Divine Mercy Village Center)', 'Z1B-MDDV', 'Zone 1B, Patag, Cagayan de Oro City (Situated near the border area leading toward Opol)', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `uq_attendance_student_date` (`student_id`,`attendance_date`),
  ADD KEY `idx_attendance_logs_student` (`student_id`),
  ADD KEY `idx_attendance_logs_status` (`attendance_status_id`),
  ADD KEY `idx_attendance_logs_method` (`attendance_method_id`);

--
-- Indexes for table `attendance_methods`
--
ALTER TABLE `attendance_methods`
  ADD PRIMARY KEY (`attendance_method_id`);

--
-- Indexes for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  ADD PRIMARY KEY (`attendance_status_id`);

--
-- Indexes for table `child_feeding_logs`
--
ALTER TABLE `child_feeding_logs`
  ADD PRIMARY KEY (`feeding_log_id`),
  ADD UNIQUE KEY `uq_meal_student` (`meal_schedule_id`,`student_id`),
  ADD KEY `idx_child_feeding_meal` (`meal_schedule_id`),
  ADD KEY `idx_child_feeding_student` (`student_id`),
  ADD KEY `idx_child_feeding_status` (`feeding_status_id`);

--
-- Indexes for table `class_levels`
--
ALTER TABLE `class_levels`
  ADD PRIMARY KEY (`class_level_id`),
  ADD UNIQUE KEY `uq_class_levels_name` (`level_name`);

--
-- Indexes for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `idx_class_schedules_section` (`section_id`),
  ADD KEY `idx_class_schedules_teacher` (`teacher_id`),
  ADD KEY `idx_class_schedules_type` (`schedule_type_id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD UNIQUE KEY `uq_section_year_name` (`school_year`,`section_name`),
  ADD KEY `idx_class_sections_level` (`class_level_id`),
  ADD KEY `idx_class_sections_teacher` (`teacher_id`),
  ADD KEY `idx_class_sections_zone` (`zone_id`);

--
-- Indexes for table `eligibility_status`
--
ALTER TABLE `eligibility_status`
  ADD PRIMARY KEY (`eligibility_status_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD UNIQUE KEY `uq_enrollment_student_year` (`student_id`,`school_year`),
  ADD KEY `idx_enrollments_student` (`student_id`),
  ADD KEY `idx_enrollments_section` (`section_id`),
  ADD KEY `idx_enrollments_status` (`status_id`),
  ADD KEY `idx_enrollments_eligibility` (`eligibility_status_id`);

--
-- Indexes for table `enrollment_requirement`
--
ALTER TABLE `enrollment_requirement`
  ADD PRIMARY KEY (`enrollment_requirement_id`),
  ADD UNIQUE KEY `uq_enrollment_requirement_type` (`enrollment_id`,`requirement_type_id`),
  ADD KEY `idx_enrollment_req_enrollment` (`enrollment_id`),
  ADD KEY `idx_enrollment_req_type` (`requirement_type_id`),
  ADD KEY `idx_enrollment_req_status` (`requirement_status_id`);

--
-- Indexes for table `enrollment_statuses`
--
ALTER TABLE `enrollment_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `evaluation_criteria`
--
ALTER TABLE `evaluation_criteria`
  ADD PRIMARY KEY (`criteria_id`);

--
-- Indexes for table `evaluation_periods`
--
ALTER TABLE `evaluation_periods`
  ADD PRIMARY KEY (`evaluation_period_id`);

--
-- Indexes for table `evaluation_scores`
--
ALTER TABLE `evaluation_scores`
  ADD PRIMARY KEY (`evaluation_score_id`),
  ADD UNIQUE KEY `uq_evaluation_criteria` (`evaluation_id`,`criteria_id`),
  ADD KEY `idx_evaluation_scores_evaluation` (`evaluation_id`),
  ADD KEY `idx_evaluation_scores_criteria` (`criteria_id`);

--
-- Indexes for table `feeding_statuses`
--
ALTER TABLE `feeding_statuses`
  ADD PRIMARY KEY (`feeding_status_id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`guardian_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `idx_guardians_zone` (`zone_id`);

--
-- Indexes for table `learning_materials`
--
ALTER TABLE `learning_materials`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `idx_learning_materials_teacher` (`teacher_id`),
  ADD KEY `idx_learning_materials_category` (`category_id`);

--
-- Indexes for table `lesson_plans`
--
ALTER TABLE `lesson_plans`
  ADD PRIMARY KEY (`lesson_plan_id`),
  ADD KEY `idx_lesson_plans_teacher` (`teacher_id`);

--
-- Indexes for table `material_categories`
--
ALTER TABLE `material_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `meal_schedules`
--
ALTER TABLE `meal_schedules`
  ADD PRIMARY KEY (`meal_schedule_id`),
  ADD KEY `idx_meal_schedules_teacher` (`teacher_id`);

--
-- Indexes for table `performance_evaluations`
--
ALTER TABLE `performance_evaluations`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD KEY `idx_performance_evaluations_student` (`student_id`),
  ADD KEY `idx_performance_evaluations_teacher` (`teacher_id`),
  ADD KEY `idx_performance_evaluations_period` (`evaluation_period_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `idx_quizzes_teacher` (`teacher_id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`result_id`),
  ADD UNIQUE KEY `uq_quiz_student` (`quiz_id`,`student_id`),
  ADD KEY `idx_quiz_results_quiz` (`quiz_id`),
  ADD KEY `idx_quiz_results_student` (`student_id`);

--
-- Indexes for table `requirement_status`
--
ALTER TABLE `requirement_status`
  ADD PRIMARY KEY (`requirement_status_id`);

--
-- Indexes for table `requirement_types`
--
ALTER TABLE `requirement_types`
  ADD PRIMARY KEY (`requirement_type_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `schedule_students`
--
ALTER TABLE `schedule_students`
  ADD PRIMARY KEY (`schedule_student_id`),
  ADD UNIQUE KEY `uq_schedule_student` (`schedule_id`,`student_id`),
  ADD KEY `idx_schedule_students_schedule` (`schedule_id`),
  ADD KEY `idx_schedule_students_student` (`student_id`);

--
-- Indexes for table `schedule_types`
--
ALTER TABLE `schedule_types`
  ADD PRIMARY KEY (`schedule_type_id`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `idx_students_guardian` (`guardian_id`),
  ADD KEY `idx_students_sex` (`sex_id`);

--
-- Indexes for table `student_qr_codes`
--
ALTER TABLE `student_qr_codes`
  ADD PRIMARY KEY (`qr_id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `uq_qr_token_hash` (`qr_token_hash`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `license_number` (`license_number`),
  ADD KEY `idx_teachers_zone` (`zone_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_role` (`role_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance_methods`
--
ALTER TABLE `attendance_methods`
  MODIFY `attendance_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  MODIFY `attendance_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `child_feeding_logs`
--
ALTER TABLE `child_feeding_logs`
  MODIFY `feeding_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_levels`
--
ALTER TABLE `class_levels`
  MODIFY `class_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eligibility_status`
--
ALTER TABLE `eligibility_status`
  MODIFY `eligibility_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enrollment_requirement`
--
ALTER TABLE `enrollment_requirement`
  MODIFY `enrollment_requirement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollment_statuses`
--
ALTER TABLE `enrollment_statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `evaluation_criteria`
--
ALTER TABLE `evaluation_criteria`
  MODIFY `criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `evaluation_periods`
--
ALTER TABLE `evaluation_periods`
  MODIFY `evaluation_period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `evaluation_scores`
--
ALTER TABLE `evaluation_scores`
  MODIFY `evaluation_score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feeding_statuses`
--
ALTER TABLE `feeding_statuses`
  MODIFY `feeding_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `guardian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `learning_materials`
--
ALTER TABLE `learning_materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lesson_plans`
--
ALTER TABLE `lesson_plans`
  MODIFY `lesson_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `material_categories`
--
ALTER TABLE `material_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meal_schedules`
--
ALTER TABLE `meal_schedules`
  MODIFY `meal_schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `performance_evaluations`
--
ALTER TABLE `performance_evaluations`
  MODIFY `evaluation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requirement_status`
--
ALTER TABLE `requirement_status`
  MODIFY `requirement_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `requirement_types`
--
ALTER TABLE `requirement_types`
  MODIFY `requirement_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule_students`
--
ALTER TABLE `schedule_students`
  MODIFY `schedule_student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedule_types`
--
ALTER TABLE `schedule_types`
  MODIFY `schedule_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `sex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_qr_codes`
--
ALTER TABLE `student_qr_codes`
  MODIFY `qr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `attendance_logs_ibfk_2` FOREIGN KEY (`attendance_status_id`) REFERENCES `attendance_statuses` (`attendance_status_id`),
  ADD CONSTRAINT `attendance_logs_ibfk_3` FOREIGN KEY (`attendance_method_id`) REFERENCES `attendance_methods` (`attendance_method_id`);

--
-- Constraints for table `child_feeding_logs`
--
ALTER TABLE `child_feeding_logs`
  ADD CONSTRAINT `child_feeding_logs_ibfk_1` FOREIGN KEY (`meal_schedule_id`) REFERENCES `meal_schedules` (`meal_schedule_id`),
  ADD CONSTRAINT `child_feeding_logs_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `child_feeding_logs_ibfk_3` FOREIGN KEY (`feeding_status_id`) REFERENCES `feeding_statuses` (`feeding_status_id`);

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `class_schedules_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `class_sections` (`section_id`),
  ADD CONSTRAINT `class_schedules_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `class_schedules_ibfk_3` FOREIGN KEY (`schedule_type_id`) REFERENCES `schedule_types` (`schedule_type_id`);

--
-- Constraints for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD CONSTRAINT `class_sections_ibfk_1` FOREIGN KEY (`class_level_id`) REFERENCES `class_levels` (`class_level_id`),
  ADD CONSTRAINT `class_sections_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `fk_class_sections_zone` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`) ON DELETE SET NULL;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `class_sections` (`section_id`),
  ADD CONSTRAINT `enrollments_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `enrollment_statuses` (`status_id`),
  ADD CONSTRAINT `enrollments_ibfk_5` FOREIGN KEY (`eligibility_status_id`) REFERENCES `eligibility_status` (`eligibility_status_id`);

--
-- Constraints for table `enrollment_requirement`
--
ALTER TABLE `enrollment_requirement`
  ADD CONSTRAINT `enrollment_requirement_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`),
  ADD CONSTRAINT `enrollment_requirement_ibfk_2` FOREIGN KEY (`requirement_type_id`) REFERENCES `requirement_types` (`requirement_type_id`),
  ADD CONSTRAINT `enrollment_requirement_ibfk_3` FOREIGN KEY (`requirement_status_id`) REFERENCES `requirement_status` (`requirement_status_id`);

--
-- Constraints for table `evaluation_scores`
--
ALTER TABLE `evaluation_scores`
  ADD CONSTRAINT `evaluation_scores_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `performance_evaluations` (`evaluation_id`),
  ADD CONSTRAINT `evaluation_scores_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `evaluation_criteria` (`criteria_id`);

--
-- Constraints for table `guardians`
--
ALTER TABLE `guardians`
  ADD CONSTRAINT `guardians_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `guardians_ibfk_2` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`);

--
-- Constraints for table `learning_materials`
--
ALTER TABLE `learning_materials`
  ADD CONSTRAINT `learning_materials_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `learning_materials_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `material_categories` (`category_id`);

--
-- Constraints for table `lesson_plans`
--
ALTER TABLE `lesson_plans`
  ADD CONSTRAINT `lesson_plans_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `meal_schedules`
--
ALTER TABLE `meal_schedules`
  ADD CONSTRAINT `meal_schedules_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `performance_evaluations`
--
ALTER TABLE `performance_evaluations`
  ADD CONSTRAINT `performance_evaluations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `performance_evaluations_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `performance_evaluations_ibfk_3` FOREIGN KEY (`evaluation_period_id`) REFERENCES `evaluation_periods` (`evaluation_period_id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD CONSTRAINT `quiz_results_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
  ADD CONSTRAINT `quiz_results_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `schedule_students`
--
ALTER TABLE `schedule_students`
  ADD CONSTRAINT `schedule_students_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedules` (`schedule_id`),
  ADD CONSTRAINT `schedule_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`guardian_id`) REFERENCES `guardians` (`guardian_id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`sex_id`);

--
-- Constraints for table `student_qr_codes`
--
ALTER TABLE `student_qr_codes`
  ADD CONSTRAINT `student_qr_codes_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_teachers_zone` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
