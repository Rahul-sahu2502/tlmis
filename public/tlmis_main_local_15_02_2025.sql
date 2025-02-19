-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table tlmis_maindb.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.cache: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.cache_locks: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.jobs: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.job_batches: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.log_master_department
DROP TABLE IF EXISTS `log_master_department`;
CREATE TABLE IF NOT EXISTS `log_master_department` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `dept_id` int DEFAULT NULL,
  `department_hin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_eng` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  `log_create_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `dept_id` (`dept_id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_master_department: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.log_master_designation
DROP TABLE IF EXISTS `log_master_designation`;
CREATE TABLE IF NOT EXISTS `log_master_designation` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `designation_id` int NOT NULL,
  `designation` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `log_create_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `designation_id` (`designation_id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_master_designation: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.log_master_doc_types
DROP TABLE IF EXISTS `log_master_doc_types`;
CREATE TABLE IF NOT EXISTS `log_master_doc_types` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `name_hi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_master_doc_types: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.log_master_issuer_types
DROP TABLE IF EXISTS `log_master_issuer_types`;
CREATE TABLE IF NOT EXISTS `log_master_issuer_types` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `name_hi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_master_issuer_types: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.log_task_user_map_before_delete
DROP TABLE IF EXISTS `log_task_user_map_before_delete`;
CREATE TABLE IF NOT EXISTS `log_task_user_map_before_delete` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `fk_task_id` int DEFAULT NULL,
  `fk_dept_id` int DEFAULT NULL,
  `fk_user_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_creation` datetime DEFAULT (now()),
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `map_id` (`map_id`) USING BTREE,
  KEY `fk_dept_id` (`fk_dept_id`) USING BTREE,
  KEY `fk_user_id` (`fk_user_id`) USING BTREE,
  KEY `fk_task_d` (`fk_task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.log_task_user_map_before_delete: ~0 rows (approximately)
INSERT INTO `log_task_user_map_before_delete` (`log_id`, `map_id`, `fk_task_id`, `fk_dept_id`, `fk_user_id`, `created_by`, `created_at`, `created_ip`, `log_creation`) VALUES
	(1, 6, 3, 3, 7, 1, '2025-02-03 15:48:17', '127.0.0.1', '2025-02-04 13:34:08');

-- Dumping structure for table tlmis_maindb.log_tbl_login
DROP TABLE IF EXISTS `log_tbl_login`;
CREATE TABLE IF NOT EXISTS `log_tbl_login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `current_status` enum('IN','OUT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `logged_out_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `login_ipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logged_out_ipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.log_tbl_login: 52 rows
/*!40000 ALTER TABLE `log_tbl_login` DISABLE KEYS */;
INSERT INTO `log_tbl_login` (`id`, `fk_user_id`, `current_status`, `login_datetime`, `logged_out_datetime`, `login_ipaddress`, `logged_out_ipaddress`) VALUES
	(1, 1, 'OUT', '2025-01-27 17:27:40', '2025-01-27 17:32:25', '127.0.0.1', '127.0.0.1'),
	(2, 1, 'OUT', '2025-01-27 23:10:59', '2025-01-28 11:22:31', '127.0.0.1', '127.0.0.1'),
	(3, 1, 'OUT', '2025-01-28 11:22:22', '2025-01-28 11:22:31', '127.0.0.1', '127.0.0.1'),
	(4, 1, 'OUT', '2025-01-28 12:35:58', '2025-01-28 20:07:22', '127.0.0.1', '127.0.0.1'),
	(5, 1, 'OUT', '2025-01-28 20:12:45', '2025-01-29 12:58:29', '127.0.0.1', '127.0.0.1'),
	(6, 10, 'IN', '2025-01-29 09:02:19', NULL, '127.0.0.1', NULL),
	(7, 1, 'OUT', '2025-01-29 12:11:27', '2025-01-29 12:58:29', '127.0.0.1', '127.0.0.1'),
	(8, 7, 'OUT', '2025-01-29 12:22:46', '2025-02-05 12:49:00', '127.0.0.1', '127.0.0.1'),
	(9, 1, 'OUT', '2025-01-29 12:59:27', '2025-01-29 13:15:19', '127.0.0.1', '127.0.0.1'),
	(10, 7, 'OUT', '2025-01-29 13:15:51', '2025-02-05 12:49:00', '127.0.0.1', '127.0.0.1'),
	(11, 1, 'OUT', '2025-01-30 12:23:49', '2025-01-30 14:05:23', '127.0.0.1', '127.0.0.1'),
	(12, 5, 'OUT', '2025-01-30 12:55:06', '2025-01-30 12:55:32', '127.0.0.1', '127.0.0.1'),
	(13, 4, 'OUT', '2025-01-30 12:57:11', '2025-01-30 14:01:48', '127.0.0.1', '127.0.0.1'),
	(14, 4, 'OUT', '2025-01-30 13:28:39', '2025-01-30 14:01:48', '127.0.0.1', '127.0.0.1'),
	(15, 1, 'OUT', '2025-01-30 14:02:10', '2025-01-30 14:05:23', '127.0.0.1', '127.0.0.1'),
	(16, 4, 'OUT', '2025-01-30 14:05:38', '2025-01-30 14:09:46', '127.0.0.1', '127.0.0.1'),
	(17, 10, 'IN', '2025-01-30 14:10:14', NULL, '127.0.0.1', NULL),
	(18, 1, 'OUT', '2025-01-31 10:50:33', '2025-02-03 20:34:40', '127.0.0.1', '127.0.0.1'),
	(19, 1, 'OUT', '2025-01-31 13:51:36', '2025-02-03 20:34:40', '127.0.0.1', '127.0.0.1'),
	(20, 1, 'OUT', '2025-01-31 18:51:42', '2025-02-03 20:34:40', '127.0.0.1', '127.0.0.1'),
	(21, 1, 'OUT', '2025-02-03 15:43:51', '2025-02-03 20:34:40', '127.0.0.1', '127.0.0.1'),
	(22, 6, 'OUT', '2025-02-03 15:50:06', '2025-02-04 16:20:09', '127.0.0.1', '127.0.0.1'),
	(23, 1, 'OUT', '2025-02-03 20:32:40', '2025-02-03 20:34:40', '127.0.0.1', '127.0.0.1'),
	(24, 1, 'OUT', '2025-02-03 20:36:24', '2025-02-04 11:05:37', '127.0.0.1', '127.0.0.1'),
	(25, 1, 'OUT', '2025-02-04 11:04:39', '2025-02-04 11:05:37', '127.0.0.1', '127.0.0.1'),
	(26, 1, 'OUT', '2025-02-04 12:45:46', '2025-02-04 16:21:07', '127.0.0.1', '127.0.0.1'),
	(27, 6, 'OUT', '2025-02-04 14:19:57', '2025-02-04 16:20:09', '127.0.0.1', '127.0.0.1'),
	(28, 6, 'OUT', '2025-02-04 15:48:53', '2025-02-04 16:20:09', '127.0.0.1', '127.0.0.1'),
	(29, 6, 'OUT', '2025-02-04 16:20:43', '2025-02-05 12:47:36', '127.0.0.1', '127.0.0.1'),
	(30, 7, 'OUT', '2025-02-04 16:21:20', '2025-02-05 12:49:00', '127.0.0.1', '127.0.0.1'),
	(31, 1, 'OUT', '2025-02-04 22:46:21', '2025-02-05 17:37:43', '127.0.0.1', '127.0.0.1'),
	(32, 1, 'OUT', '2025-02-05 11:05:02', '2025-02-05 17:37:43', '127.0.0.1', '127.0.0.1'),
	(33, 6, 'OUT', '2025-02-05 12:37:01', '2025-02-05 12:47:36', '127.0.0.1', '127.0.0.1'),
	(34, 7, 'OUT', '2025-02-05 12:47:46', '2025-02-05 12:49:00', '127.0.0.1', '127.0.0.1'),
	(35, 6, 'OUT', '2025-02-05 12:49:21', '2025-02-05 12:51:08', '127.0.0.1', '127.0.0.1'),
	(36, 7, 'OUT', '2025-02-05 12:51:24', '2025-02-05 13:05:11', '127.0.0.1', '127.0.0.1'),
	(37, 6, 'OUT', '2025-02-05 13:05:27', '2025-02-05 13:30:19', '127.0.0.1', '127.0.0.1'),
	(38, 7, 'OUT', '2025-02-05 13:30:37', '2025-02-05 13:31:07', '127.0.0.1', '127.0.0.1'),
	(39, 6, 'OUT', '2025-02-05 13:31:22', '2025-02-05 14:35:33', '127.0.0.1', '127.0.0.1'),
	(40, 7, 'OUT', '2025-02-05 15:24:42', '2025-02-06 14:27:35', '127.0.0.1', '127.0.0.1'),
	(41, 1, 'OUT', '2025-02-05 17:48:13', '2025-02-07 17:19:39', '127.0.0.1', '127.0.0.1'),
	(42, 1, 'OUT', '2025-02-05 23:35:48', '2025-02-07 17:19:39', '127.0.0.1', '127.0.0.1'),
	(43, 1, 'OUT', '2025-02-06 10:58:09', '2025-02-07 17:19:39', '127.0.0.1', '127.0.0.1'),
	(44, 7, 'OUT', '2025-02-06 11:57:55', '2025-02-06 14:27:35', '127.0.0.1', '127.0.0.1'),
	(45, 6, 'OUT', '2025-02-06 14:28:03', '2025-02-06 14:28:32', '127.0.0.1', '127.0.0.1'),
	(46, 7, 'IN', '2025-02-06 14:28:47', NULL, '127.0.0.1', NULL),
	(47, 1, 'OUT', '2025-02-07 13:13:10', '2025-02-07 17:19:39', '127.0.0.1', '127.0.0.1'),
	(48, 1, 'OUT', '2025-02-07 16:55:06', '2025-02-07 17:19:39', '127.0.0.1', '127.0.0.1'),
	(49, 8, 'IN', '2025-02-07 17:14:43', NULL, '127.0.0.1', NULL),
	(50, 5, 'OUT', '2025-02-07 17:20:06', '2025-02-07 17:20:57', '127.0.0.1', '127.0.0.1'),
	(51, 1, 'IN', '2025-02-07 17:21:13', NULL, '127.0.0.1', NULL),
	(52, 5, 'IN', '2025-02-07 17:31:34', NULL, '127.0.0.1', NULL);
/*!40000 ALTER TABLE `log_tbl_login` ENABLE KEYS */;

-- Dumping structure for table tlmis_maindb.log_tbl_task
DROP TABLE IF EXISTS `log_tbl_task`;
CREATE TABLE IF NOT EXISTS `log_tbl_task` (
  `log_task_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_task_priority_id` int NOT NULL DEFAULT (0),
  `fk_task_category_id` int NOT NULL DEFAULT (0),
  `entry_date` date NOT NULL,
  `due_date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('P','C','I','O') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'I' COMMENT 'P=Pending, C=Completed, I= Inprogress, O=Reopened',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ref_docs` json DEFAULT NULL,
  `has_file` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_replied` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `log_created_date` datetime DEFAULT (now()),
  PRIMARY KEY (`log_task_id`),
  KEY `task_id` (`task_id`),
  KEY `fk_task_priority_id` (`fk_task_priority_id`),
  KEY `fk_task_category_id` (`fk_task_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_tbl_task: ~0 rows (approximately)
INSERT INTO `log_tbl_task` (`log_task_id`, `task_id`, `title`, `fk_task_priority_id`, `fk_task_category_id`, `entry_date`, `due_date`, `description`, `status`, `remark`, `ref_docs`, `has_file`, `created_by`, `created_date`, `created_ipaddress`, `updated_by`, `updated_date`, `updated_ipaddress`, `is_replied`, `log_created_date`) VALUES
	(1, 6, 'Test06/02', 1, 10, '2025-02-06', '2025-02-07', 'NA', 'I', NULL, NULL, 'N', 1, '2025-02-06 15:39:55', '127.0.0.1', NULL, NULL, NULL, 'N', '2025-02-10 14:25:35');

-- Dumping structure for table tlmis_maindb.log_tbl_task_files_before_delete
DROP TABLE IF EXISTS `log_tbl_task_files_before_delete`;
CREATE TABLE IF NOT EXISTS `log_tbl_task_files_before_delete` (
  `log_file_id` int NOT NULL AUTO_INCREMENT,
  `file_id` int DEFAULT NULL,
  `fk_task_id` int DEFAULT NULL,
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_create_datetime` datetime DEFAULT (now()),
  PRIMARY KEY (`log_file_id`) USING BTREE,
  KEY `file_id` (`file_id`),
  KEY `fk_task_id` (`fk_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_tbl_task_files_before_delete: ~14 rows (approximately)
INSERT INTO `log_tbl_task_files_before_delete` (`log_file_id`, `file_id`, `fk_task_id`, `file`, `file_name`, `file_size`, `log_create_datetime`) VALUES
	(1, 18, 8, 'task_files/demo_1738062141.pdf', 'demo.pdf', '95653', '2025-01-28 16:33:56'),
	(2, 19, 8, 'task_files/demo_1738062166.pdf', 'demo.pdf', '95653', '2025-01-28 16:33:56'),
	(3, 23, 8, 'task_files/demo_1738062582.pdf', 'demo.pdf', '95653', '2025-01-28 18:00:29'),
	(4, 22, 8, 'task_files/demo_1738062578.pdf', 'demo.pdf', '95653', '2025-01-28 18:01:13'),
	(5, 21, 8, 'task_files/demo_1738062574.pdf', 'demo.pdf', '95653', '2025-01-28 18:01:16'),
	(6, 20, 8, 'task_files/demo_1738062236.pdf', 'demo.pdf', '95653', '2025-01-28 18:01:18'),
	(7, 26, 9, 'task_files/demo_1738073108.pdf', 'demo.pdf', '95653', '2025-01-28 19:35:42'),
	(8, 27, 9, 'task_files/demo_1738073142.pdf', 'demo.pdf', '95653', '2025-01-28 19:35:56'),
	(9, 28, 9, 'task_files/demo_1738073329.pdf', 'demo.pdf', '95653', '2025-01-28 19:40:37'),
	(10, 29, 9, 'task_files/demo_1738073493.pdf', 'demo.pdf', '95653', '2025-01-28 19:42:07'),
	(11, 30, 9, 'task_files/demo_1738073533.pdf', 'demo.pdf', '95653', '2025-01-28 19:46:32'),
	(12, 31, 9, 'task_files/demo_1738073825.pdf', 'demo.pdf', '95653', '2025-01-28 19:47:28'),
	(13, 32, 9, 'task_files/demo_1738073943.pdf', 'demo.pdf', '95653', '2025-01-28 19:49:19'),
	(14, 35, 9, 'task_files/demo_1738073992.pdf', 'demo.pdf', '95653', '2025-01-28 19:50:02'),
	(15, 34, 9, 'task_files/demo_1738073987.pdf', 'demo.pdf', '95653', '2025-01-28 19:50:08'),
	(16, 33, 9, 'task_files/demo_1738073971.pdf', 'demo.pdf', '95653', '2025-01-28 19:50:15');

-- Dumping structure for table tlmis_maindb.log_tbl_users
DROP TABLE IF EXISTS `log_tbl_users`;
CREATE TABLE IF NOT EXISTS `log_tbl_users` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_lgd_code` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_password_changed` tinyint(1) NOT NULL DEFAULT '0',
  `fk_role_id` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_tbl_users: ~18 rows (approximately)
INSERT INTO `log_tbl_users` (`log_id`, `user_id`, `full_name`, `mobile`, `email`, `username`, `password`, `salt`, `district_lgd_code`, `is_active`, `preferences`, `remember_token`, `log_created_date`, `is_password_changed`, `fk_role_id`) VALUES
	(1, 2, 'Demo User', '', 'demo@info.com', 'demouser', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL, '2025-01-27 14:43:16', 1, 0),
	(2, 2, 'Demo User', '', 'demo@info.com', 'demouser', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL, '2025-01-27 14:43:18', 1, 0),
	(3, 2, 'Demo User', '', 'demo@info.com', 'demouser', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL, '2025-01-27 14:43:48', 1, 0),
	(4, 6, 'Test Level 3', '9876545678', NULL, '', 'e7907b4ec7e0934cf728533289ed2fd0c56e2f264bb26aa2eb87e8a82cc97e809941e2ee202312efbfb2ec37f5b12560b264cd4975ff551a7976eef8d508fa29', 'BN3J98n', NULL, 1, NULL, NULL, '2025-01-27 14:45:36', 0, 0),
	(5, 7, 'Test Level 4', '8765787654', NULL, '', '3f4f24c5cdd7026906fb0352409c6f987797760f199b9b7d3db5a937c17e7395fe9eb1d65a9da9ea4fe2cb893539e6c922ee78add5f6a1bbea810e428e2a128e', 'Fn1yIfJ', NULL, 1, NULL, NULL, '2025-01-27 14:46:01', 0, 0),
	(6, 6, 'Test Level 3', '9876545678', NULL, 'TL-00006', 'e7907b4ec7e0934cf728533289ed2fd0c56e2f264bb26aa2eb87e8a82cc97e809941e2ee202312efbfb2ec37f5b12560b264cd4975ff551a7976eef8d508fa29', 'BN3J98n', NULL, 1, NULL, NULL, '2025-01-27 14:47:30', 0, 0),
	(7, 7, 'Test Level 4', '8765787654', NULL, 'TL-00007', '3f4f24c5cdd7026906fb0352409c6f987797760f199b9b7d3db5a937c17e7395fe9eb1d65a9da9ea4fe2cb893539e6c922ee78add5f6a1bbea810e428e2a128e', 'Fn1yIfJ', NULL, 1, NULL, NULL, '2025-01-27 14:47:50', 0, 0),
	(8, 6, 'ABC L3', '9876545678', NULL, 'TL-00006', 'e7907b4ec7e0934cf728533289ed2fd0c56e2f264bb26aa2eb87e8a82cc97e809941e2ee202312efbfb2ec37f5b12560b264cd4975ff551a7976eef8d508fa29', 'BN3J98n', NULL, 1, NULL, NULL, '2025-01-27 15:06:56', 0, 0),
	(9, 7, 'XYZ L4', '8765787654', NULL, 'TL-00007', '3f4f24c5cdd7026906fb0352409c6f987797760f199b9b7d3db5a937c17e7395fe9eb1d65a9da9ea4fe2cb893539e6c922ee78add5f6a1bbea810e428e2a128e', 'Fn1yIfJ', NULL, 1, NULL, NULL, '2025-01-27 15:06:56', 0, 0),
	(10, 8, 'PQR L4', '6545678765', NULL, '', '17d563c7977f2b39502109b3274524cb6c5bb263f77ff53fa4d473adc642eec56158de293b5efb030163aa6bee7c5dcd784d468d25d17b1644a85812d5656a8d', 'P2qS6YV', NULL, 1, NULL, NULL, '2025-01-27 15:14:27', 0, 0),
	(11, 8, 'PQR L4', '6545678765', NULL, 'TLdistt_mmac-00008', '17d563c7977f2b39502109b3274524cb6c5bb263f77ff53fa4d473adc642eec56158de293b5efb030163aa6bee7c5dcd784d468d25d17b1644a85812d5656a8d', 'P2qS6YV', NULL, 1, NULL, NULL, '2025-01-27 15:14:59', 0, 0),
	(12, 8, 'PQR L4', '6545678765', NULL, 'TLMM-00008', '17d563c7977f2b39502109b3274524cb6c5bb263f77ff53fa4d473adc642eec56158de293b5efb030163aa6bee7c5dcd784d468d25d17b1644a85812d5656a8d', 'P2qS6YV', NULL, 1, NULL, NULL, '2025-01-27 15:16:29', 0, 0),
	(13, 8, 'PQR L4', '6545678765', NULL, 'TL=MM-00008', '17d563c7977f2b39502109b3274524cb6c5bb263f77ff53fa4d473adc642eec56158de293b5efb030163aa6bee7c5dcd784d468d25d17b1644a85812d5656a8d', 'P2qS6YV', NULL, 1, NULL, NULL, '2025-01-27 15:16:35', 0, 0),
	(14, 9, 'DCE L5', '9876546676', NULL, '', '1635450dd18c106d2cc810141280e3539d344d436c882ec6f40517a6f3c954da5ac0aa20f9e2f3569081bc8ff3a2d0d22f79582104bed88e6fc789d577c508e6', 'Jn0AomX', NULL, 1, NULL, NULL, '2025-01-27 15:17:57', 0, 0),
	(15, 1, 'IAS Tulika Prajapati', '9685287888', 'collector-mmac@cg.gov.in', 'distt_admin', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL, '2025-01-29 12:58:21', 1, 0),
	(16, 3, 'Test User', '7898962294', NULL, '7898962294', '3e215f371c826418ed07884f2e4b66a707f130de0a80b71ef247d90b1afc4286826bf1de4790c85fd305d1d03e1ce96db5575bd5bc9fcf75216ecde9bb8be311', 'U5O3BIW', NULL, 1, NULL, NULL, '2025-01-30 12:55:54', 0, 0),
	(17, 5, 'Test User', '9898765431', 'test@info.com', 'TL-00005', '5fd3c16b633b61b982617521f748a35821e574979e5c03301d41b43b51fc3c21482c71d56a53af502e5cdca2ce00276197420d0cb015018cdfbb94883ec69aa2', 'eMXAxgg', NULL, 1, NULL, NULL, '2025-01-30 12:55:56', 0, 0),
	(18, 8, 'PQR L4', '6545678765', NULL, 'TL-MM-00008', '17d563c7977f2b39502109b3274524cb6c5bb263f77ff53fa4d473adc642eec56158de293b5efb030163aa6bee7c5dcd784d468d25d17b1644a85812d5656a8d', 'P2qS6YV', NULL, 1, NULL, NULL, '2025-01-30 12:55:57', 0, 0),
	(19, 9, 'DCE L5', '9876546676', NULL, 'TL-MM-00009', '1635450dd18c106d2cc810141280e3539d344d436c882ec6f40517a6f3c954da5ac0aa20f9e2f3569081bc8ff3a2d0d22f79582104bed88e6fc789d577c508e6', 'Jn0AomX', NULL, 1, NULL, NULL, '2025-01-30 12:55:58', 0, 0),
	(20, 4, 'श्री चंद्रशेखर मिश्रा', '9424273201', NULL, '9424273201', '89f4025358397cc515f7d936131fad613dabcf23a24563ac9b57de795d0184034e8c550bd8312dd176a5027230f93d29ebce16c1ee741b66e3d6e9a0bb6bd79f', 'GF2fhB4', NULL, 1, NULL, NULL, '2025-01-30 12:56:51', 1, 0),
	(21, 4, 'श्री चंद्रशेखर मिश्रा', '9424273201', NULL, '9424273201', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'GF2fhB4', NULL, 1, NULL, NULL, '2025-01-30 12:56:55', 1, 0),
	(22, 11, 'L2User', '6545678976', NULL, '', 'bba62341c7f23739f7182213fe7e1d1e43b0727e85eb15a4cc3b2b4be977bc49eddab5d7678212c56d1e7f7aea8431b5722fc26fa49b30a6dd8861b9fefd6a44', '9ITr2RL', NULL, 1, NULL, NULL, '2025-02-06 12:20:03', 0, 0);

-- Dumping structure for table tlmis_maindb.log_tbl_user_map_before_delete
DROP TABLE IF EXISTS `log_tbl_user_map_before_delete`;
CREATE TABLE IF NOT EXISTS `log_tbl_user_map_before_delete` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_map_id` int DEFAULT NULL,
  `fk_user_id` int NOT NULL,
  `fk_level_id` int DEFAULT NULL,
  `fk_department_id` int DEFAULT NULL,
  `fk_designation_id` int NOT NULL,
  `remark` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `create_ipaddress` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_ipaddress` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_create_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `log_tbl_user_map_before_section_update_fk_department_id_index` (`fk_department_id`),
  KEY `log_tbl_user_map_before_section_update_fk_designation_id_index` (`fk_designation_id`),
  KEY `log_tbl_user_map_before_section_update_fk_level_id_index` (`fk_level_id`),
  KEY `log_tbl_user_map_before_section_update_fk_user_id_index` (`fk_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.log_tbl_user_map_before_delete: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.master_department
DROP TABLE IF EXISTS `master_department`;
CREATE TABLE IF NOT EXISTS `master_department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `department_hin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_eng` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_issuer_type` int DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  `created_by` int NOT NULL DEFAULT (0),
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_ip` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `tbl_departments_is_active_IDX` (`is_active`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_department: ~41 rows (approximately)
INSERT INTO `master_department` (`dept_id`, `department_hin`, `department_eng`, `fk_issuer_type`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(1, 'गृह विभाग', 'Home Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', NULL, NULL, NULL),
	(2, 'वित्त विभाग', 'Finance Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:12:25', NULL, '127.0.0.1'),
	(3, 'श्रम विभाग', 'Labour Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:08', NULL, NULL),
	(4, 'कृषि एवं किसान कल्याण विभाग', 'Agriculture Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:11', NULL, NULL),
	(5, 'स्वास्थ्य एवं परिवार कल्याण विभाग', 'Health and Family Welfare Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(6, 'उद्योग विभाग', 'Industry Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(7, 'नगरीय प्रशासन विभाग', 'Urban Administration and Development', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(8, 'लोक निर्माण विभाग', 'Public Welfare Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(9, 'उर्जा विभाग', 'Energy Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(10, 'स्कूल शिक्षा / सर्व शिक्षा अभियान', 'School Education Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(11, 'उच्च शिक्षा विभाग', 'Higher Education Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(12, 'तकनीकी शिक्षा विभाग', 'Technical Education Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(13, 'वन विभाग', 'Forest Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(14, 'पशुधन विकास विभाग', 'Animal Husbandry Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(15, 'खाद्य एवं नागरिक आपूर्ति निगम', 'Food,Civil Supplies & Consumer Protection Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(16, 'महिला एवं बाल विकास विभाग', 'Department of Women and Child Development', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(17, 'खनिज', 'Mining Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(18, 'राजस्व विभाग', 'Revenue Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(19, 'आदिम जाति कल्याण', 'Tribal Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(20, 'पंचायत एवं ग्रामीण विकास विभाग', 'Panchayat and Rural Development Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(21, 'इलेक्ट्रॉनिक्स एवं सूचना प्रौद्योगिकी', 'Department of Electronics and IT', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(22, 'समाज कल्याण विभाग', 'Social Welfare Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(23, 'परिवहन विभाग', 'Transport Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(24, 'लोक स्वास्थ्य यांत्रिकी विभाग', 'Public Health Engineering Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(25, 'खेल एवं युवा कल्याण विभाग', 'Sports and Youth Welfare Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(26, 'जनसंपर्क', 'Department of Public Relations', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(27, 'आवास एवं पर्यावरण विभाग', 'Housing and Environment Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(28, 'जल संसाधन विभाग', 'Water Resource Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(29, 'ग्रामोद्योग', 'Rural Industries', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(30, 'पर्यटन एवं संस्कृति विभाग', 'Tourism and Cultural Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(31, 'वाणिज्यिक कर', 'Commercial Tax Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(32, 'सामान्य प्रशासन विभाग', 'General Administration Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(33, 'जन शक्ति नियोजन (रोजगार) विभाग', 'Employment Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(34, 'सहकारिता विभाग', 'Cooperative Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(35, 'धार्मिक न्याय एवं धर्मस्व', 'Religious Trusts and Endowment', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(36, 'मछली पालन', 'Fisheries Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(37, 'छ. ग. राज्य निर्वाचन आयोग', 'CG State Election Commission', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(38, 'आपदा प्रबंधन', 'Disaster Management', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(39, 'आबकारी विभाग', 'Excise Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(40, 'विधि एवं विधायी कार्य', 'Law and Legislative Department', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(41, 'संसदीय कार्य', 'Parliamentary Affairs', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL);

-- Dumping structure for table tlmis_maindb.master_designation
DROP TABLE IF EXISTS `master_designation`;
CREATE TABLE IF NOT EXISTS `master_designation` (
  `designation_id` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`designation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_designation: ~15 rows (approximately)
INSERT INTO `master_designation` (`designation_id`, `designation`, `is_active`) VALUES
	(1, 'Deputy Director', 1),
	(2, 'सहायक संचालक', 1),
	(3, 'सहायक ग्रेड', 1),
	(4, 'State Programme Coordinator', 1),
	(5, 'Research & Training Specialist', 1),
	(6, 'Gender Specialist', 1),
	(7, 'Accounts Assistant', 1),
	(8, 'Office Assistant with computer knowledge', 1),
	(9, 'MTS', 1),
	(10, 'Supervisor', 1),
	(11, 'AG- III', 1),
	(12, 'AG- II', 1),
	(13, 'AG- I', 1),
	(14, 'Collector', 1),
	(15, 'Test Designation', 1);

-- Dumping structure for table tlmis_maindb.master_district
DROP TABLE IF EXISTS `master_district`;
CREATE TABLE IF NOT EXISTS `master_district` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `fk_sambhag_id` int NOT NULL,
  `district_lgd_code` int NOT NULL,
  `district_name_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_name_hin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  KEY `fk_sambhag_id` (`fk_sambhag_id`),
  KEY `district_lgd_code` (`district_lgd_code`),
  CONSTRAINT `master_district_ibfk_1` FOREIGN KEY (`fk_sambhag_id`) REFERENCES `master_sambhag` (`sambhag_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_district: ~33 rows (approximately)
INSERT INTO `master_district` (`district_id`, `fk_sambhag_id`, `district_lgd_code`, `district_name_eng`, `district_name_hin`) VALUES
	(1, 2, 646, 'BALOD', 'बालोद'),
	(2, 1, 644, 'BALODA BAZAR', 'बलोदा बाज़ार'),
	(3, 4, 649, 'BALRAMPUR', 'बलरामपुर'),
	(4, 5, 374, 'BASTAR', 'बस्तर'),
	(5, 2, 650, 'BEMETARA', 'बेमेतरा'),
	(6, 5, 636, 'BIJAPUR', 'बीजापुर'),
	(7, 3, 375, 'BILASPUR', 'बिलासपुर'),
	(8, 5, 376, 'DANTEWADA', 'दंतेवाड़ा'),
	(9, 1, 377, 'DHAMTARI', 'धमतरी'),
	(10, 2, 378, 'DURG', 'दुर्ग'),
	(11, 1, 645, 'GARIYABAND', 'गरियाबंद'),
	(12, 3, 734, 'Gaurella Pendra Marwahi', 'गौरेला पेंड्रा मरवाही'),
	(13, 3, 379, 'JANJGIR-CHAMPA', 'जांजगीर - चाम्पा'),
	(14, 4, 380, 'JASHPUR', 'जशपुर'),
	(15, 2, 382, 'KABIRDHAM', 'कबीरधाम'),
	(16, 5, 381, 'KANKER', 'कांकेर'),
	(17, 5, 643, 'KONDAGAON', 'कोंडागांव'),
	(18, 3, 383, 'KORBA', 'कोरबा'),
	(19, 4, 384, 'KOREA', 'कोरिया'),
	(20, 1, 385, 'MAHASAMUND', 'महासमुंद'),
	(21, 3, 647, 'MUNGELI', 'मुंगेली'),
	(22, 5, 637, 'NARAYANPUR', 'नारायणपुर'),
	(23, 3, 386, 'RAIGARH', 'रायगढ़'),
	(24, 1, 387, 'RAIPUR', 'रायपुर'),
	(25, 2, 388, 'RAJNANDGAON', 'राजनंदगांव'),
	(26, 5, 642, 'SUKMA', 'सुकमा'),
	(27, 4, 648, 'SURAJPUR', 'सूरजपुर'),
	(28, 4, 389, 'SURGUJA', 'सरगुजा'),
	(29, 2, 761, 'Mohla-Manpur-Ambagarh Chowki', 'मोहला-मानपुर-अंबागढ़ चौकी'),
	(30, 2, 759, 'Khairagarh-Chuikhadan-Gandai', 'खैरागढ़-छुईखदान-गंडई'),
	(31, 3, 763, 'Sarangarh-Bilaigarh', 'सारंगढ़-बिलाईगढ़'),
	(32, 3, 762, 'Sakti', 'सक्ती'),
	(33, 4, 760, 'Manedragarh-Chirmiri-Bharatpur', 'मनेंद्रगढ़-चिरमिरी-भरतपुर');

-- Dumping structure for table tlmis_maindb.master_doc_types
DROP TABLE IF EXISTS `master_doc_types`;
CREATE TABLE IF NOT EXISTS `master_doc_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_hi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_doc_types: ~13 rows (approximately)
INSERT INTO `master_doc_types` (`id`, `name_hi`, `name_en`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(2, 'आदेश', 'Orders', 1, 2, NULL, '2024-12-31 03:24:42', '2024-12-31 03:24:42', '127.0.0.1', NULL),
	(3, 'अधिसूचना', 'Notices', 1, 2, NULL, '2024-12-31 03:24:58', '2024-12-31 03:24:58', '127.0.0.1', NULL),
	(4, 'निविदा', 'Tenders', 1, 2, NULL, '2024-12-31 03:25:09', '2024-12-31 03:25:09', '127.0.0.1', NULL),
	(5, 'रिपोर्ट', 'Reports', 1, 2, NULL, '2024-12-31 03:25:27', '2024-12-31 03:25:27', '127.0.0.1', NULL),
	(8, 'अर्धशासकीय पत्र', 'DO Letter', 1, 2, 2, '2025-01-04 05:17:40', '2025-01-04 05:19:05', '127.0.0.1', '127.0.0.1'),
	(9, 'ज्ञापन', 'Memorandum', 1, 2, NULL, '2025-01-04 05:48:34', '2025-01-04 05:48:34', '127.0.0.1', NULL),
	(10, 'परिपत्र', 'Circular', 1, 2, NULL, '2025-01-04 11:20:06', NULL, '127.0.0.1', NULL),
	(11, 'पत्र', 'Letter', 1, 2, NULL, '2025-01-04 11:20:58', NULL, '127.0.0.1', NULL),
	(12, 'विधानसभा प्रश्न - तारांकित', 'Vidhansabha - Starred', 1, 2, NULL, '2025-01-04 12:40:05', NULL, '127.0.0.1', NULL),
	(13, 'विधानसभा प्रश्न - अतारांकित', 'Vidhansabha - Notstarred', 1, 2, NULL, '2025-01-04 12:40:05', NULL, '127.0.0.1', NULL),
	(14, 'विधानसभा प्रश्न - ध्यानाकर्षण', 'Vidhansabha - Attention', 1, 2, NULL, '2025-01-04 12:40:05', NULL, '127.0.0.1', NULL),
	(15, 'नोटशीट', 'Notesheet', 1, 1, NULL, '2025-01-14 14:01:10', '2025-01-14 14:01:10', '162.158.162.8', NULL),
	(16, 'ग्रीन नोटशीट', 'Green Notesheet', 1, 1, NULL, '2025-01-14 14:02:25', '2025-01-14 14:02:25', '172.69.165.45', NULL);

-- Dumping structure for table tlmis_maindb.master_issuers
DROP TABLE IF EXISTS `master_issuers`;
CREATE TABLE IF NOT EXISTS `master_issuers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuer_type_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_type_id` (`issuer_type_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_issuers: ~2 rows (approximately)
INSERT INTO `master_issuers` (`id`, `name`, `issuer_type_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(1, 'State Govt', 9, 1, 2, 0, '2025-01-12 01:47:27', '2025-01-12 01:47:27', '162.158.162.77', ''),
	(2, 'test1', 9, 1, 1, 0, '2025-01-20 17:12:50', '2025-01-20 17:12:50', '162.158.163.201', ''),
	(3, 'State', 8, 1, 1, 0, '2025-01-29 06:48:16', '2025-01-29 06:48:16', '127.0.0.1', '');

-- Dumping structure for table tlmis_maindb.master_issuer_types
DROP TABLE IF EXISTS `master_issuer_types`;
CREATE TABLE IF NOT EXISTS `master_issuer_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_hi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_issuer_types: ~3 rows (approximately)
INSERT INTO `master_issuer_types` (`id`, `name_hi`, `name_en`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(8, 'केंद्र शासन', 'Central Govt.', 1, 2, NULL, '2024-12-31 03:22:44', '2025-01-11 20:15:34', '127.0.0.1', NULL),
	(9, 'राज्य सरकार', 'State Govt.', 1, 2, NULL, '2024-12-31 03:23:02', '2025-01-11 20:13:46', '127.0.0.1', NULL),
	(10, 'जिला कार्यालय', 'District Office', 1, 2, NULL, '2024-12-31 03:23:45', '2025-01-11 20:13:53', '127.0.0.1', NULL);

-- Dumping structure for table tlmis_maindb.master_letter_prati
DROP TABLE IF EXISTS `master_letter_prati`;
CREATE TABLE IF NOT EXISTS `master_letter_prati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.master_letter_prati: 4 rows
/*!40000 ALTER TABLE `master_letter_prati` DISABLE KEYS */;
INSERT INTO `master_letter_prati` (`id`, `designation`, `details`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'कलेक्टर', '<p>कलेक्टर<br>जिला</p>', 'Y', '2024-06-02 23:12:42', '2024-06-02 23:41:47'),
	(2, 'जिला कार्यकारी अधिकारी', '<p>जिला कार्यकारी अधिकारी<br>जिला महिला एवं बाल विकास अधिकारी<br>महिला एवं बाल विकास विभाग<br>जिला छ.ग.</p>', 'Y', '2024-06-02 23:15:54', '2024-06-02 23:41:55'),
	(3, 'परियोजना अधिकारी', '<p>परियोजना अधिकारी<br>एकीकृत बाल विकास परियोजना<br>जिला छ.ग.</p>', 'Y', '2024-06-02 23:18:09', '2024-06-02 23:42:02'),
	(4, 'सचिव', '<p>सचिव<br>छत्तीसगढ़ शासन<br>महिला एवं बाल विकास विभाग<br>संचालनालय महानदी भवन<br>अटल नगर छ.ग.</p>', 'Y', '2024-06-02 23:21:03', '2024-06-02 23:42:09');
/*!40000 ALTER TABLE `master_letter_prati` ENABLE KEYS */;

-- Dumping structure for table tlmis_maindb.master_level
DROP TABLE IF EXISTS `master_level`;
CREATE TABLE IF NOT EXISTS `master_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_level: ~5 rows (approximately)
INSERT INTO `master_level` (`level_id`, `level`, `remark`, `is_active`) VALUES
	(1, 'Level 1', NULL, 1),
	(2, 'Level 2', NULL, 1),
	(3, 'Level 3', NULL, 1),
	(4, 'Level 4', NULL, 1),
	(5, 'Level 5', NULL, 1);

-- Dumping structure for table tlmis_maindb.master_role
DROP TABLE IF EXISTS `master_role`;
CREATE TABLE IF NOT EXISTS `master_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.master_role: ~3 rows (approximately)
INSERT INTO `master_role` (`role_id`, `role`, `remark`, `is_active`) VALUES
	(1, 'Super Admin', NULL, 1),
	(2, 'Admin', NULL, 1),
	(3, 'Operator', NULL, 1);

-- Dumping structure for table tlmis_maindb.master_sambhag
DROP TABLE IF EXISTS `master_sambhag`;
CREATE TABLE IF NOT EXISTS `master_sambhag` (
  `sambhag_id` int NOT NULL AUTO_INCREMENT,
  `sambhag_name_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sambhag_name_hin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sambhag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_sambhag: ~5 rows (approximately)
INSERT INTO `master_sambhag` (`sambhag_id`, `sambhag_name_eng`, `sambhag_name_hin`) VALUES
	(1, 'Raipur', 'रायपुर'),
	(2, 'Durg', 'दुर्ग'),
	(3, 'Bilaspur', 'बिलासपुर'),
	(4, 'Sarguja', 'सरगुजा'),
	(5, 'Bastar', 'बस्तर');

-- Dumping structure for table tlmis_maindb.master_signatory
DROP TABLE IF EXISTS `master_signatory`;
CREATE TABLE IF NOT EXISTS `master_signatory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signatory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.master_signatory: 4 rows
/*!40000 ALTER TABLE `master_signatory` DISABLE KEYS */;
INSERT INTO `master_signatory` (`id`, `signatory`) VALUES
	(1, 'संचालक'),
	(2, 'संयुक्त संचालक'),
	(3, 'उप संचालक'),
	(4, 'सचिव');
/*!40000 ALTER TABLE `master_signatory` ENABLE KEYS */;

-- Dumping structure for table tlmis_maindb.master_signatory_officer
DROP TABLE IF EXISTS `master_signatory_officer`;
CREATE TABLE IF NOT EXISTS `master_signatory_officer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signatory_id` int DEFAULT NULL,
  `officer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.master_signatory_officer: 5 rows
/*!40000 ALTER TABLE `master_signatory_officer` DISABLE KEYS */;
INSERT INTO `master_signatory_officer` (`id`, `signatory_id`, `officer_name`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
	(1, 1, 'तुलिका प्रजापति', 'N', '2024-11-25 17:13:36', NULL, '2025-01-27 15:23:02', 2),
	(2, 2, 'सी. एस. लाल', 'Y', '2024-11-25 17:13:36', NULL, '2024-11-26 06:36:32', 1),
	(3, 3, 'अभय देवांगन', 'Y', '2024-11-25 17:13:36', NULL, '2024-11-25 17:13:36', NULL),
	(4, 4, 'शम्मी आबिदी', 'Y', '2024-11-25 17:13:36', NULL, '2024-11-25 17:13:36', NULL),
	(5, 1, 'जनमेजय महोबे', 'Y', '2024-11-25 11:45:27', 1, '2024-11-25 17:15:27', NULL);
/*!40000 ALTER TABLE `master_signatory_officer` ENABLE KEYS */;

-- Dumping structure for table tlmis_maindb.master_task_category
DROP TABLE IF EXISTS `master_task_category`;
CREATE TABLE IF NOT EXISTS `master_task_category` (
  `task_category_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL DEFAULT '0',
  `updated_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_category_id`),
  KEY `is_active` (`is_active`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.master_task_category: ~10 rows (approximately)
INSERT INTO `master_task_category` (`task_category_id`, `category`, `remark`, `is_active`, `created_by`, `created_ipaddress`, `created_datetime`, `updated_by`, `updated_ipaddress`, `updated_datetime`) VALUES
	(1, 'सामान्य पत्र', NULL, 1, NULL, NULL, '2024-12-16 16:46:39', 0, NULL, '2025-01-04 14:44:00'),
	(2, 'शिकायत', NULL, 1, NULL, NULL, '2024-12-16 16:46:49', 0, NULL, '2025-01-04 14:44:06'),
	(3, 'भारत सरकार से आया हुआ पत्र', NULL, 1, NULL, NULL, '2024-12-16 16:47:06', 0, NULL, '2025-01-04 14:44:07'),
	(4, 'मुख्यमंत्री सचिवालय से आया हुआ पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:44:33', 0, NULL, NULL),
	(5, 'मुख्यमंत्री सचिवालय से आया हुआ पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL),
	(6, 'माननीय मंत्री से आया हुआ पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL),
	(7, 'माननीय सांसद से आया पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, '2025-01-14 06:46:57'),
	(8, 'माननीय विधायक से आया पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, '2025-01-14 06:47:01'),
	(9, 'महत्वपूर्ण पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, '2025-01-14 06:47:20'),
	(10, 'अन्य', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, '2025-01-14 06:47:11');

-- Dumping structure for table tlmis_maindb.master_task_priority
DROP TABLE IF EXISTS `master_task_priority`;
CREATE TABLE IF NOT EXISTS `master_task_priority` (
  `task_priority_id` int NOT NULL AUTO_INCREMENT,
  `priority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL DEFAULT '0',
  `updated_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_priority_id`) USING BTREE,
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table tlmis_maindb.master_task_priority: ~2 rows (approximately)
INSERT INTO `master_task_priority` (`task_priority_id`, `priority`, `remark`, `is_active`, `created_by`, `created_ipaddress`, `created_datetime`, `updated_by`, `updated_ipaddress`, `updated_datetime`) VALUES
	(1, 'Normal', NULL, 1, NULL, NULL, '2024-12-16 16:52:40', 0, NULL, NULL),
	(2, 'High', NULL, 1, NULL, NULL, '2024-12-16 16:52:49', 0, NULL, NULL);

-- Dumping structure for table tlmis_maindb.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.migrations: ~3 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1);

-- Dumping structure for table tlmis_maindb.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.sessions: ~3 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('dcn3wvxAWZZvzCkE4qpJnPzqAOMb77dwX63ZP5T0', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YToxNzp7czo2OiJfdG9rZW4iO3M6NDA6ImNnb3hMeHhiV3BTMjZnYW9ralR4Mm11cVN4NFNiS28zcGZpb0Z5UFQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXNlci1oaWVyYXJjaHkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjc6ImNhcHRjaGEiO3M6NDoiTlFCSyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTtzOjc6InVzZXJfaWQiO2k6NTtzOjg6InVzZXJuYW1lIjtzOjg6IlRMLTAwMDA1IjtzOjg6ImZ1bGxuYW1lIjtzOjk6IlRlc3QgVXNlciI7czo5OiJpc19hY3RpdmUiO2k6MTtzOjg6ImxldmVsX2lkIjtpOjI7czo1OiJsZXZlbCI7czo3OiJMZXZlbCAyIjtzOjE0OiJkZXNpZ25hdGlvbl9pZCI7aTo4O3M6MTE6ImRlc2lnbmF0aW9uIjtzOjQwOiJPZmZpY2UgQXNzaXN0YW50IHdpdGggY29tcHV0ZXIga25vd2xlZGdlIjtzOjEzOiJkZXBhcnRtZW50X2lkIjtpOjE2O3M6OToiY3JlYXRlX2J5IjtpOjE7czoxOToiaXNfcGFzc3dvcmRfY2hhbmdlZCI7aToxO3M6Nzoicm9sZV9pZCI7aTowO30=', 1738930202),
	('ObbyI1hlf37xOhy8rqGcEtGmaL91NMz3jK8KdC4A', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YToxNzp7czo2OiJfdG9rZW4iO3M6NDA6ImdoV0FRakZzT0xvV2hCZ0dCN05sd3NiMFczaHl4RW5jZklCNEVHdWsiO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NzoiY2FwdGNoYSI7czo0OiJOV0tGIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1MjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Rhc2stb3ZlcnZpZXc/dj0wJnZhcj1OZyUzRCUzRCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7czo3OiJ1c2VyX2lkIjtpOjg7czo4OiJ1c2VybmFtZSI7czoxMToiVEwtTU0tMDAwMDgiO3M6ODoiZnVsbG5hbWUiO3M6NjoiUFFSIEw0IjtzOjk6ImlzX2FjdGl2ZSI7aToxO3M6ODoibGV2ZWxfaWQiO2k6NDtzOjU6ImxldmVsIjtzOjc6IkxldmVsIDQiO3M6MTQ6ImRlc2lnbmF0aW9uX2lkIjtpOjE1O3M6MTE6ImRlc2lnbmF0aW9uIjtzOjE2OiJUZXN0IERlc2lnbmF0aW9uIjtzOjEzOiJkZXBhcnRtZW50X2lkIjtpOjQ7czo5OiJjcmVhdGVfYnkiO2k6MTtzOjE5OiJpc19wYXNzd29yZF9jaGFuZ2VkIjtpOjE7czo3OiJyb2xlX2lkIjtpOjA7fQ==', 1738928691),
	('ZPCx5shIs4XGKkbIZLaY8DONrMSGZJe3nKQhsBsT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YToxNzp7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YXNrLW92ZXJ2aWV3P3Y9MCZ2YXI9TmclM0QlM0QiO31zOjY6Il90b2tlbiI7czo0MDoiWVk4dzZ0dEdzdnRUNkdzUTVqNW84MzNkam5IWmc4S1ZWcllGQWxzQyI7czo3OiJjYXB0Y2hhIjtzOjQ6IllLQkoiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo3OiJ1c2VyX2lkIjtpOjE7czo4OiJ1c2VybmFtZSI7czoxMToiZGlzdHRfYWRtaW4iO3M6ODoiZnVsbG5hbWUiO3M6NzoiTDEgVXNlciI7czo5OiJpc19hY3RpdmUiO2k6MTtzOjg6ImxldmVsX2lkIjtpOjE7czo1OiJsZXZlbCI7czo3OiJMZXZlbCAxIjtzOjE0OiJkZXNpZ25hdGlvbl9pZCI7aToxO3M6MTE6ImRlc2lnbmF0aW9uIjtzOjE1OiJEZXB1dHkgRGlyZWN0b3IiO3M6MTM6ImRlcGFydG1lbnRfaWQiO2k6MDtzOjk6ImNyZWF0ZV9ieSI7TjtzOjE5OiJpc19wYXNzd29yZF9jaGFuZ2VkIjtpOjE7czo3OiJyb2xlX2lkIjtpOjA7fQ==', 1738931605);

-- Dumping structure for table tlmis_maindb.tbl_file_mgmt
DROP TABLE IF EXISTS `tbl_file_mgmt`;
CREATE TABLE IF NOT EXISTS `tbl_file_mgmt` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_type_id` int NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `issuer` bigint NOT NULL,
  `receiving_date` date NOT NULL,
  `unique_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_nature` enum('NL','TL') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NL',
  `doc_priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_file_id` (`unique_file_id`),
  KEY `file_type_id` (`file_type_id`),
  KEY `reference_no` (`reference_no`),
  KEY `issue_date` (`issue_date`),
  KEY `issuer` (`issuer`),
  KEY `receiving_date` (`receiving_date`),
  KEY `doc_nature` (`doc_nature`),
  KEY `doc_priority` (`doc_priority`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_file_mgmt: ~2 rows (approximately)
INSERT INTO `tbl_file_mgmt` (`id`, `file_type_id`, `reference_no`, `issue_date`, `issuer`, `receiving_date`, `unique_file_id`, `doc_nature`, `doc_priority`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(1, 3, 'Test2354', '2025-01-24', 1, '2025-01-30', '67974f000a67c', 'TL', 'Immediate', 1, '2025-01-27 09:16:48', '2025-01-27 09:16:48', 1, NULL, '127.0.0.1', NULL),
	(2, 2, 'Test', '2025-01-09', 1, '2025-01-15', '6798c1e7be8cf', 'TL', 'Immediate', 1, '2025-01-28 11:39:19', '2025-01-28 11:39:19', 1, NULL, '127.0.0.1', NULL),
	(3, 2, '12345', '2025-01-29', 3, '2025-01-29', '6799cf322faa1', 'TL', 'Other', 1, '2025-01-29 06:48:18', '2025-01-29 06:48:18', 1, NULL, '127.0.0.1', NULL),
	(4, 2, 'TL3432', '2025-01-25', 1, '2025-02-06', '679ccef3eca4c', 'TL', 'Immediate', 1, '2025-01-31 13:24:04', '2025-01-31 13:24:04', 1, NULL, '127.0.0.1', NULL);

-- Dumping structure for table tlmis_maindb.tbl_file_mgmt_uploads
DROP TABLE IF EXISTS `tbl_file_mgmt_uploads`;
CREATE TABLE IF NOT EXISTS `tbl_file_mgmt_uploads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_file_mgmt_id` bigint unsigned NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_mgmt_id` (`fk_file_mgmt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_file_mgmt_uploads: ~2 rows (approximately)
INSERT INTO `tbl_file_mgmt_uploads` (`id`, `fk_file_mgmt_id`, `filename`, `extension`, `path`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(1, 1, 'demo_1737969406.pdf', 'pdf', 'documents/demo_1737969406.pdf', '2025-01-27 09:16:48', '2025-01-27 09:16:48', 1, NULL, '127.0.0.1', NULL),
	(2, 2, 'demo_1738064359.pdf', 'pdf', 'documents/demo_1738064359.pdf', '2025-01-28 11:39:19', '2025-01-28 11:39:19', 1, NULL, '127.0.0.1', NULL),
	(3, 3, 'demo_1738133296.pdf', 'pdf', 'documents/demo_1738133296.pdf', '2025-01-29 06:48:18', '2025-01-29 06:48:18', 1, NULL, '127.0.0.1', NULL),
	(4, 4, 'demo_1738329840.pdf', 'pdf', 'documents/demo_1738329840.pdf', '2025-01-31 13:24:04', '2025-01-31 13:24:04', 1, NULL, '127.0.0.1', NULL);

-- Dumping structure for table tlmis_maindb.tbl_header
DROP TABLE IF EXISTS `tbl_header`;
CREATE TABLE IF NOT EXISTS `tbl_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `header_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.tbl_header: 4 rows
/*!40000 ALTER TABLE `tbl_header` DISABLE KEYS */;
INSERT INTO `tbl_header` (`id`, `header_name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
	(1, 'संचालनालय (Hindi)', '<p style="text-align: center;">संचालनालय</p><p style="text-align: center;">महिला एवं बाल विकास</p><p style="text-align: center;">ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</p><p style="text-align: center;">दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</p>', '2024-11-20 11:41:30', 1, '2024-11-20 17:11:30', NULL),
	(2, 'संचालनालय (English)', '<p style="text-align: center;">Directorate</p><p style="text-align: center;">Women and Child Development</p><p style="text-align: center;">Block A, 2nd Floor, Indravati Bhawan, Nava Raipur, Atal Nagar</p><p style="text-align: center;">Telephone No. 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</p>', '2024-11-20 11:43:13', 1, '2024-11-20 17:13:13', NULL),
	(3, 'मंत्रालय (Hindi)', '<p style="text-align: center;">छत्तीसगढ़ शासन<br />महिला एवं बाल विकास विभाग<br />:: मंत्रालय::<br />महानदी भवन, नया मंत्रालय, रायपुर</p>', '2024-11-20 11:45:10', 1, '2024-11-20 17:15:10', NULL),
	(4, 'मंत्रालय (English)', '<p style="text-align:center"><strong>Chhattisgarh Government</strong></p><p style="text-align:center"><strong>Women and Child Development Department<br />:: Ministry::<br />Mahanadi Bhawan, New Ministry, Raipur</strong></p>', '2024-11-20 11:45:49', 1, '2024-11-20 11:48:31', 1);
/*!40000 ALTER TABLE `tbl_header` ENABLE KEYS */;

-- Dumping structure for table tlmis_maindb.tbl_letters
DROP TABLE IF EXISTS `tbl_letters`;
CREATE TABLE IF NOT EXISTS `tbl_letters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `letter_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aavak_no` int DEFAULT NULL,
  `aavak_date` date DEFAULT NULL,
  `prishthiy_no` int DEFAULT NULL,
  `prishthiy_date` date DEFAULT NULL,
  `header_id` int DEFAULT NULL,
  `header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `letter_for` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `sandarbh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `main_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `pratilipi` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signatory` int DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.tbl_letters: 40 rows
/*!40000 ALTER TABLE `tbl_letters` DISABLE KEYS */;
INSERT INTO `tbl_letters` (`id`, `letter_no`, `aavak_no`, `aavak_date`, `prishthiy_no`, `prishthiy_date`, `header_id`, `header`, `letter_for`, `subject`, `sandarbh`, `main_content`, `pratilipi`, `signatory`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
	(1, 'WCDL00001', NULL, '1970-01-01', NULL, NULL, NULL, NULL, '<p>संचालक,&nbsp;</p><p><span style="color:#27ae60"><span style="background-color:#e74c3c">संचा</span><u><em><strong><span style="background-color:#e74c3c">लनालय महिला</span></strong></em></u></span></p><ul><li><span style="font-size:24px"><u><em><strong>भूह</strong></em></u></span></li><li><u><em><strong>भ्ज्भ्ज</strong></em></u></li></ul>', 'हुइउजिओ', NULL, '<p>जीजी बिहुजी</p>', NULL, 1, 'Y', '2024-05-30 08:32:37', 1, '2024-05-30 08:32:37', NULL),
	(2, 'WCDL00002', NULL, '1970-01-01', NULL, NULL, NULL, NULL, '<p><u><em><strong>कलेक्टर</strong></em></u></p><p>जिला सकती&nbsp;</p>', 'महिलाओ का कार्यस्थल', '<ol><li>छात्तिस्गाह</li><li>ज्फ्ह्गजक्द्फ्ह द्फ्जघ्ज्क्दफ्घ&nbsp;</li><li>ज्ग्द्फज्क्ग</li></ol>', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; द्फ्घ द्ज्घ्दज्क्फ्ह वी[प इउइऔ</p><p>एज्र्त्झ</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ग्फ्फग्द्फ्ग फ्ह्ग्फह</p><p>ह्ज्घ्जघ्ज</p><p>&nbsp;</p><p>&nbsp;</p><p>वयूर्यु त्तज्क्ल क्लर्त्ख</p>', 'dgdfgdfg', 1, 'N', '2024-05-31 07:04:39', 6, '2024-05-31 07:07:14', 6),
	(3, 'WCDL00003', NULL, '1970-01-01', NULL, NULL, NULL, NULL, '<p>जिला कार्यक्रम</p><p>जिला महिला एवं बाल विकास</p>', 'बेटी बचाओ  बेटी पढाओ', '<p>FGFGHFG TT<u><em><strong>YRTY त्य्य्त</strong></em></u></p><ol><li><u><em><strong>फ्घफ्ग्ज क्फ्झ्ह&nbsp;&nbsp;</strong></em></u></li><li><u><em><strong>दिज्फ्क&nbsp;</strong></em></u></li><li>&nbsp;</li></ol>', '<p>द्फ्ग्जक्ग्ल्क द्फ्ग्जफ्ल्ख्ज क्झ्क&nbsp;</p><p>झग&nbsp;</p><p>झ्द्फघ्द्फ्ग</p>', NULL, 1, 'Y', '2024-05-31 07:17:28', 4, '2024-05-31 07:17:28', NULL),
	(4, 'WCDL00004', NULL, '1970-01-01', NULL, NULL, NULL, NULL, '<p>जिला कार्यक्रम अधिकारी</p><p>महिला एवं बाल विकास विभाग</p><p>जिला रायपुर</p>', '\'\'बेटी बचाओ बेटी पढाओ बजट के संबंद मैं', '<p>महिला एवं बाल विकास मंत्रालय भारत सरकार क्रमांक २०२४ दिनांक 20/05/2024&nbsp;</p>', '<p>विषयान्तार्गत अवगत होना चाहेंगे की आप अवकाश ना प्रदान.। इस विषय &#39;&#39;बेटी बचाओ बेटी पढाओ बजट उपलब्ध कराने के संबंध मैं अवश्यक&nbsp;</p><p>कार्यक्रम</p>', 'सचिव, महिला एवं बल विकास विभाग मंत्रालय, महानदी भवन', 1, 'Y', '2024-05-31 07:32:51', 4, '2024-05-31 07:32:51', NULL),
	(5, 'WCDL00005', NULL, '1970-01-01', NULL, NULL, NULL, NULL, '<p>जिला कार्यक्रम अधिकारी/</p><p>जिला महिला एवं बाल विकास अधिकारी</p><p>जिला -दुर्ग&nbsp;</p>', 'बेटी बचाओ बेटी पढ़ाओ कार्यक्रम के अंतर्गत व्यय  न हुई राशि का समर्पण करने विषय', NULL, '<p>देशांतर्गत लेख है वित्त वर्ष 2023 24 में आपके जिलों को बेटी बचाओ बेटी पढ़ाओ कार्यक्रम अंतर्गत कुल 30 लख रुपए का आवंटन लिमिट जारी की गई थी आपके द्वारा प्रेषित किया गया वह विवरण के अनुसार मात्र 22 लख रुपए की राशि आपके द्वारा व्यय की गई है। अत्यंत खेद का विषय है कि आपकी लापरवाही के कारण इस योजना की ₹800000 की राशि व्यपगत हुई एवं कार्यक्रम का आयोजन प्रभावित हुआ है। अब तीन दिवस के अंदर अपना स्पष्टीकरण अधिवर साक्षरता को प्रस्तुत करें</p>', 'कलेक्टर दुर्ग की ओर सूचनार्थ', 1, 'Y', '2024-05-31 07:42:27', 2, '2024-05-31 07:42:27', NULL),
	(6, 'WCDL00006', 122, '2024-11-05', 1, '2024-11-13', NULL, NULL, '<p><strong>परियोजना अधिकारी</strong></p><p>परियोजना अधिकारी<br />एकीकृत बाल विकास परियोजना<br />जिला छ.ग.</p>', 'प्रधानमंत्री मात्र वंदना योजना', '<p>टेस्ट</p>', '<p>टेस्ट&nbsp;</p>', NULL, 3, 'Y', '2024-11-15 09:51:47', 2, '2024-11-15 09:51:47', NULL),
	(7, 'WCDL00007', NULL, '1970-01-01', NULL, NULL, NULL, NULL, '<p><strong>जिला कार्यकारी अधिकारी</strong></p><p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला&nbsp; समस्त&nbsp; छ.ग.</p>', 'नोनी सुरक्षा योजना का क्रियान्वयन में प्रगति लाने विषक', NULL, '<p>&nbsp;विषयान्तर्गत लेख है कि नोनी सुरक्षा योजना योजना महिला एवं बाल विकास विभाग की एक महत्वपूर्ण योजना है। योजना का उद्देश्य समुदाय में बालिकाओं के जन्म के प्रति नकारात्मक विचारधारा को दूर करना तथा एक सकारात्मक वातावरण पैदा करना है योजना अंतर्गत चयनित गरीब&nbsp; परिवार की प्रथम दो बालिकाओं को लाभ दिया जाता है तथा विभाग द्वारा एलआईसी के माध्य्म से बालिका के जन्म पे प्रति वर्ष 5000 रुपये 5 वर्षो तक कुल 25000 की राशि नियोजित की जाती है।बालिका के 18 वर्ष की आयु पूर्ण करने पर अविवाहित रहने पर तथा 12वीं की शिक्षा पूर्ण करने पर ₹100000 की सहायता प्रदान की जाती है।</p><p>अद्यतन स्थिति में योजना अंतर्गत प्रगति अत्यंत न्यून है योजना से अधिक से अधिक पात्र बालिकाओं को लाभ दिलाने हेतु कैंपेन चलाया जाकर पंजीयन करना सुनिश्चित करें तथा पत्र रखने वाली कोई भी परिवार की बालिका इस योजना से लाभ लेने से वंचित न रहे यह सुनिश्चित करने का कष्ट करें</p>', 'कलेक्टर जिला समस्त की ओर सूचनार्थ', 2, 'Y', '2024-11-15 20:00:13', 2, '2024-11-15 20:00:13', NULL),
	(8, 'WCDL00008', NULL, '1970-01-01', NULL, NULL, 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p><strong>कलेक्टर</strong></p><p>कलेक्टर<br />जिला</p>', 'jhsdkjghkjfg', '<p>sdkghjsg lkjdfgkdjf gjdsklgjdfkgj</p><p>kdjfklgjdfklg</p>', '<p>sdkghdkjfgh ldfghdf</p><p>ksld sdg</p><p>&nbsp;ksjdjhgjsfhg</p><p>&nbsp;jsdhgdsg</p><p>kdjghdfg</p>', '<p>1.kjdfhgdfhg</p><p>1. kdjfhgjdfhg</p><p>3. dkjfhgjdfg</p>', 1, 'Y', '2024-11-25 03:19:46', 1, '2024-11-25 08:49:46', NULL),
	(9, 'WCDL00009', NULL, NULL, NULL, NULL, 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>कलेक्टर<br />जिला</p><p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'लोरेम इप्सम क्या है?', '<p>लोरेम इप्सम बस मुद्रण और टाइपसेटिंग उद्योग का डमी टेक्स्ट है।</p>', '<p>लोरेम इप्सम क्या है?<br />लोरेम इप्सम बस मुद्रण और टाइपसेटिंग उद्योग का डमी टेक्स्ट है। 1500 के दशक से लोरेम इप्सम उद्योग का मानक डमी टेक्स्ट रहा है, जब एक अज्ञात प्रिंटर ने टाइप की एक गैली ली और टाइप के नमूने की किताब बनाने के लिए इसे अस्तव्यस्त कर दिया। यह न केवल पाँच शताब्दियों तक जीवित रहा, बल्कि अनिवार्य रूप से अपरिवर्तित रहते हुए इलेक्ट्रॉनिक टाइपसेटिंग में भी छलांग लगाई। इसे 1960 के दशक में लोरेम इप्सम अंशों वाले लेट्रासेट शीट्स के रिलीज़ के साथ लोकप्रिय बनाया गया था, और हाल ही में एल्डस पेजमेकर जैसे डेस्कटॉप प्रकाशन सॉफ़्टवेयर के साथ लोरेम इप्सम के संस्करण शामिल हैं।</p><p>लोरेम इप्सम क्या है?<br />लोरेम इप्सम बस मुद्रण और टाइपसेटिंग उद्योग का डमी टेक्स्ट है। 1500 के दशक से लोरेम इप्सम उद्योग का मानक डमी टेक्स्ट रहा है, जब एक अज्ञात प्रिंटर ने टाइप की एक गैली ली और टाइप के नमूने की किताब बनाने के लिए इसे अस्तव्यस्त कर दिया। यह न केवल पांच शताब्दियों तक जीवित रहा, बल्कि इलेक्ट्रॉनिक टाइपसेटिंग में भी छलांग लगाई, लेकिन मूल रूप से अपरिवर्तित रहा। इसे 1960 के दशक में लेट्रासेट शीट्स के रिलीज़ के साथ लोकप्रिय बनाया गया था, जिसमें लोरेम इप्सम के अंश शामिल थे, और हाल ही में डेस्कटॉप पब्लिशिंग सॉफ़्टवेयर जैसे कि एल्डस पेजमेकर के साथ लोरेम इप्सम के संस्करण शामिल थे।</p>', '<p>परियोजना अधिकारी</p><p>सचिव</p>', 5, 'Y', '2024-11-26 08:21:17', 1, '2024-11-26 13:52:32', NULL),
	(10, 'WCDL00010', 123, '2025-12-31', 1, '2025-12-31', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>कलेक्टर<br />जिला</p><p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p><p>परियोजना अधिकारी<br />एकीकृत बाल विकास परियोजना<br />जिला छ.ग.</p>', 'fdgbh', '<p>dsfgbhn</p>', '<p>xvcbvnbm bnvef bj bjb ej</p>', '<p>dsvfbghnt</p><p>कलेक्टर</p>', 2, 'Y', '2025-01-27 07:15:26', 1, '2025-01-27 12:45:26', NULL),
	(11, NULL, 0, '2025-01-27', 1, '2025-01-28', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>परियोजना अधिकारी<br />एकीकृत बाल विकास परियोजना<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:15:54', 2, NULL, NULL),
	(12, NULL, 0, '2025-01-27', 1, '2025-01-28', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>परियोजना अधिकारी<br />एकीकृत बाल विकास परियोजना<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:16:07', 2, NULL, NULL),
	(13, NULL, 0, '2025-01-27', 1, '2025-01-28', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>परियोजना अधिकारी<br />एकीकृत बाल विकास परियोजना<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:16:12', 2, NULL, NULL),
	(14, NULL, 0, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:17:45', 2, NULL, NULL),
	(15, NULL, 0, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:18:38', 2, NULL, NULL),
	(16, NULL, 0, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:19:28', 2, NULL, NULL),
	(17, NULL, 0, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:19:50', 2, NULL, NULL),
	(18, NULL, 123, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:19:50', 2, NULL, NULL),
	(19, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:24:36', 2, NULL, NULL),
	(20, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:24:57', 2, NULL, NULL),
	(21, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '\'.<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>.\'', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:27:04', 2, NULL, NULL),
	(22, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '\'.<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>.\'', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:27:16', 2, NULL, NULL),
	(23, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:29:47', 2, NULL, NULL),
	(24, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '&lt;p&gt;जिला कार्यकारी अधिकारी&lt;br /&gt;जिला महिला एवं बाल विकास अधिकारी&lt;br /&gt;महिला एवं बाल विकास विभाग&lt;br /&gt;जिला छ.ग.&lt;/p&gt;', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:32:49', 2, NULL, NULL),
	(25, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '&lt;p&gt;जिला कार्यकारी अधिकारी&lt;br /&gt;जिला महिला एवं बाल विकास अधिकारी&lt;br /&gt;महिला एवं बाल विकास विभाग&lt;br /&gt;जिला छ.ग.&lt;/p&gt;', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:33:06', 2, NULL, NULL),
	(26, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '&lt;p&gt;जिला कार्यकारी अधिकारी&lt;br /&gt;जिला महिला एवं बाल विकास अधिकारी&lt;br /&gt;महिला एवं बाल विकास विभाग&lt;br /&gt;जिला छ.ग.&lt;/p&gt;', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:35:23', 2, NULL, NULL),
	(27, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:37:53', 2, NULL, NULL),
	(28, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:38:18', 2, NULL, NULL),
	(29, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:38:48', 2, NULL, NULL),
	(30, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:38:58', 2, NULL, NULL),
	(31, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:39:09', 2, NULL, NULL),
	(32, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:42:20', 2, NULL, NULL),
	(33, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:42:42', 2, NULL, NULL),
	(34, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:43:30', 2, NULL, NULL),
	(35, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:43:53', 2, NULL, NULL),
	(36, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 16:45:09', 2, NULL, NULL),
	(37, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 17:26:08', 2, NULL, NULL),
	(38, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 17:26:22', 2, NULL, NULL),
	(39, NULL, 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 17:27:14', 2, NULL, NULL),
	(40, 'WCDL00040', 12345, '2025-12-01', 1, '2025-12-30', 1, '<p style="text-align:center"><strong>संचालनालय</strong></p><p style="text-align:center"><strong>महिला एवं बाल विकास</strong></p><p style="text-align:center"><strong>ब्लॉक ए, द्वितीय तल, इंद्रावती भवन, नवा रायपुर, अटल नगर</strong></p><p style="text-align:center"><strong>दूरभाष क्रमांक 0771-2234192, 2234188 (Fax) email: dirwcd.cg@nic.in</strong></p>', '<p>जिला कार्यकारी अधिकारी<br />जिला महिला एवं बाल विकास अधिकारी<br />महिला एवं बाल विकास विभाग<br />जिला छ.ग.</p>', 'Test Subject', '<p>Test References</p>', '<p>Test Content For Testing</p>', '<p>परियोजना अधिकारी</p>', 3, NULL, '2025-01-27 17:33:28', 2, NULL, NULL);
/*!40000 ALTER TABLE `tbl_letters` ENABLE KEYS */;

-- Dumping structure for table tlmis_maindb.tbl_notifications
DROP TABLE IF EXISTS `tbl_notifications`;
CREATE TABLE IF NOT EXISTS `tbl_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_removed` tinyint(1) DEFAULT '0',
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_ipaddress` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_ipaddress` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_notifications: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.tbl_task
DROP TABLE IF EXISTS `tbl_task`;
CREATE TABLE IF NOT EXISTS `tbl_task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_task_priority_id` int NOT NULL DEFAULT '0',
  `fk_task_category_id` int NOT NULL DEFAULT '0',
  `entry_date` date NOT NULL,
  `due_date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('P','C','I','O') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'I' COMMENT 'P=Pending, C=Completed, I= Inprogress, O=Reopened',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ref_docs` json DEFAULT NULL COMMENT 'Stores selected reference document IDs',
  `has_file` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `closed_by` int DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_replied` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`task_id`),
  KEY `title` (`title`),
  KEY `fk_task_priority_id` (`fk_task_priority_id`),
  KEY `fk_task_category_id` (`fk_task_category_id`),
  KEY `entry_date` (`entry_date`),
  KEY `due_date` (`due_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_task: ~6 rows (approximately)
INSERT INTO `tbl_task` (`task_id`, `title`, `fk_task_priority_id`, `fk_task_category_id`, `entry_date`, `due_date`, `description`, `status`, `remark`, `ref_docs`, `has_file`, `created_by`, `created_date`, `created_ipaddress`, `updated_by`, `updated_date`, `updated_ipaddress`, `closed_remark`, `closed_by`, `closed_date`, `closed_ipaddress`, `is_replied`) VALUES
	(1, 'Test 031', 1, 1, '2025-02-01', '2025-02-06', 'NA', 'I', NULL, '["4"]', 'N', 1, '2025-02-03 15:47:16', '127.0.0.1', NULL, '2025-02-05 12:54:50', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(2, 'Test 032', 2, 8, '2025-02-03', '2025-02-19', 'NA', 'I', NULL, '["2"]', 'N', 1, '2025-02-03 15:47:46', '127.0.0.1', 1, '2025-02-06 14:28:27', '127.0.0.1', NULL, NULL, NULL, NULL, 'Y'),
	(3, 'Test 033.1', 2, 9, '2025-02-03', '2025-02-20', 'NA', 'C', NULL, '["1"]', 'N', 1, '2025-02-03 15:48:17', '127.0.0.1', 1, '2025-02-06 15:32:01', '127.0.0.1', 'Close 2', 1, '2025-02-06 15:32:01', '127.0.0.1', 'Y'),
	(4, 'Test 05', 1, 2, '2025-02-05', '2025-02-14', 'NA', 'I', NULL, '["3"]', 'N', 1, '2025-02-05 11:05:33', '127.0.0.1', NULL, '2025-02-05 12:39:10', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(5, 'Test 05.1', 1, 9, '2025-02-05', '2025-02-14', 'NA', 'I', NULL, '["1"]', 'Y', 1, '2025-02-05 12:50:35', '127.0.0.1', NULL, '2025-02-06 14:08:27', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(6, 'Test06/02 New', 2, 9, '2025-02-06', '2025-02-07', 'NA', 'I', NULL, NULL, 'N', 1, '2025-02-06 15:39:55', '127.0.0.1', NULL, '2025-02-10 14:25:35', NULL, NULL, NULL, NULL, NULL, 'N');

-- Dumping structure for table tlmis_maindb.tbl_task_closed_trs
DROP TABLE IF EXISTS `tbl_task_closed_trs`;
CREATE TABLE IF NOT EXISTS `tbl_task_closed_trs` (
  `closed_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int NOT NULL,
  `closed_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `closed_by` int DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`closed_id`) USING BTREE,
  KEY `fk_task_id` (`fk_task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_task_closed_trs: ~5 rows (approximately)
INSERT INTO `tbl_task_closed_trs` (`closed_id`, `fk_task_id`, `closed_remark`, `closed_by`, `closed_date`, `closed_ipaddress`) VALUES
	(1, 3, 'Closed', 1, '2025-02-05 13:17:55', '127.0.0.1'),
	(2, 3, 'Close', 1, '2025-02-05 23:53:36', '127.0.0.1'),
	(3, 3, 'again close', 1, '2025-02-05 23:55:24', '127.0.0.1'),
	(4, 3, 'Close', 1, '2025-02-06 13:56:28', '127.0.0.1'),
	(5, 3, 'Close 1', 1, '2025-02-06 15:31:31', '127.0.0.1'),
	(6, 3, 'Close 2', 1, '2025-02-06 15:32:01', '127.0.0.1');

-- Dumping structure for table tlmis_maindb.tbl_task_files
DROP TABLE IF EXISTS `tbl_task_files`;
CREATE TABLE IF NOT EXISTS `tbl_task_files` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int DEFAULT NULL,
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `fk_task_id` (`fk_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_task_files: ~2 rows (approximately)
INSERT INTO `tbl_task_files` (`file_id`, `fk_task_id`, `file`, `file_name`, `file_size`) VALUES
	(1, 5, 'task_files/demo_1738831104.pdf', 'demo.pdf', '95653'),
	(2, 5, 'task_files/demo_1738831195.pdf', 'demo.pdf', '95653');

-- Dumping structure for table tlmis_maindb.tbl_task_reopen_trs
DROP TABLE IF EXISTS `tbl_task_reopen_trs`;
CREATE TABLE IF NOT EXISTS `tbl_task_reopen_trs` (
  `reopen_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int NOT NULL,
  `reopen_date` datetime DEFAULT (now()),
  `reopen_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reopen_by` int DEFAULT NULL,
  `reopen_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_remark` text COLLATE utf8mb4_unicode_ci,
  `closed_by` int DEFAULT NULL,
  `closed_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reopen_id`) USING BTREE,
  KEY `fk_task_id` (`fk_task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_task_reopen_trs: ~5 rows (approximately)
INSERT INTO `tbl_task_reopen_trs` (`reopen_id`, `fk_task_id`, `reopen_date`, `reopen_remark`, `reopen_by`, `reopen_ipaddress`, `closed_date`, `closed_remark`, `closed_by`, `closed_ipaddress`) VALUES
	(1, 3, '2025-02-05 23:45:56', 'Reopen', 1, '127.0.0.1', '2025-02-05 23:53:36', 'Close', 1, '127.0.0.1'),
	(2, 3, '2025-02-05 23:54:39', 'Again', 1, '127.0.0.1', '2025-02-05 23:55:24', 'again close', 1, '127.0.0.1'),
	(3, 3, '2025-02-06 13:56:14', 'Reopen', 1, '127.0.0.1', '2025-02-06 13:56:28', 'Close', 1, '127.0.0.1'),
	(4, 3, '2025-02-06 15:31:18', 'Reopen 1', 1, '127.0.0.1', '2025-02-06 15:31:31', 'Close 1', 1, '127.0.0.1'),
	(5, 3, '2025-02-06 15:31:49', 'Reopen', 1, '127.0.0.1', '2025-02-06 15:32:01', 'Close 2', 1, '127.0.0.1');

-- Dumping structure for table tlmis_maindb.tbl_task_reply_trs
DROP TABLE IF EXISTS `tbl_task_reply_trs`;
CREATE TABLE IF NOT EXISTS `tbl_task_reply_trs` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int NOT NULL DEFAULT '0',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reply_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_id`),
  KEY `fk_task_id` (`fk_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_task_reply_trs: ~10 rows (approximately)
INSERT INTO `tbl_task_reply_trs` (`reply_id`, `fk_task_id`, `reply`, `reply_file`, `file_size`, `file_name`, `created_by`, `created_ipaddress`, `created_datetime`, `update_by`, `update_ipaddress`, `update_datetime`) VALUES
	(1, 4, 'Comment 1', NULL, NULL, NULL, 6, '127.0.0.1', '2025-02-05 12:39:10', NULL, NULL, '2025-02-05 12:47:09'),
	(2, 3, 'Comment 1', NULL, NULL, NULL, 7, '127.0.0.1', '2025-02-05 12:48:32', NULL, NULL, NULL),
	(3, 5, 'Comment 1', NULL, NULL, NULL, 1, '127.0.0.1', '2025-02-05 12:51:04', NULL, NULL, '2025-02-05 13:32:44'),
	(4, 1, 'Done', NULL, NULL, NULL, 1, '127.0.0.1', '2025-02-05 12:54:50', NULL, NULL, NULL),
	(5, 1, 'Comment 2', NULL, NULL, NULL, 7, '127.0.0.1', '2025-02-05 13:05:03', NULL, NULL, NULL),
	(6, 1, 'Comment 3', NULL, NULL, NULL, 6, '127.0.0.1', '2025-02-05 13:06:01', NULL, NULL, NULL),
	(7, 3, 'Comment 2', NULL, NULL, NULL, 1, '127.0.0.1', '2025-02-05 23:46:20', NULL, NULL, NULL),
	(8, 3, 'Comment 3', NULL, NULL, NULL, 1, '127.0.0.1', '2025-02-05 23:54:55', NULL, NULL, NULL),
	(9, 5, 'Ok then', NULL, NULL, NULL, 7, '127.0.0.1', '2025-02-06 14:17:46', NULL, NULL, NULL),
	(10, 2, 'Comment 1', NULL, NULL, NULL, 6, '127.0.0.1', '2025-02-06 14:28:27', NULL, NULL, NULL);

-- Dumping structure for table tlmis_maindb.tbl_task_send_back_trs
DROP TABLE IF EXISTS `tbl_task_send_back_trs`;
CREATE TABLE IF NOT EXISTS `tbl_task_send_back_trs` (
  `td_sb_id` int NOT NULL AUTO_INCREMENT,
  `fk_map_id` int NOT NULL,
  `fk_task_id` int NOT NULL DEFAULT '0',
  `fk_dept_id` int NOT NULL DEFAULT '0',
  `is_send_back` tinyint DEFAULT '0',
  `send_back_remark` text COLLATE utf8mb4_unicode_ci,
  `send_back_status` enum('A','R','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A-Approved,R-Rejected,P-Pending',
  `send_back_by` int DEFAULT '0',
  `send_back_date` datetime DEFAULT NULL,
  `send_back_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sb_action_by` int DEFAULT '0',
  `sb_action_remark` text COLLATE utf8mb4_unicode_ci,
  `sb_action_date` datetime DEFAULT NULL,
  `sb_action_ipddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`td_sb_id`) USING BTREE,
  KEY `fk_task_id` (`fk_task_id`) USING BTREE,
  KEY `fk_dept_id` (`fk_dept_id`) USING BTREE,
  KEY `td_map_id` (`fk_map_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_task_send_back_trs: ~3 rows (approximately)
INSERT INTO `tbl_task_send_back_trs` (`td_sb_id`, `fk_map_id`, `fk_task_id`, `fk_dept_id`, `is_send_back`, `send_back_remark`, `send_back_status`, `send_back_by`, `send_back_date`, `send_back_ipaddress`, `sb_action_by`, `sb_action_remark`, `sb_action_date`, `sb_action_ipddress`) VALUES
	(1, 10, 5, 3, 1, 'Not belong to me', 'R', 7, '2025-02-06 14:12:00', '127.0.0.1', 1, 'No, Rejected.\nPlease do it', '2025-02-06 14:17:17', '127.0.0.1'),
	(2, 4, 2, 3, 1, 'Test SB', 'R', 7, '2025-02-06 14:18:13', '127.0.0.1', 1, 'Rejected', '2025-02-06 14:18:25', '127.0.0.1'),
	(3, 4, 2, 3, 1, 'Test SB Again', 'A', 7, '2025-02-06 14:18:39', '127.0.0.1', 1, 'Ok Approved', '2025-02-06 14:18:54', '127.0.0.1');

-- Dumping structure for table tlmis_maindb.tbl_task_user_map
DROP TABLE IF EXISTS `tbl_task_user_map`;
CREATE TABLE IF NOT EXISTS `tbl_task_user_map` (
  `map_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int DEFAULT NULL,
  `fk_dept_id` int DEFAULT NULL,
  `fk_user_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_send_back` tinyint DEFAULT '0',
  `send_back_remark` text COLLATE utf8mb4_general_ci,
  `send_back_status` enum('A','R','P') COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'A-Approved,R-Rejected,P-Pending',
  `send_back_by` int DEFAULT '0',
  `send_back_date` datetime DEFAULT NULL,
  `send_back_ipaddress` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sb_action_by` int DEFAULT '0',
  `sb_action_remark` text COLLATE utf8mb4_general_ci,
  `sb_action_date` datetime DEFAULT NULL,
  `sb_action_ipddress` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_viewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`map_id`),
  KEY `fk_dept_id` (`fk_dept_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `fk_task_d` (`fk_task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_maindb.tbl_task_user_map: ~16 rows (approximately)
INSERT INTO `tbl_task_user_map` (`map_id`, `fk_task_id`, `fk_dept_id`, `fk_user_id`, `created_by`, `created_at`, `created_ip`, `is_send_back`, `send_back_remark`, `send_back_status`, `send_back_by`, `send_back_date`, `send_back_ipaddress`, `sb_action_by`, `sb_action_remark`, `sb_action_date`, `sb_action_ipddress`, `is_viewed`) VALUES
	(1, 1, 2, 6, 1, '2025-02-03 15:47:16', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(2, 1, 3, 7, 1, '2025-02-03 15:47:16', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(3, 2, 2, 6, 1, '2025-02-03 15:47:46', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(4, 2, 3, 7, 1, '2025-02-03 15:47:46', '127.0.0.1', 1, 'Test SB Again', 'A', 7, '2025-02-06 14:18:39', '127.0.0.1', 1, 'Ok Approved', '2025-02-06 14:18:54', '127.0.0.1', 0),
	(5, 3, 2, 6, 1, '2025-02-03 15:48:17', '127.0.0.1', 0, NULL, NULL, 0, '2025-02-04 15:59:49', '127.0.0.1', 0, 'Ok, then approved your request.', '2025-02-04 16:00:25', '127.0.0.1', 0),
	(7, 3, 3, 7, 1, '2025-02-04 14:17:36', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(8, 4, 2, 6, 1, '2025-02-05 11:05:33', '127.0.0.1', 0, NULL, NULL, 0, '2025-02-05 12:37:37', '127.0.0.1', 0, 'Do it, Testing Send Back', '2025-02-05 12:38:51', '127.0.0.1', 1),
	(9, 5, 2, 6, 1, '2025-02-05 12:50:35', '127.0.0.1', 0, NULL, NULL, 0, '2025-02-05 13:33:35', '127.0.0.1', 0, 'Approved', '2025-02-05 13:33:56', '127.0.0.1', 0),
	(10, 5, 3, 7, 1, '2025-02-05 12:50:35', '127.0.0.1', 1, 'Not belong to me', 'R', 7, '2025-02-06 14:12:00', '127.0.0.1', 1, 'No, Rejected.\nPlease do it', '2025-02-06 14:17:17', '127.0.0.1', 1),
	(11, 2, 2, 11, 1, '2025-02-06 12:20:19', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(12, 6, 2, 11, 1, '2025-02-06 15:39:55', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(13, 6, 2, 6, 1, '2025-02-06 15:39:55', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(14, 6, 3, 7, 1, '2025-02-06 15:39:55', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(15, 6, 4, 8, 1, '2025-02-06 15:39:55', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(16, 6, 9, 9, 1, '2025-02-06 15:39:55', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(17, 6, 9, 9, 7, '2025-02-06 16:30:32', '127.0.0.1', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0);

-- Dumping structure for table tlmis_maindb.tbl_users
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_lgd_code` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `preferences` json DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_password_changed` tinyint(1) NOT NULL DEFAULT '0',
  `fk_role_id` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `mobile` (`mobile`),
  KEY `username` (`username`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_users: ~10 rows (approximately)
INSERT INTO `tbl_users` (`user_id`, `full_name`, `mobile`, `email`, `username`, `password`, `salt`, `district_lgd_code`, `is_active`, `preferences`, `remember_token`, `is_password_changed`, `fk_role_id`) VALUES
	(1, 'L1 User', '9685287888', 'collector-mmac@cg.gov.in', 'distt_admin', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL, 1, 0),
	(2, 'Demo User', '7675787654', 'demo@info.com', 'demouser', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL, 1, 0),
	(3, 'Test User', '7898962294', NULL, '7898962294', '3e215f371c826418ed07884f2e4b66a707f130de0a80b71ef247d90b1afc4286826bf1de4790c85fd305d1d03e1ce96db5575bd5bc9fcf75216ecde9bb8be311', 'U5O3BIW', NULL, 1, NULL, NULL, 1, 0),
	(4, 'श्री चंद्रशेखर मिश्रा', '9424273201', NULL, '9424273201', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL, 1, 0),
	(5, 'Test User', '9898765431', 'test@info.com', 'TL-00005', '5fd3c16b633b61b982617521f748a35821e574979e5c03301d41b43b51fc3c21482c71d56a53af502e5cdca2ce00276197420d0cb015018cdfbb94883ec69aa2', 'eMXAxgg', NULL, 1, NULL, NULL, 1, 0),
	(6, 'ABC L3', '9876545678', NULL, 'TL-00006', 'e7907b4ec7e0934cf728533289ed2fd0c56e2f264bb26aa2eb87e8a82cc97e809941e2ee202312efbfb2ec37f5b12560b264cd4975ff551a7976eef8d508fa29', 'BN3J98n', NULL, 1, NULL, NULL, 1, 0),
	(7, 'XYZ L4', '8765787654', NULL, 'TL-00007', '3f4f24c5cdd7026906fb0352409c6f987797760f199b9b7d3db5a937c17e7395fe9eb1d65a9da9ea4fe2cb893539e6c922ee78add5f6a1bbea810e428e2a128e', 'Fn1yIfJ', NULL, 1, NULL, NULL, 1, 0),
	(8, 'PQR L4', '6545678765', NULL, 'TL-MM-00008', '17d563c7977f2b39502109b3274524cb6c5bb263f77ff53fa4d473adc642eec56158de293b5efb030163aa6bee7c5dcd784d468d25d17b1644a85812d5656a8d', 'P2qS6YV', NULL, 1, NULL, NULL, 1, 0),
	(9, 'DCE L5', '9876546676', NULL, 'TL-MM-00009', '1635450dd18c106d2cc810141280e3539d344d436c882ec6f40517a6f3c954da5ac0aa20f9e2f3569081bc8ff3a2d0d22f79582104bed88e6fc789d577c508e6', 'Jn0AomX', NULL, 1, NULL, NULL, 1, 0),
	(10, 'Operator', '', NULL, 'mm-operator', 'b449ee3a415f6f45d9bd0b3a090bed02aad26270da7102e9f1bdc84033215e3d5e4b7620d5aa8314a61890c517b6fc9556f226d0a438334b8a887e33f0147782', 'S7BAGGT', NULL, 1, NULL, NULL, 1, 3),
	(11, 'L2User', '6545678976', NULL, 'TL-MM-00011', 'bba62341c7f23739f7182213fe7e1d1e43b0727e85eb15a4cc3b2b4be977bc49eddab5d7678212c56d1e7f7aea8431b5722fc26fa49b30a6dd8861b9fefd6a44', '9ITr2RL', NULL, 1, NULL, NULL, 0, 0);

-- Dumping structure for table tlmis_maindb.tbl_user_map
DROP TABLE IF EXISTS `tbl_user_map`;
CREATE TABLE IF NOT EXISTS `tbl_user_map` (
  `user_map_id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `fk_level_id` int DEFAULT NULL,
  `fk_department_id` int DEFAULT NULL,
  `fk_designation_id` int NOT NULL,
  `remark` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_ipaddress` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_ipaddress` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_map_id`),
  KEY `tbl_user_map_fk_department_id_index` (`fk_department_id`),
  KEY `tbl_user_map_fk_designation_id_index` (`fk_designation_id`),
  KEY `tbl_user_map_fk_user_id_index` (`fk_user_id`),
  KEY `tbl_user_map_fk_level_id_index` (`fk_level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tbl_user_map: 11 rows
/*!40000 ALTER TABLE `tbl_user_map` DISABLE KEYS */;
INSERT INTO `tbl_user_map` (`user_map_id`, `fk_user_id`, `fk_level_id`, `fk_department_id`, `fk_designation_id`, `remark`, `is_active`, `create_by`, `update_by`, `create_datetime`, `update_datetime`, `create_ipaddress`, `update_ipaddress`) VALUES
	(1, 2, 1, NULL, 1, NULL, 1, NULL, NULL, '2024-12-18 12:20:19', '2025-01-17 06:44:53', '::1', NULL),
	(2, 1, 1, NULL, 1, NULL, 1, NULL, NULL, '2024-12-18 12:20:19', '2025-01-17 06:44:57', '::1', NULL),
	(3, 3, 1, NULL, 1, NULL, 1, NULL, NULL, '2024-12-18 12:20:19', '2025-01-17 06:44:59', '::1', NULL),
	(4, 4, 2, 16, 14, NULL, 1, 1, NULL, '2025-01-16 16:32:04', '2025-01-22 06:53:26', '162.158.16', NULL),
	(5, 5, 2, 16, 8, NULL, 1, 1, NULL, '2025-01-20 06:35:39', '2025-01-22 06:53:29', '162.158.16', NULL),
	(6, 6, 3, 2, 15, NULL, 1, 1, 1, '2025-01-27 14:45:36', '2025-01-27 14:47:30', '127.0.0.1', '127.0.0.1'),
	(7, 7, 4, 3, 15, NULL, 1, 1, 1, '2025-01-27 14:46:01', '2025-01-27 14:47:50', '127.0.0.1', '127.0.0.1'),
	(8, 8, 4, 4, 15, NULL, 1, 1, NULL, '2025-01-27 15:14:27', NULL, '127.0.0.1', NULL),
	(9, 9, 5, 9, 15, NULL, 1, 1, NULL, '2025-01-27 15:17:57', '2025-02-06 16:33:59', '127.0.0.1', NULL),
	(10, 10, NULL, NULL, 8, NULL, 1, NULL, NULL, '2025-01-16 16:45:27', '2025-01-29 09:02:05', '127.0.0.1', NULL),
	(11, 11, 2, 2, 15, NULL, 1, 1, NULL, '2025-02-06 12:20:03', NULL, '127.0.0.1', NULL);
/*!40000 ALTER TABLE `tbl_user_map` ENABLE KEYS */;

-- Dumping structure for table tlmis_maindb.tl_reviews
DROP TABLE IF EXISTS `tl_reviews`;
CREATE TABLE IF NOT EXISTS `tl_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tl_date` date NOT NULL,
  `tl_time` time NOT NULL,
  `tl_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tl_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tl_status` enum('SCH','CMP','PST','CNC') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SCH',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postponed_date` date DEFAULT NULL,
  `postponed_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tl_date` (`tl_date`),
  KEY `tl_title` (`tl_title`),
  KEY `tl_status` (`tl_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tl_reviews: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.tl_review_task_map
DROP TABLE IF EXISTS `tl_review_task_map`;
CREATE TABLE IF NOT EXISTS `tl_review_task_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_tl_review_id` int NOT NULL,
  `fk_task_id` int NOT NULL,
  `status` enum('REVIEWED','NOT-REVIEWED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NOT-REVIEWED',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tl_review_id` (`fk_tl_review_id`),
  KEY `fk_task_id` (`fk_task_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.tl_review_task_map: ~0 rows (approximately)

-- Dumping structure for table tlmis_maindb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_maindb.users: ~0 rows (approximately)

-- Dumping structure for trigger tlmis_maindb.trg_before_delete_tbl_user_map
DROP TRIGGER IF EXISTS `trg_before_delete_tbl_user_map`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_before_delete_tbl_user_map` BEFORE DELETE ON `tbl_user_map` FOR EACH ROW INSERT INTO log_tbl_user_map_before_delete (
           user_map_id,
       fk_user_id,
       fk_level_id,
       fk_department_id,
       fk_designation_id,
       remark,
       is_active,
       create_by,
       update_by,
       create_datetime,
       update_datetime,
       create_ipaddress,
       update_ipaddress
        )
        VALUES (
            old.user_map_id,
       old.fk_user_id,
       old.fk_level_id,
       old.fk_department_id,
       old.fk_designation_id,
       old.remark,
       old.is_active,
       old.create_by,
       old.update_by,
       old.create_datetime,
       old.update_datetime,
       old.create_ipaddress,
       old.update_ipaddress
        )//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_maindb.trg_before_update_master_designation
DROP TRIGGER IF EXISTS `trg_before_update_master_designation`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_before_update_master_designation` BEFORE UPDATE ON `master_designation` FOR EACH ROW INSERT into log_master_designation(designation_id, designation, is_active)
            values (old.designation_id, old.designation, old.is_active)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_maindb.trg_before_update_master_issuer_types
DROP TRIGGER IF EXISTS `trg_before_update_master_issuer_types`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_before_update_master_issuer_types` BEFORE UPDATE ON `master_issuer_types` FOR EACH ROW insert into log_master_issuer_types(id,
       name_hi,
       name_en,
       status,
       created_by,
       updated_by,
       created_at,
       updated_at,
       created_ip,
       updated_ip) values (old.id,
       old.name_hi,
       old.name_en,
       old.status,
       old.created_by,
       old.updated_by,
       old.created_at,
       old.updated_at,
       old.created_ip,
       old.updated_ip)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_maindb.trg_before_update_tbl_users
DROP TRIGGER IF EXISTS `trg_before_update_tbl_users`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_before_update_tbl_users` BEFORE UPDATE ON `tbl_users` FOR EACH ROW INSERT INTO log_tbl_users (
           user_id,
       full_name,
       mobile,
       email,
       username,
       password,
       salt,
       district_lgd_code,
       is_active,
       preferences,
       remember_token,
       is_password_changed,
        fk_role_id
        )
        VALUES (
             old.user_id,
       old.full_name,
       old.mobile,
       old.email,
       old.username,
       old.password,
       old.salt,
       old.district_lgd_code,
       old.is_active,
       old.preferences,
       old.remember_token,
       old.is_password_changed,
        old.fk_role_id
        )//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_maindb.trg_task_user_map_before_delete
DROP TRIGGER IF EXISTS `trg_task_user_map_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_task_user_map_before_delete` BEFORE DELETE ON `tbl_task_user_map` FOR EACH ROW INSERT INTO log_task_user_map_before_delete
	(map_id, fk_task_id, fk_dept_id,fk_user_id, created_by, created_at, created_ip)
	VALUES (OLD.map_id, OLD.fk_task_id, OLD.fk_dept_id, OLD.fk_user_id, OLD.created_by, 
	OLD.created_at, OLD.created_ip)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_maindb.trg_tbl_task_before_update
DROP TRIGGER IF EXISTS `trg_tbl_task_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_tbl_task_before_update` BEFORE UPDATE ON `tbl_task` FOR EACH ROW INSERT into log_tbl_task(task_id, title,fk_task_priority_id,fk_task_category_id,entry_date,due_date,description,status,remark,
 has_file,created_by,created_date,created_ipaddress,updated_by,updated_date,updated_ipaddress,ref_docs) 
 VALUES(OLD.task_id,OLD.title,OLD.fk_task_priority_id,OLD.fk_task_category_id,OLD.entry_date,OLD.due_date,OLD.description,
 OLD.status,OLD.remark,OLD.has_file,OLD.created_by,OLD.created_date,OLD.created_ipaddress,OLD.updated_by,OLD.updated_date,
 OLD.updated_ipaddress,OLD.ref_docs)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_maindb.trg_tbl_task_files_before_delete
DROP TRIGGER IF EXISTS `trg_tbl_task_files_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_tbl_task_files_before_delete` BEFORE DELETE ON `tbl_task_files` FOR EACH ROW INSERT INTO log_tbl_task_files_before_delete
	(file_id, fk_task_id, file, file_name, file_size)
	VALUES (OLD.file_id, OLD.fk_task_id, OLD.file, OLD.file_name, OLD.file_size)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
