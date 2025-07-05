-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 05, 2025 at 12:21 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_board`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin@gmail.com|127.0.0.1', 'i:1;', 1751705974),
('admin@gmail.com|127.0.0.1:timer', 'i:1751705974;', 1751705974);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_05_112345_create_myjobs_table', 2),
(5, '2025_07_05_120327_create_personal_access_tokens_table', 3),
(6, '2025_07_05_170932_add_expiration_date_to_myjobs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `myjobs`
--

CREATE TABLE `myjobs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` enum('Full-time','Part-time','Contract') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `myjobs`
--

INSERT INTO `myjobs` (`id`, `title`, `company_name`, `location`, `job_type`, `description`, `apply_link`, `expiration_date`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Frontend Developer', 'TechCorp', 'Mumbai', 'Full-time', 'Work on frontend UIs.', 'https://apply.techcorp.com/frontend', '2025-08-01', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(2, 'Backend Developer', 'DevSolutions', 'Delhi', 'Part-time', 'Build backend APIs.', 'https://devsolutions.com/apply', '2025-07-20', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(3, 'UI/UX Designer', 'CreativeStudio', 'Bangalore', 'Contract', 'Design beautiful interfaces.', 'https://creativestudio.com/jobs', '2025-08-05', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(4, 'Laravel Developer', 'WebWizards', 'Chennai', 'Full-time', 'Develop Laravel-based applications.', 'https://webwizards.com/careers', '2025-08-10', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(5, 'React Developer', 'SoftWorks', 'Pune', 'Full-time', 'Develop ReactJS frontend.', 'https://softworks.io/apply', '2025-07-25', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(6, 'QA Tester', 'BugSquashers', 'Hyderabad', 'Part-time', 'Test and report bugs.', 'https://bugsquashers.com/tester', '2025-07-15', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(7, 'DevOps Engineer', 'DeployNow', 'Remote', 'Full-time', 'Manage CI/CD pipelines.', 'https://deploynow.dev/jobs', '2025-08-12', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(8, 'Android Developer', 'AppMakers', 'Ahmedabad', 'Full-time', 'Build Android apps.', 'https://appmakers.io/apply', '2025-08-18', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(9, 'iOS Developer', 'iBuild', 'Remote', 'Contract', 'Develop iOS applications.', 'https://ibuild.com/jobs', '2025-07-28', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(10, 'Python Developer', 'PyTech', 'Kolkata', 'Full-time', 'Write Python code for backend.', 'https://pytech.org/apply', '2025-08-20', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(11, 'Java Developer', 'CodeCraft', 'Indore', 'Full-time', 'Develop enterprise Java apps.', 'https://codecraft.com/apply', '2025-08-10', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(12, 'System Analyst', 'LogicSoft', 'Nagpur', 'Contract', 'Analyze system requirements.', 'https://logicsoft.jobs', '2025-08-05', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(13, 'Technical Writer', 'DocuTech', 'Mumbai', 'Part-time', 'Create technical documentation.', 'https://docutech.org/apply', '2025-07-18', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(14, 'Graphic Designer', 'DesignLine', 'Surat', 'Full-time', 'Create marketing designs.', 'https://designline.com/career', '2025-08-03', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(15, 'Cloud Architect', 'CloudWorks', 'Remote', 'Full-time', 'Design cloud infrastructure.', 'https://cloudworks.cloud/apply', '2025-08-25', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(16, 'Database Admin', 'DataSecure', 'Lucknow', 'Full-time', 'Manage SQL databases.', 'https://datasecure.jobs', '2025-08-08', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(17, 'Cybersecurity Expert', 'SecureNet', 'Jaipur', 'Full-time', 'Monitor threats & vulnerabilities.', 'https://securenet.com/apply', '2025-07-22', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(18, 'Data Analyst', 'InfoEdge', 'Noida', 'Contract', 'Analyze company data.', 'https://infoedge.io/jobs', '2025-07-29', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(19, 'Product Manager', 'VisionApps', 'Bhopal', 'Full-time', 'Lead product development.', 'https://visionapps.com/career', '2025-08-22', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(20, 'Tech Support', 'HelpDeskPro', 'Kochi', 'Part-time', 'Provide customer tech support.', 'https://helpdeskpro.org/apply', '2025-08-01', NULL, '2025-07-05 11:43:33', '2025-07-05 11:43:33'),
(21, 'Network Administrator', 'NetSecure', 'Delhi', 'Full-time', 'Manage and troubleshoot network systems.', 'https://netsecure.com/careers', '2025-08-12', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(22, 'Full Stack Developer', 'CodeNest', 'Bangalore', 'Contract', 'Build and maintain full stack apps.', 'https://codenest.dev/apply', '2025-08-14', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(23, 'Support Engineer', 'FastHelp', 'Mumbai', 'Part-time', 'Assist customers with technical issues.', 'https://fasthelp.com/jobs', '2025-08-03', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(24, 'Data Scientist', 'DataWave', 'Pune', 'Full-time', 'Analyze and visualize large datasets.', 'https://datawave.io/apply', '2025-08-30', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(25, 'Blockchain Developer', 'ChainCode', 'Remote', 'Full-time', 'Develop decentralized applications.', 'https://chaincode.tech/apply', '2025-08-10', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(26, 'Embedded Systems Engineer', 'ChipWorks', 'Chennai', 'Contract', 'Design and develop embedded systems.', 'https://chipworks.com/career', '2025-08-20', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(27, 'Machine Learning Engineer', 'MLPro', 'Hyderabad', 'Full-time', 'Implement ML algorithms and models.', 'https://mlpro.ai/jobs', '2025-08-22', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(28, 'Project Coordinator', 'TeamLead', 'Bangalore', 'Part-time', 'Coordinate between teams and clients.', 'https://teamlead.org/apply', '2025-08-05', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(29, 'SEO Analyst', 'WebRankers', 'Ahmedabad', 'Full-time', 'Optimize website SEO and rankings.', 'https://webrankers.com/careers', '2025-08-09', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(30, 'HR Manager', 'PeopleFirst', 'Delhi', 'Full-time', 'Recruit and manage employees.', 'https://peoplefirst.org/apply', '2025-08-07', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(31, 'Marketing Executive', 'BrandBoost', 'Kolkata', 'Full-time', 'Manage digital marketing campaigns.', 'https://brandboost.in/jobs', '2025-08-25', 'logos/Dw9IMJTi9W8ZiwUjWF8owfoXIKjFXkzkKBwxUHEf.png', '2025-07-05 11:44:58', '2025-07-05 11:52:39'),
(32, 'E-commerce Manager', 'ShopKart', 'Remote', 'Contract', 'Manage online product listings and sales.', 'https://shopkart.com/careers', '2025-08-19', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(33, 'Mobile App Tester', 'AppVerify', 'Surat', 'Part-time', 'Test Android and iOS mobile apps.', 'https://appverify.io/apply', '2025-08-06', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(34, 'Security Analyst', 'SafeNet', 'Chandigarh', 'Full-time', 'Monitor and analyze security breaches.', 'https://safenet.io/jobs', '2025-08-18', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(35, 'Tech Blogger', 'CodeBlog', 'Remote', 'Contract', 'Write technical blogs and tutorials.', 'https://codeblog.com/career', '2025-08-12', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(36, 'Backend API Engineer', 'FastAPI', 'Pune', 'Full-time', 'Develop scalable APIs.', 'https://fastapi.dev/apply', '2025-08-11', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(37, 'Angular Developer', 'FrontLoop', 'Hyderabad', 'Full-time', 'Develop frontend using Angular.', 'https://frontloop.com/jobs', '2025-08-16', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(38, 'WordPress Developer', 'WebSpark', 'Indore', 'Part-time', 'Build websites using WordPress.', 'https://webspark.org/apply', '2025-08-28', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(39, 'Game Developer', 'PlayWorld', 'Mumbai', 'Full-time', 'Develop 2D/3D mobile games.', 'https://playworld.games/careers', '2025-08-15', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(40, 'Customer Success Manager', 'Clientify', 'Bhopal', 'Full-time', 'Ensure client satisfaction.', 'https://clientify.io/jobs', '2025-08-29', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(41, 'AI Researcher', 'DeepAI', 'Remote', 'Full-time', 'Research AI innovations.', 'https://deepai.org/apply', '2025-09-01', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(42, 'Content Strategist', 'WordNerds', 'Kolkata', 'Contract', 'Plan and write content strategy.', 'https://wordnerds.com/career', '2025-08-30', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(43, 'Business Analyst', 'BizGenius', 'Chennai', 'Full-time', 'Analyze business processes.', 'https://bizgenius.biz/jobs', '2025-08-24', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(44, 'Social Media Manager', 'SocioBuzz', 'Delhi', 'Part-time', 'Manage social media accounts.', 'https://sociobuzz.io/apply', '2025-08-17', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(45, 'Cloud Support Engineer', 'SkyTech', 'Jaipur', 'Full-time', 'Support cloud infrastructure.', 'https://skytech.com/jobs', '2025-08-23', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(46, 'CRM Specialist', 'ClientGrid', 'Lucknow', 'Full-time', 'Maintain CRM system.', 'https://clientgrid.io/apply', '2025-08-27', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(47, 'Salesforce Developer', 'ForceOne', 'Gurgaon', 'Full-time', 'Build on Salesforce platform.', 'https://forceone.org/jobs', '2025-08-26', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(48, 'IT Support Executive', 'FixIT', 'Nagpur', 'Contract', 'Provide IT support.', 'https://fixit.com/apply', '2025-08-13', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(49, 'DevRel Advocate', 'CodeTalks', 'Remote', 'Full-time', 'Engage with developer community.', 'https://codetalks.dev/career', '2025-08-21', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58'),
(50, 'Video Editor', 'FrameX', 'Ahmedabad', 'Part-time', 'Edit videos for social platforms.', 'https://framex.in/apply', '2025-08-31', NULL, '2025-07-05 11:44:58', '2025-07-05 11:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IkgrR4ElhwK82KDmsHfvNfid9P83Wn8SkPy9JXwt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWTRkU1FGU2JoRjZtOVgwYkNhdkZJWVZFeVpPZkNZZUdOc1lQS0Z6YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/cGFnZT01Ijt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1751718022);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$T/Iut/9Mt.GIeakmfldtT.cdzRa1kvnkY504uu5DXak/NlQQQQxlq', NULL, '2025-07-05 05:49:16', '2025-07-05 05:49:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myjobs`
--
ALTER TABLE `myjobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `myjobs`
--
ALTER TABLE `myjobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
