-- --------------------------------------------------------
-- Host:                         68.183.88.16
-- Server version:               8.0.36 - Source distribution
-- Server OS:                    Linux
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

-- Dumping structure for table tlmis_testing.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.cache: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.cache_locks: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.failed_jobs
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

-- Dumping data for table tlmis_testing.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.jobs
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

-- Dumping data for table tlmis_testing.jobs: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.job_batches
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

-- Dumping data for table tlmis_testing.job_batches: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.log_master_department
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

-- Dumping data for table tlmis_testing.log_master_department: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.log_master_designation
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.log_master_designation: ~1 rows (approximately)
INSERT INTO `log_master_designation` (`log_id`, `designation_id`, `designation`, `is_active`, `log_create_date_time`) VALUES
	(1, 1, 'Deputy Director', 1, '2025-02-03 07:05:35');

-- Dumping structure for table tlmis_testing.log_master_doc_types
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

-- Dumping data for table tlmis_testing.log_master_doc_types: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.log_master_issuer_types
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.log_master_issuer_types: ~5 rows (approximately)
INSERT INTO `log_master_issuer_types` (`log_id`, `id`, `name_hi`, `name_en`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`, `log_created_at`) VALUES
	(1, 15, 'कॉर्पोरेट जारीकर्ता', 'Corporate Issuers', 1, 1, NULL, '2025-02-04 15:03:07', '2025-02-04 15:03:07', '162.158.163.206', NULL, '2025-02-04 09:33:25'),
	(2, 14, 'संचालनालय', 'Directorate', 1, 1, NULL, '2025-01-14 14:06:18', '2025-01-14 14:06:18', '162.158.163.93', NULL, '2025-02-04 09:33:58'),
	(3, 14, 'कॉर्पोरेट जारीकर्ता', 'Corporate Issuers', 1, 1, 1, '2025-01-14 14:06:18', '2025-02-04 15:03:58', '162.158.163.93', '162.158.163.205', '2025-02-04 09:36:56'),
	(4, 19, 'प्रबंध-विभाग', 'Diractorate', 1, 1, NULL, '2025-02-11 12:26:01', '2025-02-11 12:26:01', '162.158.162.171', NULL, '2025-02-11 07:01:56'),
	(5, 18, 'प्रबंध-विभाग', 'Diractorate', 1, 1, NULL, '2025-02-11 12:23:25', '2025-02-11 12:23:25', '172.69.165.13', NULL, '2025-02-18 07:19:32');

-- Dumping structure for table tlmis_testing.log_task_details
DROP TABLE IF EXISTS `log_task_details`;
CREATE TABLE IF NOT EXISTS `log_task_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `task_entry_date` timestamp NULL DEFAULT NULL,
  `TL_date` timestamp NULL DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `worktype_id` int DEFAULT NULL,
  `work_no` int DEFAULT NULL,
  `subject` text,
  `work_description` text,
  `file_id` int DEFAULT NULL,
  `related_officers` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` enum('P','C') DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_ip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table tlmis_testing.log_task_details: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.log_task_user_map_before_delete
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.log_task_user_map_before_delete: ~10 rows (approximately)
INSERT INTO `log_task_user_map_before_delete` (`log_id`, `map_id`, `fk_task_id`, `fk_dept_id`, `fk_user_id`, `created_by`, `created_at`, `created_ip`, `log_creation`) VALUES
	(1, 12, 9, 7, 6, 5, '2025-02-10 09:07:40', '162.158.162.171', '2025-02-10 09:39:17'),
	(2, 23, 16, 14, 4, 7, '2025-02-15 10:05:29', '162.158.163.155', '2025-02-15 10:14:02'),
	(3, 35, 20, 14, 4, 16, '2025-02-18 05:42:20', '162.158.163.235', '2025-02-18 05:47:38'),
	(4, 36, 20, 12, 5, 16, '2025-02-18 05:47:38', '162.158.163.235', '2025-02-18 06:19:06'),
	(5, 37, 20, 11, 5, 16, '2025-02-18 06:19:06', '162.158.163.95', '2025-02-18 06:19:38'),
	(6, 38, 20, 12, 5, 16, '2025-02-18 06:19:38', '162.158.163.95', '2025-02-18 06:20:54'),
	(7, 39, 20, 12, 5, 16, '2025-02-18 06:19:45', '162.158.163.235', '2025-02-18 06:20:54'),
	(8, 40, 20, 11, 5, 16, '2025-02-18 06:20:54', '162.158.163.235', '2025-02-18 06:21:10'),
	(9, 42, 20, 11, 5, 16, '2025-02-18 06:21:48', '162.158.163.235', '2025-02-18 06:23:50'),
	(10, 41, 20, 12, 5, 16, '2025-02-18 06:21:10', '162.158.163.235', '2025-02-18 06:30:47');

-- Dumping structure for table tlmis_testing.log_tbl_login
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
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.log_tbl_login: 143 rows
/*!40000 ALTER TABLE `log_tbl_login` DISABLE KEYS */;
INSERT INTO `log_tbl_login` (`id`, `fk_user_id`, `current_status`, `login_datetime`, `logged_out_datetime`, `login_ipaddress`, `logged_out_ipaddress`) VALUES
	(1, 1, 'OUT', '2025-02-03 07:04:30', '2025-02-19 07:01:36', '162.158.163.245', '162.158.162.162'),
	(2, 1, 'OUT', '2025-02-03 07:05:55', '2025-02-19 07:01:36', '162.158.163.245', '162.158.162.162'),
	(3, 2, 'OUT', '2025-02-03 07:17:53', '2025-02-03 07:24:58', '162.158.163.245', '162.158.163.80'),
	(4, 1, 'OUT', '2025-02-03 07:22:10', '2025-02-19 07:01:36', '162.158.162.47', '162.158.162.162'),
	(5, 1, 'OUT', '2025-02-03 07:22:58', '2025-02-19 07:01:36', '162.158.163.246', '162.158.162.162'),
	(6, 2, 'OUT', '2025-02-03 07:24:55', '2025-02-03 07:24:58', '162.158.163.80', '162.158.163.80'),
	(7, 1, 'OUT', '2025-02-03 12:52:52', '2025-02-19 07:01:36', '162.158.163.179', '162.158.162.162'),
	(8, 1, 'OUT', '2025-02-03 12:55:22', '2025-02-19 07:01:36', '162.158.162.51', '162.158.162.162'),
	(9, 1, 'OUT', '2025-02-03 12:58:12', '2025-02-19 07:01:36', '162.158.163.205', '162.158.162.162'),
	(10, 1, 'OUT', '2025-02-04 05:09:27', '2025-02-19 07:01:36', '162.158.163.155', '162.158.162.162'),
	(11, 1, 'OUT', '2025-02-04 05:15:49', '2025-02-19 07:01:36', '162.158.163.179', '162.158.162.162'),
	(12, 1, 'OUT', '2025-02-04 05:20:23', '2025-02-19 07:01:36', '162.158.162.50', '162.158.162.162'),
	(13, 1, 'OUT', '2025-02-04 05:20:40', '2025-02-19 07:01:36', '172.69.165.75', '162.158.162.162'),
	(14, 1, 'OUT', '2025-02-04 05:22:51', '2025-02-19 07:01:36', '162.158.162.78', '162.158.162.162'),
	(15, 1, 'OUT', '2025-02-04 07:04:24', '2025-02-19 07:01:36', '162.158.163.206', '162.158.162.162'),
	(16, 1, 'OUT', '2025-02-04 07:08:59', '2025-02-19 07:01:36', '162.158.163.156', '162.158.162.162'),
	(17, 1, 'OUT', '2025-02-04 07:14:40', '2025-02-19 07:01:36', '162.158.163.205', '162.158.162.162'),
	(18, 1, 'OUT', '2025-02-04 07:19:59', '2025-02-19 07:01:36', '162.158.162.79', '162.158.162.162'),
	(19, 1, 'OUT', '2025-02-04 07:21:51', '2025-02-19 07:01:36', '162.158.162.45', '162.158.162.162'),
	(22, 1, 'OUT', '2025-02-04 16:34:18', '2025-02-19 07:01:36', '162.158.163.168', '162.158.162.162'),
	(20, 1, 'OUT', '2025-02-04 08:08:39', '2025-02-19 07:01:36', '162.158.162.123', '162.158.162.162'),
	(21, 1, 'OUT', '2025-02-04 08:48:50', '2025-02-19 07:01:36', '162.158.162.44', '162.158.162.162'),
	(23, 1, 'OUT', '2025-02-04 17:42:08', '2025-02-19 07:01:36', '162.158.162.44', '162.158.162.162'),
	(24, 1, 'OUT', '2025-02-05 05:08:55', '2025-02-19 07:01:36', '162.158.162.79', '162.158.162.162'),
	(25, 1, 'OUT', '2025-02-05 05:10:21', '2025-02-19 07:01:36', '162.158.163.180', '162.158.162.162'),
	(26, 1, 'OUT', '2025-02-05 05:11:12', '2025-02-19 07:01:36', '162.158.162.45', '162.158.162.162'),
	(27, 1, 'OUT', '2025-02-05 05:13:02', '2025-02-19 07:01:36', '162.158.162.78', '162.158.162.162'),
	(28, 1, 'OUT', '2025-02-05 05:29:05', '2025-02-19 07:01:36', '162.158.162.50', '162.158.162.162'),
	(29, 1, 'OUT', '2025-02-05 06:00:04', '2025-02-19 07:01:36', '162.158.163.205', '162.158.162.162'),
	(63, 8, 'OUT', '2025-02-10 09:40:34', '2025-02-10 09:58:25', '162.158.162.90', '162.158.163.24'),
	(30, 1, 'OUT', '2025-02-05 07:40:16', '2025-02-19 07:01:36', '162.158.163.206', '162.158.162.162'),
	(31, 1, 'OUT', '2025-02-05 09:48:31', '2025-02-19 07:01:36', '162.158.162.44', '162.158.162.162'),
	(32, 1, 'OUT', '2025-02-05 11:30:33', '2025-02-19 07:01:36', '162.158.163.179', '162.158.162.162'),
	(33, 1, 'OUT', '2025-02-06 05:29:45', '2025-02-19 07:01:36', '162.158.163.206', '162.158.162.162'),
	(34, 1, 'OUT', '2025-02-06 06:55:27', '2025-02-19 07:01:36', '162.158.163.156', '162.158.162.162'),
	(35, 1, 'OUT', '2025-02-07 07:32:43', '2025-02-19 07:01:36', '162.158.163.205', '162.158.162.162'),
	(36, 1, 'OUT', '2025-02-07 10:36:23', '2025-02-19 07:01:36', '162.158.162.163', '162.158.162.162'),
	(37, 1, 'OUT', '2025-02-10 07:31:42', '2025-02-19 07:01:36', '162.158.162.170', '162.158.162.162'),
	(38, 7, 'OUT', '2025-02-10 07:33:14', '2025-02-15 10:27:44', '162.158.162.171', '172.69.165.13'),
	(39, 7, 'OUT', '2025-02-10 07:35:10', '2025-02-15 10:27:44', '162.158.163.24', '172.69.165.13'),
	(40, 1, 'OUT', '2025-02-10 07:56:23', '2025-02-19 07:01:36', '162.158.162.91', '162.158.162.162'),
	(41, 1, 'OUT', '2025-02-10 07:57:27', '2025-02-19 07:01:36', '172.69.165.12', '162.158.162.162'),
	(42, 1, 'OUT', '2025-02-10 08:42:22', '2025-02-19 07:01:36', '162.158.162.171', '162.158.162.162'),
	(43, 1, 'OUT', '2025-02-10 09:03:59', '2025-02-19 07:01:36', '162.158.163.133', '162.158.162.162'),
	(44, 1, 'OUT', '2025-02-10 09:04:17', '2025-02-19 07:01:36', '162.158.163.133', '162.158.162.162'),
	(45, 5, 'OUT', '2025-02-10 09:05:01', '2025-02-18 06:28:34', '162.158.163.134', '162.158.163.180'),
	(46, 5, 'OUT', '2025-02-10 09:06:33', '2025-02-18 06:28:34', '162.158.162.171', '162.158.163.180'),
	(47, 6, 'OUT', '2025-02-10 09:09:37', '2025-02-11 09:48:29', '162.158.162.170', '162.158.162.163'),
	(48, 6, 'OUT', '2025-02-10 09:15:43', '2025-02-11 09:48:29', '162.158.162.162', '162.158.162.163'),
	(49, 1, 'OUT', '2025-02-10 09:16:05', '2025-02-19 07:01:36', '162.158.163.134', '162.158.162.162'),
	(50, 3, 'OUT', '2025-02-10 09:16:48', '2025-02-18 05:10:23', '172.69.165.25', '162.158.162.162'),
	(51, 3, 'OUT', '2025-02-10 09:17:34', '2025-02-18 05:10:23', '162.158.162.163', '162.158.162.162'),
	(52, 1, 'OUT', '2025-02-10 09:19:38', '2025-02-19 07:01:36', '162.158.162.162', '162.158.162.162'),
	(53, 3, 'OUT', '2025-02-10 09:20:54', '2025-02-18 05:10:23', '162.158.162.90', '162.158.162.162'),
	(54, 1, 'OUT', '2025-02-10 09:23:15', '2025-02-19 07:01:36', '162.158.162.163', '162.158.162.162'),
	(55, 1, 'OUT', '2025-02-10 09:23:17', '2025-02-19 07:01:36', '162.158.162.163', '162.158.162.162'),
	(56, 5, 'OUT', '2025-02-10 09:24:11', '2025-02-18 06:28:34', '162.158.163.134', '162.158.163.180'),
	(57, 6, 'OUT', '2025-02-10 09:26:28', '2025-02-11 09:48:29', '162.158.162.163', '162.158.162.163'),
	(58, 6, 'OUT', '2025-02-10 09:28:56', '2025-02-11 09:48:29', '162.158.162.162', '162.158.162.163'),
	(59, 5, 'OUT', '2025-02-10 09:30:01', '2025-02-18 06:28:34', '172.69.165.12', '162.158.163.180'),
	(60, 1, 'OUT', '2025-02-10 09:33:57', '2025-02-19 07:01:36', '162.158.163.24', '162.158.162.162'),
	(61, 5, 'OUT', '2025-02-10 09:35:08', '2025-02-18 06:28:34', '162.158.163.133', '162.158.163.180'),
	(62, 1, 'OUT', '2025-02-10 09:38:06', '2025-02-19 07:01:36', '162.158.162.163', '162.158.162.162'),
	(64, 8, 'OUT', '2025-02-10 09:41:17', '2025-02-10 09:58:25', '162.158.162.90', '162.158.163.24'),
	(65, 5, 'OUT', '2025-02-10 09:50:19', '2025-02-18 06:28:34', '162.158.163.134', '162.158.163.180'),
	(66, 8, 'OUT', '2025-02-10 09:55:05', '2025-02-10 09:58:25', '162.158.163.133', '162.158.163.24'),
	(67, 5, 'OUT', '2025-02-10 09:56:44', '2025-02-18 06:28:34', '162.158.163.133', '162.158.163.180'),
	(68, 8, 'OUT', '2025-02-10 09:57:51', '2025-02-10 09:58:25', '162.158.162.90', '162.158.163.24'),
	(69, 6, 'OUT', '2025-02-10 09:58:55', '2025-02-11 09:48:29', '162.158.163.23', '162.158.162.163'),
	(70, 1, 'OUT', '2025-02-10 09:59:12', '2025-02-19 07:01:36', '162.158.162.90', '162.158.162.162'),
	(78, 1, 'OUT', '2025-02-10 10:38:44', '2025-02-19 07:01:36', '162.158.162.163', '162.158.162.162'),
	(71, 4, 'OUT', '2025-02-10 10:10:23', '2025-02-10 10:20:19', '162.158.162.162', '162.158.163.156'),
	(72, 4, 'OUT', '2025-02-10 10:11:09', '2025-02-10 10:20:19', '162.158.162.162', '162.158.163.156'),
	(73, 4, 'OUT', '2025-02-10 10:12:11', '2025-02-10 10:20:19', '172.69.165.12', '162.158.163.156'),
	(74, 1, 'OUT', '2025-02-10 10:13:15', '2025-02-19 07:01:36', '162.158.163.134', '162.158.162.162'),
	(75, 3, 'OUT', '2025-02-10 10:20:39', '2025-02-18 05:10:23', '162.158.163.155', '162.158.162.162'),
	(76, 3, 'OUT', '2025-02-10 10:21:39', '2025-02-18 05:10:23', '172.69.165.12', '162.158.162.162'),
	(77, 5, 'OUT', '2025-02-10 10:35:13', '2025-02-18 06:28:34', '172.69.165.13', '162.158.163.180'),
	(79, 6, 'OUT', '2025-02-11 05:22:06', '2025-02-11 09:48:29', '162.158.162.170', '162.158.162.163'),
	(80, 1, 'OUT', '2025-02-11 05:22:39', '2025-02-19 07:01:36', '162.158.163.155', '162.158.162.162'),
	(81, 1, 'OUT', '2025-02-11 06:29:02', '2025-02-19 07:01:36', '162.158.162.171', '162.158.162.162'),
	(82, 1, 'OUT', '2025-02-11 06:51:43', '2025-02-19 07:01:36', '162.158.163.133', '162.158.162.162'),
	(83, 1, 'OUT', '2025-02-11 07:21:17', '2025-02-19 07:01:36', '162.158.162.171', '162.158.162.162'),
	(84, 1, 'OUT', '2025-02-11 08:24:28', '2025-02-19 07:01:36', '162.158.163.155', '162.158.162.162'),
	(85, 10, 'OUT', '2025-02-11 08:43:29', '2025-02-12 07:45:27', '162.158.162.170', '162.158.163.133'),
	(86, 10, 'OUT', '2025-02-11 08:53:33', '2025-02-12 07:45:27', '172.69.165.12', '162.158.163.133'),
	(87, 6, 'OUT', '2025-02-11 09:47:43', '2025-02-11 09:48:29', '162.158.162.162', '162.158.162.163'),
	(88, 3, 'OUT', '2025-02-11 09:48:48', '2025-02-18 05:10:23', '162.158.162.163', '162.158.162.162'),
	(89, 1, 'OUT', '2025-02-12 05:13:40', '2025-02-19 07:01:36', '162.158.163.133', '162.158.162.162'),
	(90, 10, 'OUT', '2025-02-12 05:52:40', '2025-02-12 07:45:27', '172.69.165.13', '162.158.163.133'),
	(91, 1, 'OUT', '2025-02-12 06:01:32', '2025-02-19 07:01:36', '172.69.165.24', '162.158.162.162'),
	(92, 10, 'OUT', '2025-02-12 06:07:40', '2025-02-12 07:45:27', '172.69.165.12', '162.158.163.133'),
	(93, 9, 'OUT', '2025-02-12 07:10:59', '2025-02-18 06:35:56', '162.158.163.133', '172.69.165.12'),
	(94, 9, 'OUT', '2025-02-12 07:12:12', '2025-02-18 06:35:56', '162.158.163.134', '172.69.165.12'),
	(95, 10, 'OUT', '2025-02-12 07:14:09', '2025-02-12 07:45:27', '172.69.165.12', '162.158.163.133'),
	(96, 1, 'OUT', '2025-02-12 07:45:37', '2025-02-19 07:01:36', '162.158.163.133', '162.158.162.162'),
	(97, 1, 'OUT', '2025-02-12 08:56:53', '2025-02-19 07:01:36', '162.158.163.156', '162.158.162.162'),
	(98, 1, 'OUT', '2025-02-12 11:13:27', '2025-02-19 07:01:36', '162.158.162.170', '162.158.162.162'),
	(99, 1, 'OUT', '2025-02-13 05:08:32', '2025-02-19 07:01:36', '162.158.163.24', '162.158.162.162'),
	(100, 1, 'OUT', '2025-02-13 06:17:37', '2025-02-19 07:01:36', '162.158.163.133', '162.158.162.162'),
	(101, 1, 'OUT', '2025-02-15 05:35:12', '2025-02-19 07:01:36', '162.158.163.156', '162.158.162.162'),
	(102, 1, 'OUT', '2025-02-15 07:34:37', '2025-02-19 07:01:36', '172.69.165.13', '162.158.162.162'),
	(103, 1, 'OUT', '2025-02-15 09:24:45', '2025-02-19 07:01:36', '162.158.163.156', '162.158.162.162'),
	(104, 7, 'OUT', '2025-02-15 09:27:07', '2025-02-15 10:27:44', '172.69.165.12', '172.69.165.13'),
	(105, 7, 'OUT', '2025-02-15 10:12:36', '2025-02-15 10:27:44', '162.158.162.171', '172.69.165.13'),
	(106, 1, 'OUT', '2025-02-15 10:14:57', '2025-02-19 07:01:36', '162.158.162.91', '162.158.162.162'),
	(107, 11, 'OUT', '2025-02-15 10:15:11', '2025-02-15 10:28:12', '172.69.165.13', '172.69.165.13'),
	(108, 11, 'OUT', '2025-02-15 10:16:05', '2025-02-15 10:28:12', '162.158.162.90', '172.69.165.13'),
	(109, 3, 'OUT', '2025-02-15 10:21:15', '2025-02-18 05:10:23', '172.69.165.25', '162.158.162.162'),
	(110, 11, 'OUT', '2025-02-15 10:22:34', '2025-02-15 10:28:12', '162.158.163.156', '172.69.165.13'),
	(111, 11, 'OUT', '2025-02-15 10:28:01', '2025-02-15 10:28:12', '172.69.165.13', '172.69.165.13'),
	(112, 3, 'OUT', '2025-02-15 10:28:31', '2025-02-18 05:10:23', '172.69.165.13', '162.158.162.162'),
	(113, 1, 'OUT', '2025-02-15 11:45:09', '2025-02-19 07:01:36', '162.158.163.23', '162.158.162.162'),
	(114, 7, 'IN', '2025-02-15 12:10:24', NULL, '172.69.165.12', NULL),
	(115, 1, 'OUT', '2025-02-16 11:55:31', '2025-02-19 07:01:36', '172.69.165.35', '162.158.162.162'),
	(116, 1, 'OUT', '2025-02-18 04:46:00', '2025-02-19 07:01:36', '162.158.162.91', '162.158.162.162'),
	(117, 1, 'OUT', '2025-02-18 04:54:02', '2025-02-19 07:01:36', '172.69.165.24', '162.158.162.162'),
	(118, 3, 'OUT', '2025-02-18 05:01:36', '2025-02-18 05:10:23', '162.158.162.163', '162.158.162.162'),
	(119, 1, 'OUT', '2025-02-18 05:06:54', '2025-02-19 07:01:36', '162.158.162.170', '162.158.162.162'),
	(120, 16, 'OUT', '2025-02-18 05:36:37', '2025-02-18 06:07:21', '162.158.163.251', '162.158.162.4'),
	(121, 16, 'OUT', '2025-02-18 05:37:47', '2025-02-18 06:07:21', '162.158.163.115', '162.158.162.4'),
	(122, 5, 'OUT', '2025-02-18 05:50:10', '2025-02-18 06:28:34', '162.158.162.119', '162.158.163.180'),
	(123, 16, 'OUT', '2025-02-18 05:55:31', '2025-02-18 06:07:21', '162.158.163.236', '162.158.162.4'),
	(124, 5, 'OUT', '2025-02-18 05:57:42', '2025-02-18 06:28:34', '162.158.162.209', '162.158.163.180'),
	(125, 1, 'OUT', '2025-02-18 06:02:59', '2025-02-19 07:01:36', '162.158.162.4', '162.158.162.162'),
	(126, 16, 'OUT', '2025-02-18 06:04:23', '2025-02-18 06:07:21', '162.158.162.5', '162.158.162.4'),
	(127, 5, 'OUT', '2025-02-18 06:08:11', '2025-02-18 06:28:34', '162.158.162.5', '162.158.163.180'),
	(128, 16, 'IN', '2025-02-18 06:13:50', NULL, '162.158.162.5', NULL),
	(134, 1, 'OUT', '2025-02-18 10:49:44', '2025-02-19 07:01:36', '162.158.163.250', '162.158.162.162'),
	(133, 1, 'OUT', '2025-02-18 06:36:06', '2025-02-19 07:01:36', '172.69.165.13', '162.158.162.162'),
	(132, 9, 'OUT', '2025-02-18 06:33:10', '2025-02-18 06:35:56', '172.69.165.24', '172.69.165.12'),
	(129, 5, 'OUT', '2025-02-18 06:15:04', '2025-02-18 06:28:34', '162.158.163.236', '162.158.163.180'),
	(130, 5, 'OUT', '2025-02-18 06:24:29', '2025-02-18 06:28:34', '162.158.163.155', '162.158.163.180'),
	(131, 1, 'OUT', '2025-02-18 06:28:48', '2025-02-19 07:01:36', '162.158.163.180', '162.158.162.162'),
	(135, 1, 'OUT', '2025-02-18 12:19:35', '2025-02-19 07:01:36', '162.158.163.156', '162.158.162.162'),
	(136, 1, 'OUT', '2025-02-19 05:25:32', '2025-02-19 07:01:36', '162.158.162.170', '162.158.162.162'),
	(137, 1, 'OUT', '2025-02-19 05:28:48', '2025-02-19 07:01:36', '162.158.163.155', '162.158.162.162'),
	(138, 1, 'OUT', '2025-02-19 07:01:31', '2025-02-19 07:01:36', '162.158.162.162', '162.158.162.162'),
	(139, 1, 'IN', '2025-02-19 07:53:59', NULL, '172.69.165.25', NULL),
	(140, 1, 'IN', '2025-02-19 09:24:36', NULL, '172.69.165.25', NULL),
	(141, 7, 'IN', '2025-02-19 09:59:21', NULL, '172.69.165.13', NULL),
	(142, 1, 'IN', '2025-02-20 12:30:51', NULL, '162.158.162.171', NULL),
	(143, 1, 'IN', '2025-02-21 05:01:26', NULL, '162.158.162.91', NULL);
/*!40000 ALTER TABLE `log_tbl_login` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.log_tbl_task
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.log_tbl_task: ~61 rows (approximately)
INSERT INTO `log_tbl_task` (`log_task_id`, `task_id`, `title`, `fk_task_priority_id`, `fk_task_category_id`, `entry_date`, `due_date`, `description`, `status`, `remark`, `ref_docs`, `has_file`, `created_by`, `created_date`, `created_ipaddress`, `updated_by`, `updated_date`, `updated_ipaddress`, `is_replied`, `log_created_date`) VALUES
	(1, 3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'I', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, NULL, NULL, 'N', '2025-02-04 07:46:47'),
	(2, 2, 'Task1', 1, 1, '2025-02-04', '2025-02-06', 'Task1 Assigned Today', 'I', NULL, NULL, 'N', 1, '2025-02-04 07:40:20', '162.158.163.205', NULL, NULL, NULL, 'N', '2025-02-04 07:48:08'),
	(3, 2, 'Task1', 1, 1, '2025-02-04', '2025-02-10', 'Task1 Assigned Today', 'I', NULL, NULL, 'N', 1, '2025-02-04 07:40:20', '162.158.163.205', 1, '2025-02-04 07:48:08', '162.158.162.79', 'N', '2025-02-04 07:48:27'),
	(4, 1, 'Middleware', 2, 10, '2025-02-04', '2025-02-05', 'dfjkgbs kfsdfk', 'I', NULL, '["2"]', 'Y', 1, '2025-02-04 07:38:16', '162.158.163.206', NULL, NULL, NULL, 'N', '2025-02-04 07:49:53'),
	(5, 1, 'Middleware', 2, 10, '2025-02-04', '2025-02-09', 'dfjkgbs kfsdfk', 'I', NULL, '["2"]', 'Y', 1, '2025-02-04 07:38:16', '162.158.163.206', 1, '2025-02-04 07:49:53', '162.158.163.156', 'N', '2025-02-04 08:09:03'),
	(6, 1, 'Middleware', 2, 10, '2025-02-04', '2025-02-16', 'dfjkgbs kfsdfk', 'I', NULL, '["2"]', 'Y', 1, '2025-02-04 07:38:16', '162.158.163.206', 1, '2025-02-04 08:09:03', '162.158.162.122', 'N', '2025-02-04 08:33:04'),
	(7, 1, 'Middleware', 2, 10, '2025-02-04', '2025-02-16', 'NA', 'I', NULL, '["2"]', 'Y', 1, '2025-02-04 07:38:16', '162.158.163.206', 1, '2025-02-04 08:33:04', '162.158.162.122', 'N', '2025-02-04 09:44:45'),
	(8, 2, 'Task1', 1, 1, '2025-02-04', '2025-02-10', 'Task1 Assigned Today', 'I', NULL, NULL, 'N', 1, '2025-02-04 07:40:20', '162.158.163.205', 1, '2025-02-04 07:48:27', '162.158.162.79', 'N', '2025-02-04 09:45:53'),
	(9, 3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'I', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, '2025-02-04 07:46:47', NULL, 'N', '2025-02-04 09:47:22'),
	(10, 1, 'Middleware', 2, 10, '2025-02-03', '2025-02-04', 'NA', 'I', NULL, '["2"]', 'Y', 1, '2025-02-04 07:38:16', '162.158.163.206', 1, '2025-02-04 09:44:45', '162.158.162.51', 'N', '2025-02-04 11:56:47'),
	(11, 1, 'Middleware', 2, 10, '2025-02-03', '2025-02-04', 'NA', 'I', NULL, '["2"]', 'N', 1, '2025-02-04 07:38:16', '162.158.163.206', 1, '2025-02-04 11:56:47', '162.158.162.51', 'N', '2025-02-04 11:56:55'),
	(12, 7, 'National Animal Health Monitoring System', 2, 3, '2025-02-04', '2025-02-13', 'Developing a digital platform to track and monitor animal diseases, vaccination schedules, and veterinary health records.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:53:39', '162.158.163.179', NULL, NULL, NULL, 'N', '2025-02-04 12:03:34'),
	(13, 9, 'task_06', 1, 5, '2025-02-05', '2025-02-11', 'Carrer growth', 'I', NULL, '["4"]', 'Y', 1, '2025-02-05 05:24:04', '162.158.162.78', NULL, NULL, NULL, 'N', '2025-02-07 07:33:53'),
	(14, 9, 'Task_06', 1, 5, '2025-02-05', '2025-02-11', 'Carrer growth', 'I', NULL, '["4"]', 'Y', 1, '2025-02-05 05:24:04', '162.158.162.78', 1, '2025-02-07 07:33:53', '162.158.162.45', 'N', '2025-02-07 07:34:13'),
	(15, 8, 'Test_05', 1, 1, '2025-02-05', '2025-02-07', 'Any', 'I', NULL, '["5"]', 'Y', 1, '2025-02-05 05:19:30', '162.158.162.79', NULL, NULL, NULL, 'N', '2025-02-07 07:34:28'),
	(16, 10, 'Test 05/02/2025', 1, 9, '2025-02-05', '2025-02-28', 'NA', 'I', NULL, '["3"]', 'N', 1, '2025-02-05 05:29:57', '162.158.162.45', NULL, NULL, NULL, 'N', '2025-02-07 07:36:19'),
	(17, 3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'C', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, '2025-02-04 09:47:22', NULL, 'N', '2025-02-10 08:18:25'),
	(18, 3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'O', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, '2025-02-10 08:18:25', NULL, 'N', '2025-02-10 08:18:49'),
	(22, 3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'O', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, '2025-02-10 08:18:25', NULL, 'N', '2025-02-10 08:41:51'),
	(23, 3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'C', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, '2025-02-10 08:41:51', NULL, 'N', '2025-02-10 08:42:41'),
	(24, 3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'O', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, '2025-02-10 08:42:41', NULL, 'N', '2025-02-10 08:42:57'),
	(25, 5, 'School Infrastructure Monitoring System', 1, 6, '2025-02-04', '2025-02-07', 'Developing a digital portal to track and manage the physical infrastructure of government schools, including classrooms, sanitation, and internet facilities.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:50:14', '162.158.162.44', NULL, NULL, NULL, 'N', '2025-02-10 09:08:21'),
	(26, 9, 'Task 06', 1, 5, '2025-02-05', '2025-02-11', 'Carrer growth', 'I', NULL, '["4"]', 'Y', 1, '2025-02-05 05:24:04', '162.158.162.78', 1, '2025-02-07 07:34:13', '162.158.162.44', 'N', '2025-02-10 09:42:49'),
	(27, 9, 'Task 06', 1, 5, '2025-02-05', '2025-02-11', 'Carrer growth', 'I', NULL, '["4"]', 'Y', 1, '2025-02-05 05:24:04', '162.158.162.78', 1, '2025-02-10 09:42:49', '162.158.162.44', 'N', '2025-02-10 09:45:14'),
	(28, 5, 'School Infrastructure Monitoring System', 1, 6, '2025-02-04', '2025-02-07', 'Developing a digital portal to track and manage the physical infrastructure of government schools, including classrooms, sanitation, and internet facilities.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:50:14', '162.158.162.44', NULL, '2025-02-10 09:08:21', NULL, 'N', '2025-02-10 09:52:14'),
	(29, 9, 'Task 06', 1, 5, '2025-02-05', '2025-02-11', 'Carrer growth', 'I', NULL, '["4"]', 'Y', 1, '2025-02-05 05:24:04', '162.158.162.78', 1, '2025-02-10 09:42:49', '162.158.162.44', 'N', '2025-02-10 09:55:31'),
	(30, 5, 'School Infrastructure Monitoring System', 1, 6, '2025-02-04', '2025-02-07', 'Developing a digital portal to track and manage the physical infrastructure of government schools, including classrooms, sanitation, and internet facilities.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:50:14', '162.158.162.44', NULL, '2025-02-10 09:08:21', NULL, 'N', '2025-02-10 09:59:37'),
	(31, 7, 'National Animal Health Monitoring System', 2, 3, '2025-02-04', '2025-02-13', 'Developing a digital platform to track and monitor animal diseases, vaccination schedules, and veterinary health records.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:53:39', '162.158.163.179', NULL, '2025-02-04 12:03:34', NULL, 'N', '2025-02-10 10:14:25'),
	(32, 7, 'National Animal Health Monitoring System', 2, 3, '2025-02-04', '2025-02-13', 'Developing a digital platform to track and monitor animal diseases, vaccination schedules, and veterinary health records.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:53:39', '162.158.163.179', NULL, '2025-02-04 12:03:34', NULL, 'N', '2025-02-10 10:15:00'),
	(33, 11, 'title-0001', 1, 5, '2025-02-10', '2025-02-12', 'desc..', 'I', NULL, '["3"]', 'N', 1, '2025-02-10 10:20:37', '162.158.162.163', NULL, NULL, NULL, 'N', '2025-02-10 10:24:18'),
	(34, 11, 'title-0001', 1, 5, '2025-02-10', '2025-02-12', 'desc..', 'I', NULL, '["3"]', 'N', 1, '2025-02-10 10:20:37', '162.158.162.163', NULL, '2025-02-10 10:24:18', NULL, 'N', '2025-02-10 10:24:24'),
	(35, 13, 'task34', 2, 3, '2025-02-11', '2025-02-14', 'technical work', 'I', NULL, NULL, 'N', 1, '2025-02-11 10:04:21', '162.158.163.134', NULL, NULL, NULL, 'N', '2025-02-11 10:05:49'),
	(36, 13, 'task34', 2, 3, '2025-02-11', '2025-02-14', 'technical work', 'I', NULL, NULL, 'N', 1, '2025-02-11 10:04:21', '162.158.163.134', NULL, '2025-02-11 10:05:49', NULL, 'N', '2025-02-11 10:06:48'),
	(37, 12, 'ccc', 1, 2, '2025-02-11', '2025-02-11', 'rdtfufu', 'I', NULL, '["6"]', 'N', 1, '2025-02-11 09:35:18', '162.158.163.134', NULL, NULL, NULL, 'N', '2025-02-11 10:36:43'),
	(38, 15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'I', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, NULL, NULL, 'N', '2025-02-15 09:31:29'),
	(39, 15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'I', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, '2025-02-15 09:31:29', NULL, 'N', '2025-02-15 09:35:13'),
	(40, 14, 'Task-12', 2, 2, '2025-02-12', '2025-02-14', 'this is urgent!', 'I', NULL, '["4"]', 'N', 1, '2025-02-12 06:06:27', '162.158.163.24', NULL, NULL, NULL, 'N', '2025-02-15 09:42:13'),
	(41, 14, 'Task-12', 2, 2, '2025-02-12', '2025-02-14', 'this is urgent!', 'I', NULL, '["4"]', 'N', 1, '2025-02-12 06:06:27', '162.158.163.24', NULL, '2025-02-15 09:42:13', NULL, 'N', '2025-02-15 09:42:20'),
	(42, 18, 'TEST', 1, 9, '2025-02-15', '2025-02-16', 'NA', 'I', NULL, '["6"]', 'N', 1, '2025-02-15 10:36:10', '162.158.162.91', NULL, NULL, NULL, 'N', '2025-02-15 10:37:15'),
	(43, 18, 'TEST', 1, 9, '2025-02-15', '2025-02-16', 'NA', 'I', NULL, '["6"]', 'N', 1, '2025-02-15 10:36:10', '162.158.162.91', 1, '2025-02-15 10:37:15', '162.158.163.23', 'N', '2025-02-15 10:38:49'),
	(44, 15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'C', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, '2025-02-15 09:35:13', NULL, 'N', '2025-02-15 12:08:37'),
	(45, 15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'O', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, '2025-02-15 12:08:37', NULL, 'N', '2025-02-15 12:11:54'),
	(46, 15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'O', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, '2025-02-15 12:08:37', NULL, 'N', '2025-02-15 12:12:27'),
	(47, 15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'O', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, '2025-02-15 12:08:37', NULL, 'N', '2025-02-15 12:13:11'),
	(48, 19, 'task18', 2, 2, '2025-02-18', '2025-02-22', 'this is very crutial task', 'I', NULL, NULL, 'Y', 1, '2025-02-18 04:58:55', '162.158.163.133', NULL, NULL, NULL, 'N', '2025-02-18 05:04:49'),
	(49, 19, 'task18', 2, 2, '2025-02-18', '2025-02-22', 'this is very crutial task', 'I', NULL, NULL, 'Y', 1, '2025-02-18 04:58:55', '162.158.163.133', NULL, '2025-02-18 05:04:49', NULL, 'N', '2025-02-18 05:06:26'),
	(50, 20, 'Task_104', 2, 4, '2025-02-17', '2025-02-19', 'Notice by CM', 'I', NULL, NULL, 'N', 1, '2025-02-18 05:31:55', '162.158.162.118', NULL, NULL, NULL, 'N', '2025-02-18 05:39:07'),
	(51, 16, 'task0024', 1, 4, '2025-02-15', '2025-02-25', 'task urgent', 'I', NULL, NULL, 'Y', 1, '2025-02-15 09:38:17', '162.158.162.163', NULL, NULL, NULL, 'N', '2025-02-18 05:53:20'),
	(52, 20, 'Task_104', 2, 4, '2025-02-17', '2025-02-19', 'Notice by CM', 'I', NULL, '["7"]', 'N', 1, '2025-02-18 05:31:55', '162.158.162.118', 1, '2025-02-18 05:39:07', '162.158.163.252', 'N', '2025-02-18 06:05:20'),
	(53, 15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'C', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, '2025-02-15 12:13:11', NULL, 'N', '2025-02-18 06:12:18'),
	(54, 14, 'Task-12', 2, 2, '2025-02-12', '2025-02-14', 'this is urgent!', 'C', NULL, '["4"]', 'N', 1, '2025-02-12 06:06:27', '162.158.163.24', NULL, '2025-02-15 09:42:20', NULL, 'N', '2025-02-18 06:22:29'),
	(55, 14, 'Task-12', 2, 2, '2025-02-12', '2025-02-14', 'this is urgent!', 'O', NULL, '["4"]', 'N', 1, '2025-02-12 06:06:27', '162.158.163.24', NULL, '2025-02-18 06:22:29', NULL, 'N', '2025-02-18 06:23:21'),
	(56, 14, 'Task-12', 2, 2, '2025-02-12', '2025-02-14', 'this is urgent!', 'O', NULL, '["4"]', 'N', 1, '2025-02-12 06:06:27', '162.158.163.24', NULL, '2025-02-18 06:22:29', NULL, 'N', '2025-02-18 06:23:42'),
	(57, 20, 'Task_104', 2, 4, '2025-02-17', '2025-02-19', 'Notice by CM', 'I', NULL, '["7"]', 'N', 1, '2025-02-18 05:31:55', '162.158.162.118', 1, '2025-02-18 06:05:20', '162.158.163.252', 'N', '2025-02-18 06:34:01'),
	(58, 20, 'Task_104', 2, 4, '2025-02-17', '2025-02-19', 'Notice by CM', 'I', NULL, '["7"]', 'N', 1, '2025-02-18 05:31:55', '162.158.162.118', 1, '2025-02-18 06:05:20', '162.158.163.252', 'N', '2025-02-18 06:34:41'),
	(59, 20, 'Task_104', 2, 4, '2025-02-17', '2025-02-19', 'Notice by CM', 'I', NULL, '["7"]', 'N', 1, '2025-02-18 05:31:55', '162.158.162.118', 1, '2025-02-18 06:05:20', '162.158.163.252', 'N', '2025-02-18 06:36:52'),
	(60, 20, 'Task_104', 2, 4, '2025-02-17', '2025-02-19', 'Notice by CM', 'I', NULL, '["7"]', 'N', 1, '2025-02-18 05:31:55', '162.158.162.118', 1, '2025-02-18 06:05:20', '162.158.163.252', 'N', '2025-02-18 06:38:04'),
	(61, 17, '3300TAsk', 1, 5, '2025-02-15', '2025-02-20', 'xyc', 'I', NULL, NULL, 'Y', 1, '2025-02-15 10:19:42', '172.69.165.13', NULL, NULL, NULL, 'N', '2025-02-18 06:43:28'),
	(62, 17, '3300TAsk', 1, 5, '2025-02-15', '2025-02-20', 'xyc', 'I', NULL, NULL, 'Y', 1, '2025-02-15 10:19:42', '172.69.165.13', NULL, '2025-02-18 06:43:28', NULL, 'N', '2025-02-18 06:43:41'),
	(63, 16, 'task0024', 1, 4, '2025-02-15', '2025-02-25', 'task urgent', 'I', NULL, NULL, 'Y', 1, '2025-02-15 09:38:17', '162.158.162.163', NULL, '2025-02-18 05:53:20', NULL, 'N', '2025-02-18 07:27:03'),
	(64, 18, 'TEST', 1, 9, '2025-02-15', '2025-02-16', 'NA', 'I', NULL, '["6"]', 'N', 1, '2025-02-15 10:36:10', '162.158.162.91', 1, '2025-02-15 10:38:49', '162.158.163.23', 'N', '2025-02-18 07:27:55');

-- Dumping structure for table tlmis_testing.log_tbl_task_files_before_delete
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.log_tbl_task_files_before_delete: ~1 rows (approximately)
INSERT INTO `log_tbl_task_files_before_delete` (`log_file_id`, `file_id`, `fk_task_id`, `file`, `file_name`, `file_size`, `log_create_datetime`) VALUES
	(1, 1, 1, 'testing/task_files/top-view-desk-concept-with-coffee_1738654696.jpg', 'top-view-desk-concept-with-coffee.jpg', '2732944', '2025-02-04 11:56:47');

-- Dumping structure for table tlmis_testing.log_tbl_users
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
  `is_password_changed` tinyint(1) DEFAULT NULL,
  `fk_role_id` int DEFAULT NULL,
  `log_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.log_tbl_users: ~44 rows (approximately)
INSERT INTO `log_tbl_users` (`log_id`, `user_id`, `full_name`, `mobile`, `email`, `username`, `password`, `salt`, `district_lgd_code`, `is_active`, `preferences`, `remember_token`, `is_password_changed`, `fk_role_id`, `log_created_date`) VALUES
	(1, 5, 'Operator', '', NULL, 'bs-operator', 'b449ee3a415f6f45d9bd0b3a090bed02aad26270da7102e9f1bdc84033215e3d5e4b7620d5aa8314a61890c517b6fc9556f226d0a438334b8a887e33f0147782', 'S7BAGGT', NULL, 1, NULL, NULL, 1, 3, '2025-02-03 06:46:30'),
	(2, 2, 'Operator', '', NULL, 'bs-operator', 'b449ee3a415f6f45d9bd0b3a090bed02aad26270da7102e9f1bdc84033215e3d5e4b7620d5aa8314a61890c517b6fc9556f226d0a438334b8a887e33f0147782', 'S7BAGGT', NULL, 1, NULL, NULL, 1, 3, '2025-02-03 07:17:30'),
	(3, 1, 'Demo User', '9876543210', 'demo@info.com', 'demouser', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0, '2025-02-03 07:19:44'),
	(4, 1, 'Collector', '9876543210', 'demo@info.com', 'demouser', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0, '2025-02-03 07:19:59'),
	(5, 1, 'Collector', '9876543210', 'demo@info.com', 'distt_balod', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0, '2025-02-03 07:20:17'),
	(6, 1, 'Collector', '9876543210', NULL, 'distt_balod', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0, '2025-02-03 07:22:35'),
	(7, 2, 'Operator', '', NULL, 'bl-operator', 'b449ee3a415f6f45d9bd0b3a090bed02aad26270da7102e9f1bdc84033215e3d5e4b7620d5aa8314a61890c517b6fc9556f226d0a438334b8a887e33f0147782', 'S7BAGGT', NULL, 1, NULL, NULL, 1, 3, '2025-02-03 07:24:35'),
	(8, 1, 'Dist. Balod', '9876543210', NULL, 'distt_balod', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0, '2025-02-03 12:52:13'),
	(9, 1, 'Demo L1', '9876543210', NULL, 'distt_balod', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0, '2025-02-03 12:52:23'),
	(10, 2, 'Operator', '', NULL, 'bl_operator', 'b449ee3a415f6f45d9bd0b3a090bed02aad26270da7102e9f1bdc84033215e3d5e4b7620d5aa8314a61890c517b6fc9556f226d0a438334b8a887e33f0147782', 'S7BAGGT', NULL, 1, NULL, NULL, 1, 3, '2025-02-04 05:15:40'),
	(11, 3, 'DemoUser1', '6978847528', 'demouser1@gmail.com', '', '8776ef2acd0a723f8219503f8b3d3c0582bfdfff146027bcc3e5003920ecd0b9109a127f8ae23707984aa7b5185a297f848dd404eccaf76899be2fb7ad585a4b', 'KY7VsEs', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 07:23:13'),
	(12, 3, 'DemoUser1', '6978847528', 'demouser1@gmail.com', 'TL-test-00003', '8776ef2acd0a723f8219503f8b3d3c0582bfdfff146027bcc3e5003920ecd0b9109a127f8ae23707984aa7b5185a297f848dd404eccaf76899be2fb7ad585a4b', 'KY7VsEs', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 07:25:01'),
	(13, 4, 'DemoUser10', '8888899999', 'demo@gmail.com', '', 'd978f391555d07ef3f81651263f7fef37e1d15b33df5bb18ef137adf34a26a41c593a73074645a2af440eb6732a6faf5657b72c0ae87edffb0ebdc687c8ce548', 'VdUEFdm', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 07:43:41'),
	(14, 4, 'DemoUser10', '8888899999', 'demo@gmail.com', 'TL-test-00004', 'd978f391555d07ef3f81651263f7fef37e1d15b33df5bb18ef137adf34a26a41c593a73074645a2af440eb6732a6faf5657b72c0ae87edffb0ebdc687c8ce548', 'VdUEFdm', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 07:47:00'),
	(15, 4, 'DemoUser10', '8888877777', 'demo@gmail.com', 'TL-test-00004', 'd978f391555d07ef3f81651263f7fef37e1d15b33df5bb18ef137adf34a26a41c593a73074645a2af440eb6732a6faf5657b72c0ae87edffb0ebdc687c8ce548', 'VdUEFdm', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 07:57:29'),
	(16, 3, 'DemoUser1', '6978847987', 'demouser133@gmail.com', 'TL-test-00003', '8776ef2acd0a723f8219503f8b3d3c0582bfdfff146027bcc3e5003920ecd0b9109a127f8ae23707984aa7b5185a297f848dd404eccaf76899be2fb7ad585a4b', 'KY7VsEs', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 11:32:54'),
	(17, 4, 'DemoUser10', '8888877777', NULL, 'TL-test-00004', 'd978f391555d07ef3f81651263f7fef37e1d15b33df5bb18ef137adf34a26a41c593a73074645a2af440eb6732a6faf5657b72c0ae87edffb0ebdc687c8ce548', 'VdUEFdm', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 11:35:30'),
	(18, 4, 'Anil Dubey', '9698471586', 'anildubey2450@gmail.com', 'TL-test-00004', 'd978f391555d07ef3f81651263f7fef37e1d15b33df5bb18ef137adf34a26a41c593a73074645a2af440eb6732a6faf5657b72c0ae87edffb0ebdc687c8ce548', 'VdUEFdm', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 11:35:53'),
	(19, 5, 'Anurag Mishra', '9738447743', 'mishraanu97@gmail.com', '', 'e6f2dd1bd1376f8c4aea97142ca7f228b3d74be7dc322ac5335645c0682963521198082064406df6730831b7aa90d32ed29ee4aae3e3dfee95047b9f2f7a1338', 'EW4XrI8', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 11:36:35'),
	(20, 6, 'Manoj Kumar Sharma', '6261888753', 'manojsharma23@gmail.com', '', '8847e2695f1dbd0ee2fe2e13b251da620f4c0e48a220a7b06e44cf144570c895d99f2488b3f995d2f1d19590b537073a5304ec67e432293f66a0356f309f34a5', 'IBp9d5w', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 11:40:30'),
	(21, 7, 'Mrinalika Singh', '7998998998', NULL, '', '22b0ff3662d6146a5068e871e206e576596b5f1e174d886abc367019e980344350dfef212faa401495c4c699f76a6136b98d5ff150e32812b171e1a7a4225078', 'nxAOaEM', NULL, 1, NULL, NULL, 0, 0, '2025-02-04 17:53:15'),
	(22, 1, 'Demo L1', '9876543210', NULL, 'test_L1', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0, '2025-02-07 11:23:42'),
	(23, 7, 'Mrinalika Singh', '7998998998', NULL, 'TL-test-00007', '22b0ff3662d6146a5068e871e206e576596b5f1e174d886abc367019e980344350dfef212faa401495c4c699f76a6136b98d5ff150e32812b171e1a7a4225078', 'nxAOaEM', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 07:34:39'),
	(24, 5, 'Anurag Mishra', '9738447743', 'mishraanu97@gmail.com', 'TL-test-00005', 'e6f2dd1bd1376f8c4aea97142ca7f228b3d74be7dc322ac5335645c0682963521198082064406df6730831b7aa90d32ed29ee4aae3e3dfee95047b9f2f7a1338', 'EW4XrI8', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 09:06:15'),
	(25, 6, 'Manoj Kumar Sharma', '6261888753', 'manojsharma23@gmail.com', 'TL-test-00006', '8847e2695f1dbd0ee2fe2e13b251da620f4c0e48a220a7b06e44cf144570c895d99f2488b3f995d2f1d19590b537073a5304ec67e432293f66a0356f309f34a5', 'IBp9d5w', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 09:14:35'),
	(26, 8, 'karan singh', '8822992273', 'karan@gmail.com', '', '5fbea22d465921ae6c02b3c8073b1650d9811278710f3b28d6393f904386bb920649a7c9b27111ad18448f6a50194705e46bdc55f0badb1c42046d534f12d991', 'gPGF70c', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 09:31:03'),
	(27, 8, 'karan singh', '8822992273', 'karan@gmail.com', 'TL-test-00008', '5fbea22d465921ae6c02b3c8073b1650d9811278710f3b28d6393f904386bb920649a7c9b27111ad18448f6a50194705e46bdc55f0badb1c42046d534f12d991', 'gPGF70c', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 09:40:59'),
	(28, 4, 'Aniket Dubey', '9698471586', 'aniketdubey2450@gmail.com', 'TL-test-00004', 'd978f391555d07ef3f81651263f7fef37e1d15b33df5bb18ef137adf34a26a41c593a73074645a2af440eb6732a6faf5657b72c0ae87edffb0ebdc687c8ce548', 'VdUEFdm', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 10:11:50'),
	(29, 3, 'Sakshi Verma', '9698554713', 'sakshiverma123@gmail.com', 'TL-test-00003', '8776ef2acd0a723f8219503f8b3d3c0582bfdfff146027bcc3e5003920ecd0b9109a127f8ae23707984aa7b5185a297f848dd404eccaf76899be2fb7ad585a4b', 'KY7VsEs', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 10:21:12'),
	(30, 9, 'Nidhi Dubey', '6268947830', 'nidhi@gmail.com', '', '7629e1e4d218f33de35f8db2e466fa756a0c6527f3c4eeb3328229fd9a26781d08fcc8fb48d5ffc664965e1e2be54af9cfd61d84e1014054cb448de757fd40d5', '4ilno0C', NULL, 1, NULL, NULL, 0, 0, '2025-02-10 10:33:50'),
	(31, 6, 'Manoj Kumar Sharma', '6261888753', 'manojsharma23@gmail.com', 'TL-test-00006', 'e25b64da880abd5abfce5053038c03fb6aa8a1ed2b6baf5b1cff202f123fa177dae397610eb62a938242086fa17d07741a329e41b561591734351ca95f9a5a5f', 'DjdXL3C', NULL, 1, NULL, NULL, 1, 0, '2025-02-11 05:22:06'),
	(32, 10, 'Deepesh', '6261920444', 'deepeshhial@gmail.com', '', 'c06f82cfda3d372f925cbeb1da81a7722dac0d61bccc04fc8c415c4ab0c524f10a91d2ff17a94781e1892b61d9216ca64e76d6d3d9421b2f0a9a3ff7ce74e831', 'NxeZYVG', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 08:25:10'),
	(33, 10, 'Deepesh', '6261920444', 'deepeshhial@gmail.com', 'TL-test-00010', 'c06f82cfda3d372f925cbeb1da81a7722dac0d61bccc04fc8c415c4ab0c524f10a91d2ff17a94781e1892b61d9216ca64e76d6d3d9421b2f0a9a3ff7ce74e831', 'NxeZYVG', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 08:37:36'),
	(34, 10, 'Deepesh', '6261920444', 'deepesh@gmail.com', 'TL-test-00010', 'c06f82cfda3d372f925cbeb1da81a7722dac0d61bccc04fc8c415c4ab0c524f10a91d2ff17a94781e1892b61d9216ca64e76d6d3d9421b2f0a9a3ff7ce74e831', 'NxeZYVG', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 08:46:47'),
	(35, 10, 'Deepesh', '6261920444', 'deepesh@gmail.com', 'TL-test-00010', '7d352cc206c490f3b91fde23b95a91c6f37c970b3b1b3d710e57d319dba1e159a165bcf993a2aca793b295e8429ca0ff95794e8a7dfebe807ba6d4bedbfa08df', 'dGozRYL', NULL, 1, NULL, NULL, 1, 0, '2025-02-11 08:53:33'),
	(36, 11, 'sonu', '8893729472', 'sonu88937@gmail.com', '', 'b298caad7ffde4572d5511aa327978256e49996356413e1a4c1dfbff93e86ed068a2ff7cdfaa9ee3c13006a9d41f2f85414ce1f031950f756aeda682559317ba', 'gTTsArl', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 10:10:35'),
	(37, 12, 'Ritik babu', '9273927484', 'ritik9273@gmal.com', '', '94cd69220dd59273ed6307a5537b572aeea31ecbbd324a542f81c07b2916227e8c55263b6603295098c093003373930677012f6674f77cae23b0831aaf15efb1', 'YYjZ3xB', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 10:11:52'),
	(38, 13, 'Sohan manikpuri', '6238374478', 'sohan6238@g.com', '', '48df8f21ca44e51afc88911f3ee4e532de4acb0648a8737f2fb2b1b86014c391d8c636a621f837808ca88a1bdd4bea0e0b417391f355dcdcaf88049f19bb5c96', 'zvD4m5V', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 10:14:25'),
	(39, 14, 'Mohit Kurre', '8923847430', 'mohit8923@gmail.com', '', '4c2b3cad3e243efb23c229e524ca18a4705bc3a7a562b75e3d42e2413d9c1b6c76ebdbf9bb2da712d3432c7528f355fb70e686893f9e507fcec00d4919761c26', 'A4u7Tai', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 10:16:48'),
	(40, 15, 'Rajiv mahant', '8743923794', 'rajiv8743@gmail.com', '', '1bdad3ea757ecc4a07f467b00782a16f808bd0be7bb243ceea05c15344d71b17de6611becb11188ecabe33a953a1b4e5e0abafcc4d3c36f03ff2ade8e9299dcb', '221Emfd', NULL, 1, NULL, NULL, 0, 0, '2025-02-11 10:19:28'),
	(41, 9, 'Nidhi Dubey', '6268947830', 'nidhi@gmail.com', 'TL-test-00009', '7629e1e4d218f33de35f8db2e466fa756a0c6527f3c4eeb3328229fd9a26781d08fcc8fb48d5ffc664965e1e2be54af9cfd61d84e1014054cb448de757fd40d5', '4ilno0C', NULL, 1, NULL, NULL, 0, 0, '2025-02-12 07:11:54'),
	(42, 11, 'sonu', '8893729472', 'sonu88937@gmail.com', 'TL-test-00011', 'b298caad7ffde4572d5511aa327978256e49996356413e1a4c1dfbff93e86ed068a2ff7cdfaa9ee3c13006a9d41f2f85414ce1f031950f756aeda682559317ba', 'gTTsArl', NULL, 1, NULL, NULL, 0, 0, '2025-02-15 10:15:47'),
	(43, 16, 'Manoj Sahu', '9876543210', 'sahu23@gmail.com', '', '2ab376c093bd5511107f5f6ef5b376cc136ebbeae540acd42f01346beef43605f64f4b351baae11620548d8ebeb79b5034660c279f24cbb49629949a33ea0e31', 'WI0UJ6U', NULL, 1, NULL, NULL, 0, 0, '2025-02-18 05:16:01'),
	(44, 16, 'Manoj Sahu', '9876543210', 'sahu23@gmail.com', 'TL-test-00016', '2ab376c093bd5511107f5f6ef5b376cc136ebbeae540acd42f01346beef43605f64f4b351baae11620548d8ebeb79b5034660c279f24cbb49629949a33ea0e31', 'WI0UJ6U', NULL, 1, NULL, NULL, 0, 0, '2025-02-18 05:37:20');

-- Dumping structure for table tlmis_testing.log_tbl_user_map_before_delete
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.log_tbl_user_map_before_delete: ~8 rows (approximately)
INSERT INTO `log_tbl_user_map_before_delete` (`log_id`, `user_map_id`, `fk_user_id`, `fk_level_id`, `fk_department_id`, `fk_designation_id`, `remark`, `is_active`, `create_by`, `update_by`, `create_datetime`, `update_datetime`, `create_ipaddress`, `update_ipaddress`, `log_create_datetime`) VALUES
	(1, 4, 2, 2, 3, 16, NULL, 0, 1, NULL, '2025-01-22 12:07:59', '2025-01-22 12:10:34', '162.158.16', NULL, '2025-02-03 06:45:56'),
	(2, 3, 3, 2, 1, 17, NULL, 1, 1, NULL, '2025-01-22 12:03:25', NULL, '172.69.165', NULL, '2025-02-03 06:45:56'),
	(3, 5, 2, 2, 2, 16, NULL, 1, 1, NULL, '2025-01-22 12:10:34', NULL, '172.69.165', NULL, '2025-02-03 06:45:56'),
	(4, 6, 2, 2, 1, 16, NULL, 1, 1, NULL, '2025-01-23 10:16:39', NULL, '162.158.16', NULL, '2025-02-03 06:45:56'),
	(5, 7, 2, 2, 3, 16, NULL, 1, 1, NULL, '2025-01-23 10:16:39', NULL, '162.158.16', NULL, '2025-02-03 06:45:56'),
	(6, 8, 2, 2, 4, 16, NULL, 1, 1, NULL, '2025-01-23 10:16:39', NULL, '162.158.16', NULL, '2025-02-03 06:45:56'),
	(7, 9, 4, 2, 13, 20, NULL, 1, 1, NULL, '2025-01-23 11:11:13', NULL, '162.158.16', NULL, '2025-02-03 06:45:56'),
	(8, 5, 4, 2, 2, 1, NULL, 1, 1, NULL, '2025-02-04 08:06:47', NULL, '162.158.16', NULL, '2025-02-04 09:41:24');

-- Dumping structure for table tlmis_testing.log_users
DROP TABLE IF EXISTS `log_users`;
CREATE TABLE IF NOT EXISTS `log_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT (now()),
  `create_by` int DEFAULT NULL,
  `create_ip` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`fk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table tlmis_testing.log_users: ~84 rows (approximately)
INSERT INTO `log_users` (`id`, `fk_user_id`, `fullname`, `mobile_no`, `email`, `designation`, `section_id`, `create_date`, `create_by`, `create_ip`) VALUES
	(1, 3, NULL, NULL, NULL, 'सेक्शन अधिकारी 01', 2, '2024-12-06 17:54:10', 1, '127.0.0.1'),
	(2, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-06 19:51:30', 1, '162.158.170.122'),
	(3, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-06 19:52:23', 1, '162.158.170.122'),
	(4, 6, NULL, NULL, NULL, NULL, NULL, '2024-12-06 19:52:37', 1, '172.70.188.34'),
	(5, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-09 05:53:10', 1, '162.158.170.122'),
	(6, 1, NULL, NULL, NULL, NULL, NULL, '2024-12-16 04:38:44', 1, '127.0.0.1'),
	(7, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-16 04:38:49', 1, '127.0.0.1'),
	(8, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-16 04:39:00', 1, '127.0.0.1'),
	(9, 3, NULL, NULL, NULL, NULL, NULL, '2024-12-16 04:39:04', 1, '127.0.0.1'),
	(10, 1, 'डॉ. रवि मित्तल (IAS)', NULL, NULL, 'संचालक', NULL, '2024-12-16 04:39:52', 1, '127.0.0.1'),
	(11, 3, NULL, NULL, NULL, NULL, NULL, '2024-12-16 04:40:31', 1, '127.0.0.1'),
	(12, 1, NULL, NULL, NULL, NULL, NULL, '2024-12-16 04:40:44', 1, '127.0.0.1'),
	(13, 1, NULL, '7415303000', NULL, NULL, NULL, '2024-12-16 04:41:13', 1, '127.0.0.1'),
	(14, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-16 05:11:44', 1, '127.0.0.1'),
	(15, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-16 05:12:14', 1, '127.0.0.1'),
	(16, 2, 'टेस्ट अनुभाग अधिकारी', NULL, NULL, 'सेक्शन अधिकारी', NULL, '2024-12-16 05:12:25', 1, '127.0.0.1'),
	(17, 2, NULL, NULL, NULL, 'Admin', NULL, '2024-12-16 05:12:35', 1, '127.0.0.1'),
	(18, 2, NULL, NULL, NULL, NULL, 1, '2024-12-16 05:14:36', 1, '127.0.0.1'),
	(19, 2, 'Admin', NULL, NULL, NULL, NULL, '2024-12-19 08:45:44', 1, '127.0.0.1'),
	(20, 2, NULL, NULL, NULL, 'WCD Admin', NULL, '2024-12-19 08:45:52', 1, '127.0.0.1'),
	(21, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:45:58', 1, '127.0.0.1'),
	(22, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:46:01', 1, '127.0.0.1'),
	(23, 4, 'उप सचिव', NULL, NULL, NULL, NULL, '2024-12-19 08:46:53', 1, '127.0.0.1'),
	(24, 4, NULL, NULL, NULL, 'Dep Secretary', NULL, '2024-12-19 08:46:57', 1, '127.0.0.1'),
	(25, 7, 'उप सचिव', NULL, NULL, NULL, NULL, '2024-12-19 08:47:17', 1, '127.0.0.1'),
	(26, 7, NULL, NULL, NULL, 'Dep Secretary', NULL, '2024-12-19 08:47:25', 1, '127.0.0.1'),
	(27, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:47:40', 1, '127.0.0.1'),
	(28, 2, 'उप सचिव', NULL, NULL, NULL, NULL, '2024-12-19 08:47:44', 1, '127.0.0.1'),
	(29, 2, NULL, NULL, NULL, 'Dep Secretary', NULL, '2024-12-19 08:47:47', 1, '127.0.0.1'),
	(30, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:47:52', 1, '127.0.0.1'),
	(31, 6, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:47:58', 1, '127.0.0.1'),
	(32, 7, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:48:05', 1, '127.0.0.1'),
	(33, 6, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:48:08', 1, '127.0.0.1'),
	(34, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:48:12', 1, '127.0.0.1'),
	(35, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:48:14', 1, '127.0.0.1'),
	(36, 6, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:48:16', 1, '127.0.0.1'),
	(37, 7, NULL, NULL, NULL, NULL, NULL, '2024-12-19 08:48:18', 1, '127.0.0.1'),
	(38, 5, 'संयुक्त सचिव', NULL, NULL, NULL, NULL, '2024-12-19 08:48:53', 1, '127.0.0.1'),
	(39, 5, NULL, NULL, NULL, 'Joint Secretary', NULL, '2024-12-19 08:49:02', 1, '127.0.0.1'),
	(40, 9, NULL, NULL, NULL, 'Section Officer', NULL, '2024-12-19 08:55:52', 1, '127.0.0.1'),
	(41, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:40:13', 1, '127.0.0.1'),
	(42, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:40:20', 1, '127.0.0.1'),
	(43, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:40:23', 1, '127.0.0.1'),
	(44, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:43:27', 1, '127.0.0.1'),
	(45, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:44:26', 1, '127.0.0.1'),
	(46, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:44:30', 1, '127.0.0.1'),
	(47, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:48:20', 1, '127.0.0.1'),
	(48, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:48:45', 1, '127.0.0.1'),
	(49, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-19 16:48:49', 1, '127.0.0.1'),
	(50, 2, NULL, NULL, NULL, NULL, 3, '2024-12-20 04:01:26', 1, '127.0.0.1'),
	(51, 4, NULL, NULL, NULL, NULL, 3, '2024-12-20 04:01:28', 1, '127.0.0.1'),
	(52, 4, NULL, NULL, NULL, NULL, 1, '2024-12-20 04:04:30', 1, '127.0.0.1'),
	(53, 2, 'जन्मेजय महोबे', NULL, NULL, NULL, NULL, '2024-12-20 04:15:26', 1, '127.0.0.1'),
	(54, 8, NULL, NULL, NULL, NULL, NULL, '2024-12-20 04:17:28', 1, '127.0.0.1'),
	(55, 2, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:45:30', 1, '127.0.0.1'),
	(56, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:45:53', 1, '127.0.0.1'),
	(57, 5, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:45:54', 1, '127.0.0.1'),
	(58, 6, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:45:56', 1, '127.0.0.1'),
	(59, 7, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:45:58', 1, '127.0.0.1'),
	(60, 8, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:45:59', 1, '127.0.0.1'),
	(61, 9, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:01', 1, '127.0.0.1'),
	(62, 10, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:02', 1, '127.0.0.1'),
	(63, 11, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:04', 1, '127.0.0.1'),
	(64, 4, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:08', 1, '127.0.0.1'),
	(65, 5, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:09', 1, '127.0.0.1'),
	(66, 6, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:11', 1, '127.0.0.1'),
	(67, 7, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:12', 1, '127.0.0.1'),
	(68, 8, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:14', 1, '127.0.0.1'),
	(69, 9, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:15', 1, '127.0.0.1'),
	(70, 10, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:16', 1, '127.0.0.1'),
	(71, 11, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:17', 1, '127.0.0.1'),
	(72, 1, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:24', 1, '127.0.0.1'),
	(73, 1, NULL, NULL, NULL, NULL, NULL, '2024-12-20 05:46:27', 1, '127.0.0.1'),
	(74, 5, NULL, NULL, NULL, NULL, NULL, '2024-12-20 06:06:25', 1, '127.0.0.1'),
	(75, 1, NULL, NULL, NULL, NULL, NULL, '2025-01-01 05:49:40', 1, '127.0.0.1'),
	(76, 1, NULL, NULL, NULL, NULL, NULL, '2025-01-01 05:50:16', 1, '127.0.0.1'),
	(77, 2, NULL, NULL, NULL, NULL, NULL, '2025-01-01 05:52:29', 1, '127.0.0.1'),
	(78, 2, NULL, NULL, NULL, NULL, NULL, '2025-01-01 05:53:04', 1, '127.0.0.1'),
	(79, 2, NULL, NULL, NULL, NULL, NULL, '2025-01-01 07:27:41', 1, '127.0.0.1'),
	(80, 2, NULL, NULL, NULL, NULL, NULL, '2025-01-01 07:28:11', 1, '127.0.0.1'),
	(81, 9, NULL, NULL, NULL, NULL, NULL, '2025-01-01 07:55:12', 1, '127.0.0.1'),
	(82, 9, NULL, NULL, NULL, NULL, NULL, '2025-01-01 07:56:13', 1, '127.0.0.1'),
	(83, 7, NULL, NULL, NULL, NULL, NULL, '2025-01-02 05:13:15', 1, '127.0.0.1'),
	(84, 7, NULL, NULL, NULL, NULL, NULL, '2025-01-02 05:13:55', 1, '127.0.0.1');

-- Dumping structure for table tlmis_testing.master_department
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.master_department: ~43 rows (approximately)
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
	(41, 'संसदीय कार्य', 'Parliamentary Affairs', 9, 1, 0, NULL, '2025-01-17 15:57:49', '2025-01-22 12:13:26', NULL, NULL),
	(43, 'लोक निर्माण विभाग', 'Public Welfare Department', 9, 1, 1, NULL, '2025-02-10 10:54:44', NULL, '162.158.163.134', NULL),
	(44, 'लोक निर्माण विभाग', 'Public Welfare Department', 8, 1, 1, 1, '2025-02-10 10:56:30', '2025-02-18 06:59:14', '162.158.163.133', '162.158.163.134');

-- Dumping structure for table tlmis_testing.master_designation
DROP TABLE IF EXISTS `master_designation`;
CREATE TABLE IF NOT EXISTS `master_designation` (
  `designation_id` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`designation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.master_designation: ~25 rows (approximately)
INSERT INTO `master_designation` (`designation_id`, `designation`, `is_active`) VALUES
	(1, 'Collector', 1),
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
	(15, 'Test Designation', 1),
	(16, 'Demo L2', 1),
	(17, 'Demo l3', 1),
	(18, 'JD', 1),
	(19, 'Joint Director', 1),
	(21, 'Sachiv', 1),
	(22, 'Secretary', 1),
	(23, 'Tehsildar', 1),
	(24, 'Deupty Director', 1),
	(25, 'Dept. Secratory', 1),
	(26, 'Tahsildar', 1);

-- Dumping structure for table tlmis_testing.master_district
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

-- Dumping data for table tlmis_testing.master_district: ~33 rows (approximately)
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

-- Dumping structure for table tlmis_testing.master_doc_types
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.master_doc_types: ~17 rows (approximately)
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
	(16, 'ग्रीन नोटशीट', 'Green Notesheet', 1, 1, NULL, '2025-01-14 14:02:25', '2025-01-14 14:02:25', '172.69.165.45', NULL),
	(17, 'स्वीकृति पत्र', 'Acceptance letter', 0, 1, 1, '2025-02-04 15:00:14', '2025-02-10 13:32:09', '162.158.162.51', '162.158.162.162'),
	(18, 'स्वीकृति पत्र', 'Acceptance letter', 0, 1, 1, '2025-02-10 13:32:42', '2025-02-10 13:33:00', '162.158.162.163', '162.158.162.163'),
	(19, 'स्वीकृति पत्र', 'Acceptance letter', 1, 1, NULL, '2025-02-10 13:33:01', '2025-02-10 13:33:01', '162.158.162.163', NULL),
	(20, 'स्वीकृति पत्र', 'Acceptance letter', 1, 1, NULL, '2025-02-10 16:27:42', '2025-02-10 16:27:42', '162.158.163.133', NULL);

-- Dumping structure for table tlmis_testing.master_issuers
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.master_issuers: ~19 rows (approximately)
INSERT INTO `master_issuers` (`id`, `name`, `issuer_type_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(1, 'State Govt', 9, 1, 2, 0, '2025-01-12 01:47:27', '2025-01-12 01:47:27', '162.158.162.77', ''),
	(2, 'विशेष  कर्तव्यस्थ अधिकारी', 9, 1, 1, 0, '2025-01-14 14:40:12', '2025-01-14 14:40:12', '162.158.163.189', ''),
	(3, 'test', 8, 1, 1, 0, '2025-01-15 15:46:11', '2025-01-15 15:46:11', '162.158.162.69', ''),
	(4, 'Central Issuer', 8, 1, 1, 0, '2025-01-17 07:12:46', '2025-01-17 07:12:46', '127.0.0.1', ''),
	(5, 'Vishnu', 9, 1, 1, 0, '2025-01-22 17:47:16', '2025-01-22 17:47:16', '162.158.162.15', ''),
	(6, 'xyz', 10, 1, 1, 0, '2025-01-22 17:51:38', '2025-01-22 17:51:38', '172.69.165.77', ''),
	(7, 'AO', 8, 1, 1, 0, '2025-01-23 16:02:04', '2025-01-23 16:02:04', '162.158.163.179', ''),
	(8, 'jay', 9, 1, 1, 0, '2025-01-23 16:38:21', '2025-01-23 16:38:21', '162.158.163.180', ''),
	(9, 'Vaibhav', 8, 1, 1, 0, '2025-01-23 16:48:31', '2025-01-23 16:48:31', '162.158.163.179', ''),
	(10, 'Karan', 9, 1, 1, 0, '2025-02-04 10:41:56', '2025-02-04 10:41:56', '162.158.163.180', ''),
	(11, 'UserDemo', 14, 1, 1, 0, '2025-02-04 11:09:31', '2025-02-04 11:09:31', '162.158.163.180', ''),
	(12, 'DemoUser1', 14, 1, 1, 0, '2025-02-04 13:03:00', '2025-02-04 13:03:00', '172.69.165.74', ''),
	(13, 'Abhishek Tripathi', 14, 1, 1, 0, '2025-02-04 17:13:01', '2025-02-04 17:13:01', '162.158.163.180', ''),
	(14, 'Hari Shanker', 8, 1, 1, 0, '2025-02-04 17:19:10', '2025-02-04 17:19:10', '162.158.163.180', ''),
	(15, 'Sunil Soni', 9, 1, 1, 0, '2025-02-04 17:20:59', '2025-02-04 17:20:59', '162.158.163.180', ''),
	(16, 'Aatma Ram', 9, 1, 1, 0, '2025-02-04 17:23:08', '2025-02-04 17:23:08', '162.158.162.50', ''),
	(17, 'ccc', 8, 1, 1, 0, '2025-02-11 15:03:18', '2025-02-11 15:03:18', '172.69.165.13', ''),
	(18, 'Deepesh', 8, 1, 1, 0, '2025-02-11 15:03:56', '2025-02-11 15:03:56', '172.69.165.13', ''),
	(19, 'Manoj Saay', 9, 1, 1, 0, '2025-02-18 10:57:03', '2025-02-18 10:57:03', '162.158.163.252', '');

-- Dumping structure for table tlmis_testing.master_issuer_types
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.master_issuer_types: ~9 rows (approximately)
INSERT INTO `master_issuer_types` (`id`, `name_hi`, `name_en`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(8, 'केंद्र शासन', 'Central Govt.', 1, 2, NULL, '2024-12-31 03:22:44', '2025-01-11 20:15:34', '127.0.0.1', NULL),
	(9, 'राज्य सरकार', 'State Govt.', 1, 2, NULL, '2024-12-31 03:23:02', '2025-01-11 20:13:46', '127.0.0.1', NULL),
	(10, 'जिला कार्यालय', 'District Office', 1, 2, NULL, '2024-12-31 03:23:45', '2025-01-11 20:13:53', '127.0.0.1', NULL),
	(14, 'प्रबंध-विभाग', 'Diractorate', 1, 1, 1, '2025-01-14 14:06:18', '2025-02-04 15:06:56', '162.158.163.93', '172.69.165.74'),
	(15, 'कॉर्पोरेट जारीकर्ता', 'Corporate Issuers', 0, 1, 1, '2025-02-04 15:03:07', '2025-02-04 15:03:25', '162.158.163.206', '162.158.163.206'),
	(16, 'कॉर्पोरेट जारीकर्ता', 'Corporate Issuers', 1, 1, NULL, '2025-02-04 15:07:31', '2025-02-04 15:07:31', '162.158.163.179', NULL),
	(17, 'प्रबंध-विभाग', 'Diractorate', 1, 1, NULL, '2025-02-10 16:14:49', '2025-02-10 16:14:49', '172.69.165.12', NULL),
	(18, 'प्रबंध-विभाग', 'Diractorate', 0, 1, 1, '2025-02-11 12:23:25', '2025-02-18 12:49:32', '172.69.165.13', '162.158.163.24'),
	(19, 'प्रबंध-विभाग', 'Diractorate', 0, 1, 1, '2025-02-11 12:26:01', '2025-02-11 12:31:56', '162.158.162.171', '162.158.162.171');

-- Dumping structure for table tlmis_testing.master_letter_prati
DROP TABLE IF EXISTS `master_letter_prati`;
CREATE TABLE IF NOT EXISTS `master_letter_prati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.master_letter_prati: 0 rows
/*!40000 ALTER TABLE `master_letter_prati` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_letter_prati` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.master_level
DROP TABLE IF EXISTS `master_level`;
CREATE TABLE IF NOT EXISTS `master_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.master_level: ~5 rows (approximately)
INSERT INTO `master_level` (`level_id`, `level`, `remark`, `is_active`) VALUES
	(1, 'Level 1', NULL, 1),
	(2, 'Level 2', NULL, 1),
	(3, 'Level 3', NULL, 1),
	(4, 'Level 4', NULL, 1),
	(5, 'Level 5', NULL, 1);

-- Dumping structure for table tlmis_testing.master_priority
DROP TABLE IF EXISTS `master_priority`;
CREATE TABLE IF NOT EXISTS `master_priority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `priority_detail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.master_priority: ~3 rows (approximately)
INSERT INTO `master_priority` (`id`, `priority_detail`) VALUES
	(1, 'उच्च प्राथमिकता'),
	(2, 'मध्यम प्राथमिकता'),
	(3, 'सामान्य');

-- Dumping structure for table tlmis_testing.master_role
DROP TABLE IF EXISTS `master_role`;
CREATE TABLE IF NOT EXISTS `master_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.master_role: ~3 rows (approximately)
INSERT INTO `master_role` (`role_id`, `role`, `remark`, `is_active`) VALUES
	(1, 'Super Admin', NULL, 1),
	(2, 'Admin', NULL, 1),
	(3, 'Operator', NULL, 1);

-- Dumping structure for table tlmis_testing.master_roles
DROP TABLE IF EXISTS `master_roles`;
CREATE TABLE IF NOT EXISTS `master_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table tlmis_testing.master_roles: ~3 rows (approximately)
INSERT INTO `master_roles` (`id`, `role_name`, `role_code`, `level`) VALUES
	(1, 'Admin', 'SEC', 'State'),
	(2, 'Section', 'SO', 'State'),
	(3, 'DIR', 'DIR', 'State');

-- Dumping structure for table tlmis_testing.master_sambhag
DROP TABLE IF EXISTS `master_sambhag`;
CREATE TABLE IF NOT EXISTS `master_sambhag` (
  `sambhag_id` int NOT NULL AUTO_INCREMENT,
  `sambhag_name_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sambhag_name_hin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sambhag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.master_sambhag: ~5 rows (approximately)
INSERT INTO `master_sambhag` (`sambhag_id`, `sambhag_name_eng`, `sambhag_name_hin`) VALUES
	(1, 'Raipur', 'रायपुर'),
	(2, 'Durg', 'दुर्ग'),
	(3, 'Bilaspur', 'बिलासपुर'),
	(4, 'Sarguja', 'सरगुजा'),
	(5, 'Bastar', 'बस्तर');

-- Dumping structure for table tlmis_testing.master_section
DROP TABLE IF EXISTS `master_section`;
CREATE TABLE IF NOT EXISTS `master_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.master_section: ~11 rows (approximately)
INSERT INTO `master_section` (`id`, `section_name`) VALUES
	(1, 'संचालनालय'),
	(2, 'मंत्रालय'),
	(3, 'मिशन शक्ति'),
	(4, 'मिशन वात्सल्य'),
	(5, 'स्थापना'),
	(6, 'महतारी वंदन योजना'),
	(7, 'आई. सी. डी. एस.'),
	(8, 'महिला सशक्तिकरण'),
	(9, 'भवन निर्माण'),
	(10, 'सूचना प्रौद्योगिकी'),
	(11, 'प्रशिक्षण');

-- Dumping structure for table tlmis_testing.master_signatory
DROP TABLE IF EXISTS `master_signatory`;
CREATE TABLE IF NOT EXISTS `master_signatory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signatory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.master_signatory: 4 rows
/*!40000 ALTER TABLE `master_signatory` DISABLE KEYS */;
INSERT INTO `master_signatory` (`id`, `signatory`) VALUES
	(1, 'संचालक'),
	(2, 'संयुक्त संचालक'),
	(3, 'उप संचालक'),
	(4, 'सचिव');
/*!40000 ALTER TABLE `master_signatory` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.master_signatory_officer
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.master_signatory_officer: 12 rows
/*!40000 ALTER TABLE `master_signatory_officer` DISABLE KEYS */;
INSERT INTO `master_signatory_officer` (`id`, `signatory_id`, `officer_name`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
	(1, 4, 'Nikita', 'Y', '2025-02-04 14:56:21', 1, '2025-02-10 16:30:47', 1),
	(2, 4, 'khuman', 'N', '2025-02-04 14:56:33', 1, '2025-02-18 10:37:05', 1),
	(3, 4, 'खुमान', NULL, '2025-02-04 14:56:55', 1, NULL, NULL),
	(4, 4, 'khuman', NULL, '2025-02-04 14:57:51', 1, NULL, NULL),
	(5, 4, 'अभिषेक त्रिपाठी', NULL, '2025-02-04 14:58:36', 1, NULL, NULL),
	(6, 2, 'Jonson', NULL, '2025-02-04 15:23:22', 1, NULL, NULL),
	(7, 2, 'David', NULL, '2025-02-04 15:24:43', 1, NULL, NULL),
	(8, 2, 'David2', NULL, '2025-02-04 15:25:21', 1, NULL, NULL),
	(9, 2, 'Charli', NULL, '2025-02-04 15:31:53', 1, NULL, NULL),
	(10, 2, 'Manoj', NULL, '2025-02-04 17:27:28', 1, NULL, NULL),
	(11, 4, 'Sanika', NULL, '2025-02-04 22:07:47', 1, '2025-02-11 15:40:11', 1),
	(12, 1, 'sagar', 'N', '2025-02-10 13:33:55', 1, '2025-02-10 13:34:28', 1);
/*!40000 ALTER TABLE `master_signatory_officer` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.master_task_category
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

-- Dumping data for table tlmis_testing.master_task_category: ~10 rows (approximately)
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

-- Dumping structure for table tlmis_testing.master_task_priority
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

-- Dumping data for table tlmis_testing.master_task_priority: ~2 rows (approximately)
INSERT INTO `master_task_priority` (`task_priority_id`, `priority`, `remark`, `is_active`, `created_by`, `created_ipaddress`, `created_datetime`, `updated_by`, `updated_ipaddress`, `updated_datetime`) VALUES
	(1, 'Normal', NULL, 1, NULL, NULL, '2024-12-16 16:52:40', 0, NULL, NULL),
	(2, 'High', NULL, 1, NULL, NULL, '2024-12-16 16:52:49', 0, NULL, NULL);

-- Dumping structure for table tlmis_testing.master_worktype
DROP TABLE IF EXISTS `master_worktype`;
CREATE TABLE IF NOT EXISTS `master_worktype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_date` timestamp NULL DEFAULT (now()),
  `create_by` int DEFAULT NULL,
  `create_ip` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_ip` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.master_worktype: ~12 rows (approximately)
INSERT INTO `master_worktype` (`id`, `work_type`, `create_date`, `create_by`, `create_ip`, `update_date`, `update_by`, `update_ip`) VALUES
	(1, 'सामान्य पत्र', '2024-12-14 07:13:50', NULL, NULL, NULL, 1, '127.0.0.1'),
	(2, 'शिकायत', '2024-12-14 07:13:50', NULL, NULL, NULL, 1, '127.0.0.1'),
	(3, 'भारत सरकार से आया हुआ पत्र', '2024-12-14 07:13:50', NULL, NULL, NULL, 1, '127.0.0.1'),
	(4, 'माननीय मुख्यमंत्री सचिवालय से आया हुआ पत्र', '2024-12-14 07:13:50', NULL, NULL, NULL, 1, '127.0.0.1'),
	(5, 'माननीय मंत्री से आया हुआ पत्र', '2024-12-14 07:13:50', NULL, NULL, NULL, 1, '127.0.0.1'),
	(7, 'माननीय सांसद से आया पत्र', '2024-12-14 07:13:50', NULL, NULL, NULL, 1, '127.0.0.1'),
	(8, 'माननीय विधायक से आया पत्र', '2024-12-14 07:13:50', NULL, NULL, NULL, 1, '127.0.0.1'),
	(9, 'महत्वपूर्ण', '2024-12-19 10:37:46', 1, '127.0.0.1', NULL, 1, '127.0.0.1'),
	(10, 'अन्य ', '2024-12-20 06:02:07', 1, '127.0.0.1', NULL, 1, '162.158.163.185'),
	(12, 'उच्च न्यायालय से प्राप्त पत्र', '2025-01-06 09:52:09', 1, '162.158.163.234', NULL, NULL, NULL),
	(13, 'उच्चतम न्यायालय से प्राप्त पत्र', '2025-01-06 09:52:28', 1, '162.158.163.234', NULL, NULL, NULL),
	(14, 'संचालनालय से प्राप्त पत्र', '2025-01-07 08:23:50', 1, '162.158.162.87', NULL, NULL, NULL);

-- Dumping structure for table tlmis_testing.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.migrations: ~3 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1);

-- Dumping structure for table tlmis_testing.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.sessions
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

-- Dumping data for table tlmis_testing.sessions: ~5 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('fmMERT5fFchgKCnBxWpKzsStKE7OOzKjN7EJBUhI', 1, '162.158.162.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YToxNzp7czo2OiJfdG9rZW4iO3M6NDA6IlVxQVZnSXJSaVJrTXdKc2x3MDA2U3ZyelNXYjZUS0o0UWJweHRqeFciO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NzoiY2FwdGNoYSI7czo0OiJGT01RIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMzoiaHR0cDovL3Rlc3RpbmcudGxtaXMuaW4vdGFzay12aWV3Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjc6InVzZXJfaWQiO2k6MTtzOjg6InVzZXJuYW1lIjtzOjc6InRlc3RfTDEiO3M6ODoiZnVsbG5hbWUiO3M6NzoiRGVtbyBMMSI7czo5OiJpc19hY3RpdmUiO2k6MTtzOjg6ImxldmVsX2lkIjtpOjE7czo1OiJsZXZlbCI7czo3OiJMZXZlbCAxIjtzOjE0OiJkZXNpZ25hdGlvbl9pZCI7aToxO3M6MTE6ImRlc2lnbmF0aW9uIjtzOjk6IkNvbGxlY3RvciI7czoxMzoiZGVwYXJ0bWVudF9pZCI7aTowO3M6OToiY3JlYXRlX2J5IjtOO3M6MTk6ImlzX3Bhc3N3b3JkX2NoYW5nZWQiO2k6MTtzOjc6InJvbGVfaWQiO2k6MDt9', 1740123323),
	('NeAtAVGIWXDaenKmAW9GHt8oCIRnWk3ODdT3tFr8', NULL, '172.69.165.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR1RLR1BYMjdMeVNhODVJYjEyYmlwWHRaSEVJM3JMRjJNOWJTdlpHYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly90ZXN0aW5nLnRsbWlzLmluL2dlbmVyYXRlLWNhcHRjaGEvNCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NzoiY2FwdGNoYSI7czo0OiJOR0pVIjt9', 1740116978);

-- Dumping structure for table tlmis_testing.tbl_file_mgmt
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_file_mgmt: ~6 rows (approximately)
INSERT INTO `tbl_file_mgmt` (`id`, `file_type_id`, `reference_no`, `issue_date`, `issuer`, `receiving_date`, `unique_file_id`, `doc_nature`, `doc_priority`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(2, 5, 'DOC/04.02.2025/001', '2025-02-04', 13, '2025-02-07', '67a1c2ac4c834', 'NL', 'Immediate', 1, '2025-02-04 13:03:00', '2025-02-04 17:25:05', 1, 1, '172.69.165.74', '162.158.162.50'),
	(3, 9, 'SBIN/02.02.2025/02', '2025-02-02', 14, '2025-02-06', '67a1feb6eff0c', 'TL', 'Immediate', 1, '2025-02-04 17:19:10', '2025-02-04 17:19:10', 1, NULL, '162.158.163.180', NULL),
	(4, 5, 'CGHC/03.03.2025/08', '2025-02-03', 15, '2025-02-04', '67a1ff2365886', 'NL', '2', 1, '2025-02-04 17:20:59', '2025-02-04 17:20:59', 1, NULL, '162.158.163.180', NULL),
	(5, 12, 'CGVS/2025/jan/000145', '2025-02-03', 16, '2025-02-12', '67a1ffa457af6', 'TL', 'Other', 1, '2025-02-04 17:23:08', '2025-02-04 17:23:08', 1, NULL, '162.158.162.50', NULL),
	(6, 2, '123456', '2025-02-11', 18, '2025-02-11', '67ab195f12f86', 'NL', '2', 1, '2025-02-11 15:03:19', '2025-02-11 15:03:57', 1, 1, '172.69.165.13', '172.69.165.13'),
	(7, 3, 'WTF33448903', '2025-02-17', 19, '2025-02-19', '67b41a27a8e22', 'NL', '2', 1, '2025-02-18 10:57:03', '2025-02-18 10:57:03', 1, NULL, '162.158.163.252', NULL);

-- Dumping structure for table tlmis_testing.tbl_file_mgmt_uploads
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_file_mgmt_uploads: ~6 rows (approximately)
INSERT INTO `tbl_file_mgmt_uploads` (`id`, `fk_file_mgmt_id`, `filename`, `extension`, `path`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(2, 2, 'TLMIS_-_Users_1738654380.pdf', 'pdf', 'testing/documents/TLMIS_-_Users_1738654380.pdf', '2025-02-04 13:03:00', '2025-02-04 13:03:00', 1, NULL, '172.69.165.74', NULL),
	(3, 3, 'sample_1738669750.pdf', 'pdf', 'testing/documents/sample_1738669750.pdf', '2025-02-04 17:19:10', '2025-02-04 17:19:10', 1, NULL, '162.158.163.180', NULL),
	(4, 4, 'sample_1738669859.pdf', 'pdf', 'testing/documents/sample_1738669859.pdf', '2025-02-04 17:20:59', '2025-02-04 17:20:59', 1, NULL, '162.158.163.180', NULL),
	(5, 5, 'sample_1738669988.pdf', 'pdf', 'testing/documents/sample_1738669988.pdf', '2025-02-04 17:23:08', '2025-02-04 17:23:08', 1, NULL, '162.158.162.50', NULL),
	(6, 6, 'sample_1738669988_1739266398.pdf', 'pdf', 'testing/documents/sample_1738669988_1739266398.pdf', '2025-02-11 15:03:19', '2025-02-11 15:03:19', 1, NULL, '172.69.165.13', NULL),
	(7, 7, 'Screenshot_2025-02-07_000805_1739856423.png', 'png', 'testing/documents/Screenshot_2025-02-07_000805_1739856423.png', '2025-02-18 10:57:03', '2025-02-18 10:57:03', 1, NULL, '162.158.163.252', NULL);

-- Dumping structure for table tlmis_testing.tbl_file_uploads
DROP TABLE IF EXISTS `tbl_file_uploads`;
CREATE TABLE IF NOT EXISTS `tbl_file_uploads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int DEFAULT NULL,
  `fk_reply_id` int DEFAULT NULL,
  `file_upload_type` enum('T','R') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'R' COMMENT 'T-''Task File'',     R- ''Reply File''',
  `filename` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file_name_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_task_id` (`fk_task_id`),
  KEY `fk_reply_id` (`fk_reply_id`),
  KEY `file_upload_type` (`file_upload_type`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table tlmis_testing.tbl_file_uploads: ~184 rows (approximately)
INSERT INTO `tbl_file_uploads` (`id`, `fk_task_id`, `fk_reply_id`, `file_upload_type`, `filename`, `file_path`, `file_type`, `file_size`, `file_name_type`, `created_at`) VALUES
	(3, NULL, 3, 'R', 'document_1736151488_677b91c02b654.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1736151488_677b91c02b654.pdf', '', '', NULL, '2025-01-06 08:18:08'),
	(4, NULL, 3, 'R', 'document_1736151488_677b91c02b822.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1736151488_677b91c02b822.pdf', '', '', NULL, '2025-01-06 08:18:08'),
	(5, 1, NULL, 'T', 'document_1736156717_677ba62d3b81a.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736156717_677ba62d3b81a.pdf', '', '', NULL, '2025-01-06 09:45:17'),
	(7, 3, NULL, 'T', 'document_1736238728_677ce688f258a.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736238728_677ce688f258a.pdf', '', '', NULL, '2025-01-07 08:32:08'),
	(8, 4, NULL, 'T', 'document_1736244550_677cfd468b812.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736244550_677cfd468b812.pdf', '', '', NULL, '2025-01-07 10:09:10'),
	(9, 5, NULL, 'T', 'document_1736244933_677cfec5703df.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736244933_677cfec5703df.pdf', '', '', NULL, '2025-01-07 10:15:33'),
	(10, 6, NULL, 'T', 'document_1736245256_677d000820f20.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736245256_677d000820f20.pdf', '', '', NULL, '2025-01-07 10:20:56'),
	(11, 7, NULL, 'T', 'document_1736251088_677d16d06435e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736251088_677d16d06435e.pdf', '', '', NULL, '2025-01-07 11:58:08'),
	(12, 8, NULL, 'T', 'document_1736251563_677d18abd89a2.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736251563_677d18abd89a2.pdf', '', '', NULL, '2025-01-07 12:06:03'),
	(13, 9, NULL, 'T', 'document_1736334128_677e5b30628ff.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736334128_677e5b30628ff.pdf', '', '', NULL, '2025-01-08 11:02:08'),
	(14, 10, NULL, 'T', 'document_1736334470_677e5c86e85fc.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736334470_677e5c86e85fc.pdf', '', '', NULL, '2025-01-08 11:07:50'),
	(15, 11, NULL, 'T', 'document_1736334718_677e5d7e0b1c8.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736334718_677e5d7e0b1c8.pdf', '', '', NULL, '2025-01-08 11:11:58'),
	(16, 12, NULL, 'T', 'document_1736335110_677e5f069b0c5.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736335110_677e5f069b0c5.pdf', '', '', NULL, '2025-01-08 11:18:30'),
	(17, 13, NULL, 'T', 'document_1736335288_677e5fb8d3ed9.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736335288_677e5fb8d3ed9.pdf', '', '', NULL, '2025-01-08 11:21:28'),
	(18, 14, NULL, 'T', 'document_1736335881_677e6209830c1.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736335881_677e6209830c1.pdf', '', '', NULL, '2025-01-08 11:31:21'),
	(19, 15, NULL, 'T', 'document_1736336090_677e62dac57f2.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736336090_677e62dac57f2.pdf', '', '', NULL, '2025-01-08 11:34:50'),
	(20, 16, NULL, 'T', 'document_1736411355_677f88db50bf1.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736411355_677f88db50bf1.pdf', '', '', NULL, '2025-01-09 08:29:15'),
	(21, 17, NULL, 'T', 'document_1736411584_677f89c0ee503.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736411584_677f89c0ee503.pdf', '', '', NULL, '2025-01-09 08:33:04'),
	(22, 18, NULL, 'T', 'document_1736411748_677f8a64b4aac.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736411748_677f8a64b4aac.pdf', '', '', NULL, '2025-01-09 08:35:48'),
	(23, 19, NULL, 'T', 'document_1736423730_677fb9326e82e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736423730_677fb9326e82e.pdf', '', '', NULL, '2025-01-09 11:55:30'),
	(24, 53, NULL, 'T', 'document_1736849404_678637fc83d17.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736849404_678637fc83d17.pdf', '', '', NULL, '2025-01-14 10:10:04'),
	(25, 54, NULL, 'T', 'document_1736849630_678638de81ab7.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736849630_678638de81ab7.pdf', '', '', NULL, '2025-01-14 10:13:50'),
	(26, 55, NULL, 'T', 'document_1736849754_6786395a1c50b.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736849754_6786395a1c50b.pdf', '', '', NULL, '2025-01-14 10:15:54'),
	(27, 62, NULL, 'T', 'document_1736857113_67865619b8692.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736857113_67865619b8692.pdf', '', '', NULL, '2025-01-14 12:18:33'),
	(28, 63, NULL, 'T', 'document_1736857416_678657486acb9.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736857416_678657486acb9.pdf', '', '', NULL, '2025-01-14 12:23:36'),
	(29, 65, NULL, 'T', 'document_1736858056_678659c86aa41.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736858056_678659c86aa41.pdf', '', '', NULL, '2025-01-14 12:34:16'),
	(30, 66, NULL, 'T', 'document_1736858566_67865bc6cb111.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736858566_67865bc6cb111.pdf', '', '', NULL, '2025-01-14 12:42:46'),
	(31, 68, NULL, 'T', 'document_1736859323_67865ebb638ea.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736859323_67865ebb638ea.pdf', '', '', NULL, '2025-01-14 12:55:23'),
	(32, 69, NULL, 'T', 'document_1736859825_678660b19b044.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736859825_678660b19b044.pdf', '', '', NULL, '2025-01-14 13:03:45'),
	(33, 70, NULL, 'T', 'document_1736859926_67866116089d3.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736859926_67866116089d3.pdf', '', '', NULL, '2025-01-14 13:05:26'),
	(34, 74, NULL, 'T', 'document_1736860818_67866492141a0.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736860818_67866492141a0.pdf', '', '', NULL, '2025-01-14 13:20:18'),
	(35, 78, NULL, 'T', 'document_1736861089_678665a14ce7d.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736861089_678665a14ce7d.pdf', '', '', NULL, '2025-01-14 13:24:49'),
	(36, 79, NULL, 'T', 'document_1736861272_678666588d34c.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736861272_678666588d34c.pdf', '', '', NULL, '2025-01-14 13:27:52'),
	(37, 80, NULL, 'T', 'document_1736861655_678667d7c0617.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736861655_678667d7c0617.pdf', '', '', NULL, '2025-01-14 13:34:15'),
	(38, 81, NULL, 'T', 'document_1736861955_678669032a990.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736861955_678669032a990.pdf', '', '', NULL, '2025-01-14 13:39:15'),
	(39, NULL, 66, 'R', 'document_1736881283_6786b4834cb65.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1736881283_6786b4834cb65.pdf', '', '', NULL, '2025-01-14 19:01:23'),
	(40, NULL, 67, 'R', 'document_1736881288_6786b488ea2cf.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1736881288_6786b488ea2cf.pdf', '', '', NULL, '2025-01-14 19:01:28'),
	(41, NULL, 72, 'R', 'document_1736888738_6786d1a296a6a.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1736888738_6786d1a296a6a.pdf', '', '', NULL, '2025-01-14 21:05:38'),
	(42, 82, NULL, 'T', 'document_1736889868_6786d60c30d28.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736889868_6786d60c30d28.pdf', '', '', NULL, '2025-01-14 21:24:28'),
	(43, NULL, 75, 'R', 'document_1736920401_67874d51eceff.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1736920401_67874d51eceff.pdf', '', '', NULL, '2025-01-15 05:53:21'),
	(44, 83, NULL, 'T', 'document_1736940122_67879a5aa693b.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736940122_67879a5aa693b.pdf', '', '', NULL, '2025-01-15 11:22:02'),
	(45, 84, NULL, 'T', 'document_1736940518_67879be6dc337.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736940518_67879be6dc337.pdf', '', '', NULL, '2025-01-15 11:28:38'),
	(46, 85, NULL, 'T', 'document_1736940690_67879c92ea363.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736940690_67879c92ea363.pdf', '', '', NULL, '2025-01-15 11:31:30'),
	(47, 86, NULL, 'T', 'document_1736940854_67879d36c5c65.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736940854_67879d36c5c65.pdf', '', '', NULL, '2025-01-15 11:34:14'),
	(48, 87, NULL, 'T', 'document_1736941331_67879f13757ed.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1736941331_67879f13757ed.pdf', '', '', NULL, '2025-01-15 11:42:11'),
	(49, 88, NULL, 'T', 'document_1737003648_6788928082069.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737003648_6788928082069.pdf', '', '', NULL, '2025-01-16 05:00:48'),
	(50, 89, NULL, 'T', 'document_1737006278_67889cc686242.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737006278_67889cc686242.pdf', '', '', NULL, '2025-01-16 05:44:38'),
	(51, 90, NULL, 'T', 'document_1737007070_67889fde58f8e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737007070_67889fde58f8e.pdf', '', '', NULL, '2025-01-16 05:57:50'),
	(52, 91, NULL, 'T', 'document_1737008572_6788a5bccb2c0.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737008572_6788a5bccb2c0.pdf', '', '', NULL, '2025-01-16 06:22:52'),
	(53, 92, NULL, 'T', 'document_1737009028_6788a78477330.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737009028_6788a78477330.pdf', '', '', NULL, '2025-01-16 06:30:28'),
	(54, 93, NULL, 'T', 'document_1737009306_6788a89a8e9c5.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737009306_6788a89a8e9c5.pdf', '', '', NULL, '2025-01-16 06:35:06'),
	(55, 94, NULL, 'T', 'document_1737009653_6788a9f5e2922.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737009653_6788a9f5e2922.pdf', '', '', NULL, '2025-01-16 06:40:53'),
	(56, 95, NULL, 'T', 'document_1737009945_6788ab19ef4f9.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737009945_6788ab19ef4f9.pdf', '', '', NULL, '2025-01-16 06:45:45'),
	(57, 96, NULL, 'T', 'document_1737010147_6788abe38fc38.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737010147_6788abe38fc38.pdf', '', '', NULL, '2025-01-16 06:49:07'),
	(58, 97, NULL, 'T', 'document_1737011807_6788b25f59a69.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737011807_6788b25f59a69.pdf', '', '', NULL, '2025-01-16 07:16:47'),
	(59, 98, NULL, 'T', 'document_1737012048_6788b35093d9c.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737012048_6788b35093d9c.pdf', '', '', NULL, '2025-01-16 07:20:48'),
	(60, 99, NULL, 'T', 'document_1737012359_6788b48705312.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737012359_6788b48705312.pdf', '', '', NULL, '2025-01-16 07:25:59'),
	(61, 100, NULL, 'T', 'document_1737019778_6788d182abe2e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737019778_6788d182abe2e.pdf', '', '', NULL, '2025-01-16 09:29:38'),
	(62, 101, NULL, 'T', 'document_1737026194_6788ea921b8d4.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737026194_6788ea921b8d4.pdf', '', '', NULL, '2025-01-16 11:16:34'),
	(63, 102, NULL, 'T', 'document_1737026384_6788eb50a19f7.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737026384_6788eb50a19f7.pdf', '', '', NULL, '2025-01-16 11:19:44'),
	(66, NULL, 101, 'R', 'document_1737095517_6789f95d5c267.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737095517_6789f95d5c267.pdf', '', '', NULL, '2025-01-17 06:31:57'),
	(67, NULL, 102, 'R', 'document_1737095570_6789f99274ba6.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737095570_6789f99274ba6.pdf', '', '', NULL, '2025-01-17 06:32:50'),
	(68, NULL, 103, 'R', 'document_1737096407_6789fcd736360.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737096407_6789fcd736360.pdf', '', '', NULL, '2025-01-17 06:46:47'),
	(69, 103, NULL, 'T', 'document_1737097369_678a0099ea1ca.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737097369_678a0099ea1ca.pdf', '', '', NULL, '2025-01-17 07:02:49'),
	(70, 104, NULL, 'T', 'document_1737097521_678a013169e8f.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737097521_678a013169e8f.pdf', '', '', NULL, '2025-01-17 07:05:21'),
	(71, 105, NULL, 'T', 'document_1737098135_678a039744207.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737098135_678a039744207.pdf', '', '', NULL, '2025-01-17 07:15:35'),
	(72, NULL, 105, 'R', 'document_1737098462_678a04def08ab.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737098462_678a04def08ab.pdf', '', '', NULL, '2025-01-17 07:21:02'),
	(73, NULL, 107, 'R', 'document_1737106505_678a244992346.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737106505_678a244992346.pdf', '', '', NULL, '2025-01-17 09:35:05'),
	(74, 106, NULL, 'T', 'document_1737107200_678a27002311e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737107200_678a27002311e.pdf', '', '', NULL, '2025-01-17 09:46:40'),
	(75, 107, NULL, 'T', 'document_1737111418_678a377a3a35e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737111418_678a377a3a35e.pdf', '', '', NULL, '2025-01-17 10:56:58'),
	(76, 108, NULL, 'T', 'document_1737111692_678a388cbcd5e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737111692_678a388cbcd5e.pdf', '', '', NULL, '2025-01-17 11:01:32'),
	(77, NULL, 113, 'R', 'document_1737350095_678ddbcfd8a8c.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737350095_678ddbcfd8a8c.pdf', '', '', NULL, '2025-01-20 05:14:55'),
	(78, 109, NULL, 'T', 'document_1737351765_678de2558900e.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737351765_678de2558900e.pdf', '', '', NULL, '2025-01-20 05:42:45'),
	(79, 110, NULL, 'T', 'document_1737352332_678de48c1409b.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737352332_678de48c1409b.pdf', '', '', NULL, '2025-01-20 05:52:12'),
	(80, 111, NULL, 'T', 'document_1737353226_678de80a09e23.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737353226_678de80a09e23.pdf', '', '', NULL, '2025-01-20 06:07:06'),
	(81, 112, NULL, 'T', 'document_1737353226_678de80ae602a.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737353226_678de80ae602a.pdf', '', '', NULL, '2025-01-20 06:07:06'),
	(82, 113, NULL, 'T', 'document_1737354657_678deda135617.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737354657_678deda135617.pdf', '', '', NULL, '2025-01-20 06:30:57'),
	(83, 114, NULL, 'T', 'document_1737357534_678df8de9927f.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737357534_678df8de9927f.pdf', '', '', NULL, '2025-01-20 07:18:54'),
	(84, 115, NULL, 'T', 'document_1737357812_678df9f495aef.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737357812_678df9f495aef.pdf', '', '', NULL, '2025-01-20 07:23:32'),
	(85, NULL, 132, 'R', 'document_1737363325_678e0f7dcf36f.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737363325_678e0f7dcf36f.pdf', '', '', NULL, '2025-01-20 08:55:25'),
	(86, 116, NULL, 'T', 'document_1737368903_678e2547d7ce0.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737368903_678e2547d7ce0.pdf', '', '', NULL, '2025-01-20 10:28:23'),
	(87, 117, NULL, 'T', 'document_1737369709_678e286d03cee.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737369709_678e286d03cee.pdf', '', '', NULL, '2025-01-20 10:41:49'),
	(88, 118, NULL, 'T', 'document_1737373114_678e35baa5d44.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737373114_678e35baa5d44.pdf', '', '', NULL, '2025-01-20 11:38:34'),
	(89, NULL, 152, 'R', 'document_1737373808_678e3870cf6ae.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737373808_678e3870cf6ae.pdf', '', '', NULL, '2025-01-20 11:50:08'),
	(90, 119, NULL, 'T', 'document_1737374109_678e399d1d4fa.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737374109_678e399d1d4fa.pdf', '', '', NULL, '2025-01-20 11:55:09'),
	(91, 120, NULL, 'T', 'document_1737435751_678f2a67e44a0.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737435751_678f2a67e44a0.pdf', '', '', NULL, '2025-01-21 05:02:31'),
	(92, 121, NULL, 'T', 'document_1737436526_678f2d6e32ec6.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737436526_678f2d6e32ec6.pdf', '', '', NULL, '2025-01-21 05:15:26'),
	(93, NULL, 173, 'R', 'document_1737437784_678f325873e76.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737437784_678f325873e76.pdf', '', '', NULL, '2025-01-21 05:36:24'),
	(94, 122, NULL, 'T', 'document_1737438378_678f34aac1546.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737438378_678f34aac1546.pdf', '', '', NULL, '2025-01-21 05:46:18'),
	(95, 123, NULL, 'T', 'document_1737438525_678f353df406a.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737438525_678f353df406a.pdf', '', '', NULL, '2025-01-21 05:48:46'),
	(96, NULL, 177, 'R', 'document_1737439278_678f382eaf5c3.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737439278_678f382eaf5c3.pdf', '', '', NULL, '2025-01-21 06:01:18'),
	(97, NULL, 180, 'R', 'document_1737439686_678f39c685e6d.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737439686_678f39c685e6d.pdf', '', '', NULL, '2025-01-21 06:08:06'),
	(98, NULL, 187, 'R', 'document_1737440559_678f3d2fe975e.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737440559_678f3d2fe975e.pdf', '', '', NULL, '2025-01-21 06:22:39'),
	(99, NULL, 191, 'R', 'document_1737440867_678f3e63cdc46.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737440867_678f3e63cdc46.pdf', '', '', NULL, '2025-01-21 06:27:47'),
	(100, NULL, 196, 'R', 'document_1737442017_678f42e1c1354.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737442017_678f42e1c1354.pdf', '', '', NULL, '2025-01-21 06:46:57'),
	(101, NULL, 209, 'R', 'document_1737446606_678f54cef01ad.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737446606_678f54cef01ad.pdf', '', '', NULL, '2025-01-21 08:03:26'),
	(102, NULL, 211, 'R', 'document_1737447085_678f56ad4e0e0.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737447085_678f56ad4e0e0.pdf', '', '', NULL, '2025-01-21 08:11:25'),
	(103, NULL, 212, 'R', 'document_1737447283_678f577349759.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737447283_678f577349759.pdf', '', '', NULL, '2025-01-21 08:14:43'),
	(104, NULL, 215, 'R', 'document_1737447821_678f598d0a98f.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737447821_678f598d0a98f.pdf', '', '', NULL, '2025-01-21 08:23:41'),
	(105, NULL, 222, 'R', 'document_1737452369_678f6b51eefc9.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737452369_678f6b51eefc9.pdf', '', '', NULL, '2025-01-21 09:39:29'),
	(106, NULL, 230, 'R', 'document_1737452973_678f6dada954e.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737452973_678f6dada954e.pdf', '', '', NULL, '2025-01-21 09:49:33'),
	(107, NULL, 234, 'R', 'document_1737453701_678f7085bcca8.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737453701_678f7085bcca8.pdf', '', '', NULL, '2025-01-21 10:01:41'),
	(108, NULL, 235, 'R', 'document_1737453765_678f70c5181dd.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737453765_678f70c5181dd.pdf', '', '', NULL, '2025-01-21 10:02:45'),
	(109, NULL, 262, 'R', 'document_1737526670_67908d8ef4150.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737526670_67908d8ef4150.pdf', '', '', NULL, '2025-01-22 06:17:51'),
	(110, NULL, 264, 'R', 'document_1737526709_67908db57fd79.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737526709_67908db57fd79.pdf', '', '', NULL, '2025-01-22 06:18:29'),
	(111, NULL, 265, 'R', 'document_1737526744_67908dd8dd0b9.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737526744_67908dd8dd0b9.pdf', '', '', NULL, '2025-01-22 06:19:04'),
	(112, NULL, 266, 'R', 'document_1737527088_67908f30b56d9.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737527088_67908f30b56d9.pdf', '', '', NULL, '2025-01-22 06:24:48'),
	(113, NULL, 269, 'R', 'document_1737531019_67909e8bebcea.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737531019_67909e8bebcea.pdf', '', '', NULL, '2025-01-22 07:30:19'),
	(114, NULL, 270, 'R', 'document_1737531111_67909ee753329.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737531111_67909ee753329.pdf', '', '', NULL, '2025-01-22 07:31:51'),
	(115, NULL, 271, 'R', 'document_1737531494_6790a066191e5.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737531494_6790a066191e5.pdf', '', '', NULL, '2025-01-22 07:38:14'),
	(116, NULL, 273, 'R', 'document_1737531767_6790a177c5098.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737531767_6790a177c5098.pdf', '', '', NULL, '2025-01-22 07:42:47'),
	(117, NULL, 274, 'R', 'document_1737531870_6790a1decf741.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737531870_6790a1decf741.pdf', '', '', NULL, '2025-01-22 07:44:30'),
	(119, NULL, 284, 'R', 'document_1737544210_6790d2127ba67.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737544210_6790d2127ba67.pdf', '', '', NULL, '2025-01-22 11:10:10'),
	(120, NULL, 285, 'R', 'document_1737545049_6790d5590880f.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737545049_6790d5590880f.pdf', '', '', NULL, '2025-01-22 11:24:09'),
	(121, NULL, 288, 'R', 'document_1737607054_6791c78eb1548.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737607054_6791c78eb1548.pdf', '', '', NULL, '2025-01-23 04:37:34'),
	(122, 125, NULL, 'T', 'document_1737614947_6791e663f21bc.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737614947_6791e663f21bc.pdf', '', '', NULL, '2025-01-23 06:49:07'),
	(123, 126, NULL, 'T', 'document_1737622174_6792029e5e478.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737622174_6792029e5e478.pdf', '', '', NULL, '2025-01-23 08:49:34'),
	(124, 127, NULL, 'T', 'document_1737622746_679204da49b99.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737622746_679204da49b99.pdf', '', '', NULL, '2025-01-23 08:59:06'),
	(125, NULL, 306, 'R', 'document_1737629183_67921dff9d550.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737629183_67921dff9d550.pdf', '', '', NULL, '2025-01-23 10:46:23'),
	(126, NULL, 308, 'R', 'document_1737631037_6792253db953c.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737631037_6792253db953c.pdf', '', '', NULL, '2025-01-23 11:17:17'),
	(127, NULL, 310, 'R', 'document_1737696178_679323b2055c7.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737696178_679323b2055c7.pdf', '', '', NULL, '2025-01-24 05:22:58'),
	(128, NULL, 311, 'R', 'document_1737697259_679327eb07e05.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737697259_679327eb07e05.pdf', '', '', NULL, '2025-01-24 05:40:59'),
	(129, 128, NULL, 'T', 'document_1737699690_6793316a714ce.pdf', '/var/www/wcd_tlmis/public/uploads/task_file/document_1737699690_6793316a714ce.pdf', '', '', NULL, '2025-01-24 06:21:30'),
	(130, 129, NULL, 'T', 'document_1737703173_67933f0580f42.pdf', 'uploads/task_file/document_1737703173_67933f0580f42.pdf', '', '', NULL, '2025-01-24 07:19:33'),
	(131, 130, NULL, 'T', 'document_1737717728_679377e014dad.pdf', 'uploads/task_file/document_1737717728_679377e014dad.pdf', '', '', NULL, '2025-01-24 11:22:08'),
	(132, NULL, 326, 'R', 'document_1737953658_6797117aa9707.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737953658_6797117aa9707.pdf', '', '', NULL, '2025-01-27 04:54:18'),
	(133, NULL, 328, 'R', 'document_1737954900_67971654da4c4.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737954900_67971654da4c4.pdf', '', '', NULL, '2025-01-27 05:15:00'),
	(134, 131, NULL, 'T', 'document_1737955942_67971a66581ac.pdf', 'uploads/task_file/document_1737955942_67971a66581ac.pdf', '', '', NULL, '2025-01-27 05:32:22'),
	(135, 132, NULL, 'T', 'document_1737956295_67971bc7f386c.pdf', 'uploads/task_file/document_1737956295_67971bc7f386c.pdf', '', '', NULL, '2025-01-27 05:38:16'),
	(136, 133, NULL, 'T', 'document_1737956736_67971d8049810.pdf', 'uploads/task_file/document_1737956736_67971d8049810.pdf', '', '', NULL, '2025-01-27 05:45:36'),
	(137, 134, NULL, 'T', 'document_1737956874_67971e0ac6d17.pdf', 'uploads/task_file/document_1737956874_67971e0ac6d17.pdf', '', '', NULL, '2025-01-27 05:47:54'),
	(138, NULL, 330, 'R', 'document_1737960122_67972aba1493c.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737960122_67972aba1493c.pdf', '', '', NULL, '2025-01-27 06:42:02'),
	(139, NULL, 333, 'R', 'document_1737962743_679734f736efc.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737962743_679734f736efc.pdf', '', '', NULL, '2025-01-27 07:25:43'),
	(140, 135, NULL, 'T', 'document_1737976781_67976bcdee1b9.pdf', 'uploads/task_file/document_1737976781_67976bcdee1b9.pdf', '', '', NULL, '2025-01-27 11:19:41'),
	(141, 136, NULL, 'T', 'document_1737977067_67976ceb919d9.pdf', 'uploads/task_file/document_1737977067_67976ceb919d9.pdf', '', '', NULL, '2025-01-27 11:24:27'),
	(142, NULL, 344, 'R', 'document_1737977817_67976fd91d0ce.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1737977817_67976fd91d0ce.pdf', '', '', NULL, '2025-01-27 11:36:57'),
	(143, NULL, 351, 'R', 'document_1738040105_67986329802e6.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738040105_67986329802e6.pdf', '', '', NULL, '2025-01-28 04:55:05'),
	(144, 137, NULL, 'T', 'document_1738041541_679868c50040a.pdf', 'uploads/task_file/document_1738041541_679868c50040a.pdf', '', '', NULL, '2025-01-28 05:19:01'),
	(145, NULL, 361, 'R', 'document_1738043437_6798702d44c67.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738043437_6798702d44c67.pdf', '', '', NULL, '2025-01-28 05:50:37'),
	(146, NULL, 368, 'R', 'document_1738045291_6798776b35931.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738045291_6798776b35931.pdf', '', '', NULL, '2025-01-28 06:21:31'),
	(147, NULL, 370, 'R', 'document_1738046319_67987b6f1660e.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738046319_67987b6f1660e.pdf', '', '', NULL, '2025-01-28 06:38:39'),
	(148, NULL, 377, 'R', 'document_1738047844_679881643db44.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738047844_679881643db44.pdf', '', '', NULL, '2025-01-28 07:04:04'),
	(149, NULL, 385, 'R', 'document_1738051450_67988f7aa403c.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738051450_67988f7aa403c.pdf', '', '', NULL, '2025-01-28 08:04:10'),
	(150, NULL, 390, 'R', 'document_1738052572_679893dc1ec61.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738052572_679893dc1ec61.pdf', '', '', NULL, '2025-01-28 08:22:52'),
	(151, NULL, 391, 'R', 'document_1738053127_6798960743f18.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738053127_6798960743f18.pdf', '', '', NULL, '2025-01-28 08:32:07'),
	(152, NULL, 391, 'R', 'document_1738053127_6798960744395.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738053127_6798960744395.pdf', '', '', NULL, '2025-01-28 08:32:07'),
	(153, NULL, 391, 'R', 'document_1738053127_67989607447c1.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738053127_67989607447c1.pdf', '', '', NULL, '2025-01-28 08:32:07'),
	(154, NULL, 391, 'R', 'document_1738053127_6798960744c72.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738053127_6798960744c72.pdf', '', '', NULL, '2025-01-28 08:32:07'),
	(155, NULL, 392, 'R', 'document_1738053331_679896d330bd2.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738053331_679896d330bd2.pdf', '', '', NULL, '2025-01-28 08:35:31'),
	(156, 138, NULL, 'T', 'document_1738054889_67989ce944193.pdf', 'uploads/task_file/document_1738054889_67989ce944193.pdf', '', '', NULL, '2025-01-28 09:01:29'),
	(157, NULL, 397, 'R', 'document_1738055145_67989de90a0db.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738055145_67989de90a0db.pdf', '', '', NULL, '2025-01-28 09:05:45'),
	(158, 139, NULL, 'T', 'document_1738055491_67989f438d0e9.pdf', 'uploads/task_file/document_1738055491_67989f438d0e9.pdf', '', '', NULL, '2025-01-28 09:11:31'),
	(159, NULL, 398, 'R', 'document_1738055514_67989f5a6a1b9.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738055514_67989f5a6a1b9.pdf', '', '', NULL, '2025-01-28 09:11:54'),
	(160, NULL, 400, 'R', 'document_1738056027_6798a15bebc6e.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738056027_6798a15bebc6e.pdf', '', '', NULL, '2025-01-28 09:20:27'),
	(161, NULL, 401, 'R', 'document_1738058029_6798a92dd477c.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738058029_6798a92dd477c.pdf', '', '', NULL, '2025-01-28 09:53:49'),
	(162, NULL, 401, 'R', 'document_1738058029_6798a92dd4b99.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738058029_6798a92dd4b99.pdf', '', '', NULL, '2025-01-28 09:53:49'),
	(163, NULL, 405, 'R', 'document_1738059315_6798ae333c031.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738059315_6798ae333c031.pdf', '', '', NULL, '2025-01-28 10:15:15'),
	(164, NULL, 406, 'R', 'document_1738059384_6798ae7891063.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738059384_6798ae7891063.pdf', '', '', NULL, '2025-01-28 10:16:24'),
	(165, NULL, 407, 'R', 'document_1738059385_6798ae7922e8c.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738059385_6798ae7922e8c.pdf', '', '', NULL, '2025-01-28 10:16:25'),
	(166, 140, NULL, 'T', 'document_1738065219_6798c5437baf0.pdf', 'uploads/task_file/document_1738065219_6798c5437baf0.pdf', '', '', NULL, '2025-01-28 11:53:39'),
	(167, 141, NULL, 'T', 'document_1738130488_6799c43805425.pdf', 'uploads/task_file/document_1738130488_6799c43805425.pdf', '', '', NULL, '2025-01-29 06:01:28'),
	(168, 142, NULL, 'T', 'document_1738130680_6799c4f8973a7.pdf', 'uploads/task_file/document_1738130680_6799c4f8973a7.pdf', '', '', NULL, '2025-01-29 06:04:40'),
	(169, 143, NULL, 'T', 'document_1738130874_6799c5ba222b6.pdf', 'uploads/task_file/document_1738130874_6799c5ba222b6.pdf', '', '', NULL, '2025-01-29 06:07:54'),
	(170, 144, NULL, 'T', 'document_1738131294_6799c75e7828c.pdf', 'uploads/task_file/document_1738131294_6799c75e7828c.pdf', '', '', NULL, '2025-01-29 06:14:54'),
	(171, 145, NULL, 'T', 'document_1738139136_6799e6009a3c9.pdf', 'uploads/task_file/document_1738139136_6799e6009a3c9.pdf', '', '', NULL, '2025-01-29 08:25:36'),
	(172, 146, NULL, 'T', 'document_1738139385_6799e6f99591d.pdf', 'uploads/task_file/document_1738139385_6799e6f99591d.pdf', '', '', NULL, '2025-01-29 08:29:45'),
	(173, 147, NULL, 'T', 'document_1738139756_6799e86c6e542.pdf', 'uploads/task_file/document_1738139756_6799e86c6e542.pdf', '', '', NULL, '2025-01-29 08:35:56'),
	(174, 148, NULL, 'T', 'document_1738140012_6799e96ca27ca.pdf', 'uploads/task_file/document_1738140012_6799e96ca27ca.pdf', '', '', NULL, '2025-01-29 08:40:12'),
	(175, 149, NULL, 'T', 'document_1738140354_6799eac21fd51.pdf', 'uploads/task_file/document_1738140354_6799eac21fd51.pdf', '', '', NULL, '2025-01-29 08:45:54'),
	(176, 150, NULL, 'T', 'document_1738140544_6799eb801e789.pdf', 'uploads/task_file/document_1738140544_6799eb801e789.pdf', '', '', NULL, '2025-01-29 08:49:04'),
	(177, 151, NULL, 'T', 'document_1738151545_679a167952a06.pdf', 'uploads/task_file/document_1738151545_679a167952a06.pdf', '', '', NULL, '2025-01-29 11:52:25'),
	(178, 152, NULL, 'T', 'document_1738214351_679b0bcfbd5a7.pdf', 'uploads/task_file/document_1738214351_679b0bcfbd5a7.pdf', '', '', NULL, '2025-01-30 05:19:11'),
	(179, 153, NULL, 'T', 'document_1738214641_679b0cf17508f.pdf', 'uploads/task_file/document_1738214641_679b0cf17508f.pdf', '', '', NULL, '2025-01-30 05:24:01'),
	(180, 154, NULL, 'T', 'document_1738214849_679b0dc144800.pdf', 'uploads/task_file/document_1738214849_679b0dc144800.pdf', '', '', NULL, '2025-01-30 05:27:29'),
	(181, 155, NULL, 'T', 'document_1738215293_679b0f7d69261.pdf', 'uploads/task_file/document_1738215293_679b0f7d69261.pdf', '', '', NULL, '2025-01-30 05:34:53'),
	(182, 156, NULL, 'T', 'document_1738233428_679b565426008.pdf', 'uploads/task_file/document_1738233428_679b565426008.pdf', '', '', NULL, '2025-01-30 10:37:08'),
	(183, NULL, 442, 'R', 'document_1738307989_679c7995d6659.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738307989_679c7995d6659.pdf', '', '', NULL, '2025-01-31 07:19:49'),
	(184, 157, NULL, 'T', 'document_1738312552_679c8b680ce77.pdf', 'uploads/task_file/document_1738312552_679c8b680ce77.pdf', '', '', NULL, '2025-01-31 08:35:52'),
	(185, 158, NULL, 'T', 'document_1738323558_679cb666ecae5.pdf', 'uploads/task_file/document_1738323558_679cb666ecae5.pdf', '', '', NULL, '2025-01-31 11:39:18'),
	(186, NULL, 447, 'R', 'document_1738323709_679cb6fd4c08d.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738323709_679cb6fd4c08d.pdf', '', '', NULL, '2025-01-31 11:41:49'),
	(187, 159, NULL, 'T', 'document_1738323923_679cb7d35bee8.pdf', 'uploads/task_file/document_1738323923_679cb7d35bee8.pdf', '', '', NULL, '2025-01-31 11:45:23'),
	(188, NULL, 448, 'R', 'document_1738324853_679cbb757cffe.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738324853_679cbb757cffe.pdf', '', '', NULL, '2025-01-31 12:00:53'),
	(189, NULL, 464, 'R', 'document_1738564469_67a063759b895.pdf', '/var/www/wcd_tlmis/public/uploads/task_reply/document_1738564469_67a063759b895.pdf', '', '', NULL, '2025-02-03 06:34:29'),
	(190, 160, NULL, 'T', 'document_1738570514_67a07b12a42c2.pdf', 'uploads/task_file/document_1738570514_67a07b12a42c2.pdf', '', '', NULL, '2025-02-03 08:15:14');

-- Dumping structure for table tlmis_testing.tbl_header
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.tbl_header: 7 rows
/*!40000 ALTER TABLE `tbl_header` DISABLE KEYS */;
INSERT INTO `tbl_header` (`id`, `header_name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
	(1, 'Office Assistant', '<p><span style="font-family:Comic Sans MS,cursive">Email: - contact@vectre.in</span></p>', '2025-02-04 15:21:20', 1, '2025-02-15 17:30:15', 1),
	(2, 'Office Assistant', '<p>Email: - contact@vectre.com</p>', '2025-02-04 15:22:30', 1, '2025-02-10 13:32:40', 1),
	(3, 'Office Assistent', '<p>assistenten@gmail.com</p>', '2025-02-04 18:07:19', 1, NULL, NULL),
	(4, 'Office Assistant', '<p>Contact No. - 8833992732</p>', '2025-02-10 13:28:42', 1, NULL, NULL),
	(5, 'Office Assistant 2', '<p>Contact No. - 8833992733</p>', '2025-02-10 13:29:25', 1, NULL, NULL),
	(6, 'Office Assistent 6', '<p>assistenten6@gmail.com</p>', '2025-02-10 13:30:13', 1, '2025-02-10 13:30:49', 1),
	(7, 'Office Assistant 12', '<p>Contact No. - 8833992734</p>', '2025-02-10 13:31:31', 1, '2025-02-10 13:32:02', 1);
/*!40000 ALTER TABLE `tbl_header` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.tbl_letters
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.tbl_letters: 0 rows
/*!40000 ALTER TABLE `tbl_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_letters` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.tbl_login_logs
DROP TABLE IF EXISTS `tbl_login_logs`;
CREATE TABLE IF NOT EXISTS `tbl_login_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL COMMENT 'id of Table "tbl_users"',
  `role_id` int NOT NULL,
  `login_date_time` datetime NOT NULL,
  `logout_date_time` datetime DEFAULT NULL,
  `login_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logout_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login_ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logout_ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT (now()),
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user_id` (`fk_user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table tlmis_testing.tbl_login_logs: 395 rows
/*!40000 ALTER TABLE `tbl_login_logs` DISABLE KEYS */;
INSERT INTO `tbl_login_logs` (`id`, `fk_user_id`, `role_id`, `login_date_time`, `logout_date_time`, `login_message`, `logout_message`, `login_ip_address`, `logout_ip_address`, `create_ip`, `update_ip`, `create_date`, `update_date`) VALUES
	(1, 1, 1, '2025-01-06 07:55:29', NULL, 'Logged in successfully', NULL, '162.158.162.23', NULL, '162.158.162.23', NULL, '2025-01-06 13:25:29', NULL),
	(2, 5, 2, '2025-01-06 08:09:10', NULL, 'Logged in successfully', NULL, '162.158.162.75', NULL, '162.158.162.75', NULL, '2025-01-06 13:39:10', NULL),
	(3, 8, 2, '2025-01-06 08:16:02', NULL, 'Logged in successfully', NULL, '162.158.163.185', NULL, '162.158.163.185', NULL, '2025-01-06 13:46:02', NULL),
	(4, 2, 3, '2025-01-06 08:20:26', NULL, 'Logged in successfully', NULL, '162.158.162.42', NULL, '162.158.162.42', NULL, '2025-01-06 13:50:26', NULL),
	(5, 1, 1, '2025-01-06 08:30:50', '2025-01-06 11:44:06', 'Logged in successfully', 'Logged out successfully', '172.69.165.21', '162.158.163.186', '172.69.165.21', '162.158.163.186', '2025-01-06 14:00:50', '2025-01-06 17:14:06'),
	(6, 5, 2, '2025-01-06 09:12:56', NULL, 'Logged in successfully', NULL, '162.158.163.234', NULL, '162.158.163.234', NULL, '2025-01-06 14:42:56', NULL),
	(7, 3, 2, '2025-01-06 09:14:23', NULL, 'Logged in successfully', NULL, '172.69.165.21', NULL, '172.69.165.21', NULL, '2025-01-06 14:44:23', NULL),
	(8, 5, 2, '2025-01-06 09:37:47', NULL, 'Logged in successfully', NULL, '162.158.163.186', NULL, '162.158.163.186', NULL, '2025-01-06 15:07:47', NULL),
	(9, 5, 2, '2025-01-06 10:06:45', '2025-01-06 10:07:09', 'Logged in successfully', 'Logged out successfully', '172.69.165.21', '172.69.165.21', '172.69.165.21', '172.69.165.21', '2025-01-06 15:36:45', '2025-01-06 15:37:09'),
	(10, 2, 3, '2025-01-06 10:07:43', NULL, 'Logged in successfully', NULL, '172.69.165.58', NULL, '172.69.165.58', NULL, '2025-01-06 15:37:43', NULL),
	(11, 1, 1, '2025-01-06 15:45:15', NULL, 'Logged in successfully', NULL, '172.69.165.59', NULL, '172.69.165.59', NULL, '2025-01-06 21:15:15', NULL),
	(12, 5, 2, '2025-01-06 15:55:51', NULL, 'Logged in successfully', NULL, '162.158.163.186', NULL, '162.158.163.186', NULL, '2025-01-06 21:25:51', NULL),
	(13, 9, 2, '2025-01-07 05:12:27', '2025-01-07 05:15:24', 'Logged in successfully', 'Logged out successfully', '162.158.162.42', '162.158.163.121', '162.158.162.42', '162.158.163.121', '2025-01-07 10:42:27', '2025-01-07 10:45:24'),
	(14, 1, 1, '2025-01-07 05:23:29', NULL, 'Logged in successfully', NULL, '172.69.165.20', NULL, '172.69.165.20', NULL, '2025-01-07 10:53:29', NULL),
	(15, 5, 2, '2025-01-07 05:24:40', NULL, 'Logged in successfully', NULL, '162.158.163.185', NULL, '162.158.163.185', NULL, '2025-01-07 10:54:40', NULL),
	(16, 1, 1, '2025-01-07 07:42:33', '2025-01-07 10:39:52', 'Logged in successfully', 'Logged out successfully', '172.69.165.21', '172.69.165.12', '172.69.165.21', '172.69.165.12', '2025-01-07 13:12:33', '2025-01-07 16:09:52'),
	(17, 1, 1, '2025-01-07 08:43:11', '2025-01-07 12:10:48', 'Logged in successfully', 'Logged out successfully', '162.158.163.238', '162.158.163.113', '162.158.163.238', '162.158.163.113', '2025-01-07 14:13:11', '2025-01-07 17:40:48'),
	(18, 5, 2, '2025-01-07 10:43:12', NULL, 'Logged in successfully', NULL, '172.69.165.58', NULL, '172.69.165.58', NULL, '2025-01-07 16:13:12', NULL),
	(19, 4, 2, '2025-01-07 11:40:24', NULL, 'Logged in successfully', NULL, '162.158.163.121', NULL, '162.158.163.121', NULL, '2025-01-07 17:10:24', NULL),
	(20, 5, 2, '2025-01-08 05:09:45', NULL, 'Logged in successfully', NULL, '172.69.165.58', NULL, '172.69.165.58', NULL, '2025-01-08 10:39:45', NULL),
	(21, 1, 1, '2025-01-08 05:29:37', NULL, 'Logged in successfully', NULL, '162.158.163.121', NULL, '162.158.163.121', NULL, '2025-01-08 10:59:37', NULL),
	(22, 5, 2, '2025-01-08 05:39:11', NULL, 'Logged in successfully', NULL, '172.69.165.21', NULL, '172.69.165.21', NULL, '2025-01-08 11:09:11', NULL),
	(23, 5, 2, '2025-01-08 05:45:59', NULL, 'Logged in successfully', NULL, '172.69.165.58', NULL, '172.69.165.58', NULL, '2025-01-08 11:15:59', NULL),
	(24, 1, 1, '2025-01-08 06:19:17', '2025-01-08 12:57:53', 'Logged in successfully', 'Logged out successfully', '162.158.163.20', '162.158.163.132', '162.158.163.20', '162.158.163.132', '2025-01-08 11:49:17', '2025-01-08 18:27:53'),
	(25, 1, 1, '2025-01-08 09:05:32', '2025-01-08 09:46:32', 'Logged in successfully', 'Logged out successfully', '162.158.163.32', '162.158.163.132', '162.158.163.32', '162.158.163.132', '2025-01-08 14:35:32', '2025-01-08 15:16:32'),
	(26, 1, 1, '2025-01-08 09:46:41', NULL, 'Logged in successfully', NULL, '162.158.163.132', NULL, '162.158.163.132', NULL, '2025-01-08 15:16:41', NULL),
	(27, 1, 1, '2025-01-08 12:10:40', '2025-01-08 12:12:58', 'Logged in successfully', 'Logged out successfully', '162.158.163.186', '162.158.163.186', '162.158.163.186', '162.158.163.186', '2025-01-08 17:40:40', '2025-01-08 17:42:58'),
	(28, 1, 1, '2025-01-09 05:26:00', '2025-01-09 12:13:02', 'Logged in successfully', 'Logged out successfully', '162.158.162.102', '162.158.163.233', '162.158.162.102', '162.158.163.233', '2025-01-09 10:56:00', '2025-01-09 17:43:02'),
	(29, 5, 2, '2025-01-14 02:42:10', NULL, 'Logged in successfully', NULL, '162.158.163.186', NULL, '162.158.163.186', NULL, '2025-01-14 08:12:10', NULL),
	(30, 1, 1, '2025-01-14 04:45:29', NULL, 'Logged in successfully', NULL, '172.69.165.59', NULL, '172.69.165.59', NULL, '2025-01-14 10:15:29', NULL),
	(31, 1, 1, '2025-01-14 05:04:38', '2025-01-14 07:11:21', 'Logged in successfully', 'Logged out successfully', '172.69.165.20', '172.69.165.20', '172.69.165.20', '172.69.165.20', '2025-01-14 10:34:38', '2025-01-14 12:41:21'),
	(32, 5, 2, '2025-01-14 05:12:24', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-14 10:42:24', NULL),
	(33, 13, 2, '2025-01-14 06:08:57', '2025-01-14 06:21:17', 'Logged in successfully', 'Logged out successfully', '162.158.163.186', '172.69.165.59', '162.158.163.186', '172.69.165.59', '2025-01-14 11:38:57', '2025-01-14 11:51:17'),
	(34, 6, 2, '2025-01-14 06:16:03', NULL, 'Logged in successfully', NULL, '162.158.162.124', NULL, '162.158.162.124', NULL, '2025-01-14 11:46:03', NULL),
	(35, 6, 2, '2025-01-14 06:28:42', NULL, 'Logged in successfully', NULL, '172.69.165.59', NULL, '172.69.165.59', NULL, '2025-01-14 11:58:42', NULL),
	(36, 12, 2, '2025-01-14 06:43:23', NULL, 'Logged in successfully', NULL, '172.69.165.20', NULL, '172.69.165.20', NULL, '2025-01-14 12:13:23', NULL),
	(37, 6, 2, '2025-01-14 06:47:26', NULL, 'Logged in successfully', NULL, '162.158.162.36', NULL, '162.158.162.36', NULL, '2025-01-14 12:17:26', NULL),
	(38, 6, 2, '2025-01-14 07:01:01', NULL, 'Logged in successfully', NULL, '162.158.163.237', NULL, '162.158.163.237', NULL, '2025-01-14 12:31:01', NULL),
	(39, 5, 2, '2025-01-14 07:02:26', NULL, 'Logged in successfully', NULL, '162.158.162.244', NULL, '162.158.162.244', NULL, '2025-01-14 12:32:26', NULL),
	(40, 1, 1, '2025-01-14 07:02:28', '2025-01-14 07:08:41', 'Logged in successfully', 'Logged out successfully', '162.158.163.19', '162.158.163.185', '162.158.163.19', '162.158.163.185', '2025-01-14 12:32:28', '2025-01-14 12:38:41'),
	(41, 1, 1, '2025-01-14 07:09:43', NULL, 'Logged in successfully', NULL, '162.158.163.186', NULL, '162.158.163.186', NULL, '2025-01-14 12:39:43', NULL),
	(42, 5, 2, '2025-01-14 07:10:48', NULL, 'Logged in successfully', NULL, '162.158.163.93', NULL, '162.158.163.93', NULL, '2025-01-14 12:40:48', NULL),
	(43, 1, 1, '2025-01-14 07:11:33', NULL, 'Logged in successfully', NULL, '172.69.165.20', NULL, '172.69.165.20', NULL, '2025-01-14 12:41:33', NULL),
	(44, 5, 2, '2025-01-14 07:20:40', '2025-01-14 11:27:09', 'Logged in successfully', 'Logged out successfully', '162.158.163.233', '172.69.165.51', '162.158.163.233', '172.69.165.51', '2025-01-14 12:50:40', '2025-01-14 16:57:09'),
	(45, 3, 2, '2025-01-14 08:13:11', NULL, 'Logged in successfully', NULL, '162.158.162.71', NULL, '162.158.162.71', NULL, '2025-01-14 13:43:11', NULL),
	(46, 6, 2, '2025-01-14 08:17:13', NULL, 'Logged in successfully', NULL, '162.158.163.186', NULL, '162.158.163.186', NULL, '2025-01-14 13:47:13', NULL),
	(47, 6, 2, '2025-01-14 08:46:44', NULL, 'Logged in successfully', NULL, '172.69.165.58', NULL, '172.69.165.58', NULL, '2025-01-14 14:16:44', NULL),
	(48, 6, 2, '2025-01-14 09:29:59', NULL, 'Logged in successfully', NULL, '172.69.165.21', NULL, '172.69.165.21', NULL, '2025-01-14 14:59:59', NULL),
	(49, 1, 1, '2025-01-14 10:05:37', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-14 15:35:37', NULL),
	(50, 1, 1, '2025-01-14 10:11:38', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-14 15:41:38', NULL),
	(51, 1, 1, '2025-01-14 10:19:18', '2025-01-14 10:20:52', 'Logged in successfully', 'Logged out successfully', '162.158.163.82', '162.158.163.82', '162.158.163.82', '162.158.163.82', '2025-01-14 15:49:18', '2025-01-14 15:50:52'),
	(52, 1, 1, '2025-01-14 10:23:47', '2025-01-14 13:08:34', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.162.48', '162.158.163.176', '162.158.162.48', '2025-01-14 15:53:47', '2025-01-14 18:38:34'),
	(53, 1, 1, '2025-01-14 10:29:10', NULL, 'Logged in successfully', NULL, '162.158.162.129', NULL, '162.158.162.129', NULL, '2025-01-14 15:59:10', NULL),
	(54, 5, 2, '2025-01-14 10:31:24', NULL, 'Logged in successfully', NULL, '162.158.163.247', NULL, '162.158.163.247', NULL, '2025-01-14 16:01:24', NULL),
	(55, 1, 1, '2025-01-14 10:37:36', '2025-01-14 10:39:23', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.162.87', '162.158.162.87', '162.158.162.87', '2025-01-14 16:07:36', '2025-01-14 16:09:23'),
	(56, 12, 2, '2025-01-14 10:41:07', '2025-01-14 10:44:48', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.162.87', '162.158.162.87', '162.158.162.87', '2025-01-14 16:11:07', '2025-01-14 16:14:48'),
	(57, 1, 1, '2025-01-14 10:44:59', '2025-01-14 11:25:20', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.163.151', '162.158.162.86', '162.158.163.151', '2025-01-14 16:14:59', '2025-01-14 16:55:20'),
	(58, 1, 1, '2025-01-14 11:04:41', NULL, 'Logged in successfully', NULL, '162.158.163.247', NULL, '162.158.163.247', NULL, '2025-01-14 16:34:41', NULL),
	(59, 1, 1, '2025-01-14 11:30:43', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-14 17:00:43', NULL),
	(60, 5, 2, '2025-01-14 12:00:51', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-14 17:30:51', NULL),
	(61, 1, 1, '2025-01-14 12:21:51', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-14 17:51:51', NULL),
	(62, 1, 1, '2025-01-14 13:14:59', '2025-01-14 13:31:28', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.162.49', '162.158.162.48', '162.158.162.49', '2025-01-14 18:44:59', '2025-01-14 19:01:28'),
	(63, 1, 1, '2025-01-14 13:30:02', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-14 19:00:02', NULL),
	(64, 4, 2, '2025-01-14 14:11:25', '2025-01-14 14:16:45', 'Logged in successfully', 'Logged out successfully', '162.158.163.130', '162.158.162.129', '162.158.163.130', '162.158.162.129', '2025-01-14 19:41:25', '2025-01-14 19:46:45'),
	(65, 3, 2, '2025-01-14 14:18:54', NULL, 'Logged in successfully', NULL, '162.158.162.128', NULL, '162.158.162.128', NULL, '2025-01-14 19:48:54', NULL),
	(66, 4, 2, '2025-01-14 15:55:06', NULL, 'Logged in successfully', NULL, '162.158.163.165', NULL, '162.158.163.165', NULL, '2025-01-14 21:25:06', NULL),
	(67, 1, 1, '2025-01-14 15:55:45', NULL, 'Logged in successfully', NULL, '162.158.163.82', NULL, '162.158.163.82', NULL, '2025-01-14 21:25:45', NULL),
	(68, 1, 1, '2025-01-14 15:59:50', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-14 21:29:50', NULL),
	(69, 1, 1, '2025-01-14 16:01:07', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-14 21:31:07', NULL),
	(70, 4, 2, '2025-01-14 16:04:34', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-14 21:34:34', NULL),
	(71, 17, 2, '2025-01-14 16:19:37', '2025-01-14 16:28:15', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.163.129', '162.158.162.87', '162.158.163.129', '2025-01-14 21:49:37', '2025-01-14 21:58:15'),
	(72, 17, 2, '2025-01-14 16:39:07', '2025-01-14 17:21:59', 'Logged in successfully', 'Logged out successfully', '162.158.163.248', '162.158.163.176', '162.158.163.248', '162.158.163.176', '2025-01-14 22:09:07', '2025-01-14 22:51:59'),
	(73, 1, 1, '2025-01-14 17:41:21', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-14 23:11:21', NULL),
	(74, 8, 2, '2025-01-14 18:49:58', NULL, 'Logged in successfully', NULL, '172.69.165.50', NULL, '172.69.165.50', NULL, '2025-01-15 00:19:58', NULL),
	(75, 1, 1, '2025-01-14 20:59:40', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-15 02:29:40', NULL),
	(76, 1, 1, '2025-01-14 21:28:03', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-15 02:58:03', NULL),
	(77, 1, 1, '2025-01-15 03:03:29', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-15 08:33:29', NULL),
	(78, 1, 1, '2025-01-15 03:27:18', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-15 08:57:18', NULL),
	(79, 8, 2, '2025-01-15 03:28:09', '2025-01-15 03:31:28', 'Logged in successfully', 'Logged out successfully', '162.158.163.151', '162.158.163.151', '162.158.163.151', '162.158.163.151', '2025-01-15 08:58:09', '2025-01-15 09:01:28'),
	(80, 17, 2, '2025-01-15 03:29:31', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-15 08:59:31', NULL),
	(81, 1, 1, '2025-01-15 03:32:20', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-15 09:02:20', NULL),
	(82, 17, 2, '2025-01-15 03:34:02', '2025-01-15 03:43:41', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.162.49', '162.158.162.48', '162.158.162.49', '2025-01-15 09:04:02', '2025-01-15 09:13:41'),
	(83, 17, 2, '2025-01-15 03:47:53', '2025-01-15 04:47:23', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.176', '162.158.163.176', '162.158.163.176', '2025-01-15 09:17:53', '2025-01-15 10:17:23'),
	(84, 2, 3, '2025-01-15 04:03:02', '2025-01-15 04:05:35', 'Logged in successfully', 'Logged out successfully', '162.158.163.175', '162.158.163.152', '162.158.163.175', '162.158.163.152', '2025-01-15 09:33:02', '2025-01-15 09:35:35'),
	(85, 8, 2, '2025-01-15 04:05:48', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-15 09:35:48', NULL),
	(86, 1, 1, '2025-01-15 04:28:52', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-15 09:58:52', NULL),
	(87, 6, 2, '2025-01-15 04:34:40', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-15 10:04:40', NULL),
	(88, 3, 2, '2025-01-15 04:45:36', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-15 10:15:36', NULL),
	(89, 1, 1, '2025-01-15 04:47:01', NULL, 'Logged in successfully', NULL, '162.158.162.48', NULL, '162.158.162.48', NULL, '2025-01-15 10:17:01', NULL),
	(90, 8, 2, '2025-01-15 04:47:36', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-15 10:17:36', NULL),
	(91, 2, 3, '2025-01-15 04:49:18', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-15 10:19:18', NULL),
	(92, 1, 1, '2025-01-15 04:52:13', '2025-01-15 06:36:31', 'Logged in successfully', 'Logged out successfully', '162.158.163.172', '162.158.162.48', '162.158.163.172', '162.158.162.48', '2025-01-15 10:22:13', '2025-01-15 12:06:31'),
	(93, 9, 2, '2025-01-15 05:02:19', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-15 10:32:19', NULL),
	(94, 7, 2, '2025-01-15 05:08:13', '2025-01-15 05:22:56', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.162.75', '162.158.162.48', '162.158.162.75', '2025-01-15 10:38:13', '2025-01-15 10:52:56'),
	(95, 1, 1, '2025-01-15 05:09:33', NULL, 'Logged in successfully', NULL, '162.158.162.128', NULL, '162.158.162.128', NULL, '2025-01-15 10:39:33', NULL),
	(96, 1, 1, '2025-01-15 05:32:17', NULL, 'Logged in successfully', NULL, '162.158.162.118', NULL, '162.158.162.118', NULL, '2025-01-15 11:02:17', NULL),
	(97, 1, 1, '2025-01-15 06:25:28', NULL, 'Logged in successfully', NULL, '172.69.165.51', NULL, '172.69.165.51', NULL, '2025-01-15 11:55:28', NULL),
	(98, 1, 1, '2025-01-15 06:36:39', '2025-01-15 07:52:28', 'Logged in successfully', 'Logged out successfully', '162.158.162.49', '162.158.162.48', '162.158.162.49', '162.158.162.48', '2025-01-15 12:06:39', '2025-01-15 13:22:28'),
	(99, 1, 1, '2025-01-15 09:44:03', '2025-01-15 10:45:28', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.163.176', '162.158.162.87', '162.158.163.176', '2025-01-15 15:14:03', '2025-01-15 16:15:28'),
	(100, 1, 1, '2025-01-15 10:36:38', '2025-01-15 12:41:20', 'Logged in successfully', 'Logged out successfully', '162.158.162.29', '162.158.162.48', '162.158.162.29', '162.158.162.48', '2025-01-15 16:06:38', '2025-01-15 18:11:20'),
	(101, 1, 1, '2025-01-15 11:02:27', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-15 16:32:27', NULL),
	(102, 6, 2, '2025-01-15 11:57:19', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-15 17:27:19', NULL),
	(103, 1, 1, '2025-01-15 12:37:45', '2025-01-15 12:41:10', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.176', '162.158.163.176', '162.158.163.176', '2025-01-15 18:07:45', '2025-01-15 18:11:10'),
	(104, 1, 1, '2025-01-16 03:30:04', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-16 09:00:04', NULL),
	(105, 1, 1, '2025-01-16 04:30:54', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-16 10:00:54', NULL),
	(106, 1, 1, '2025-01-16 04:44:45', '2025-01-16 11:58:19', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.162.49', '162.158.163.176', '162.158.162.49', '2025-01-16 10:14:45', '2025-01-16 17:28:19'),
	(107, 6, 2, '2025-01-16 05:19:23', NULL, 'Logged in successfully', NULL, '172.69.165.11', NULL, '172.69.165.11', NULL, '2025-01-16 10:49:23', NULL),
	(108, 1, 1, '2025-01-16 05:36:48', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-16 11:06:48', NULL),
	(109, 6, 2, '2025-01-16 06:31:31', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-16 12:01:31', NULL),
	(110, 6, 2, '2025-01-16 06:32:16', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-16 12:02:16', NULL),
	(111, 6, 2, '2025-01-16 07:05:53', NULL, 'Logged in successfully', NULL, '162.158.162.171', NULL, '162.158.162.171', NULL, '2025-01-16 12:35:53', NULL),
	(112, 1, 1, '2025-01-16 07:39:55', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-16 13:09:55', NULL),
	(113, 1, 1, '2025-01-16 10:18:39', '2025-01-16 12:08:34', 'Logged in successfully', 'Logged out successfully', '162.158.163.175', '162.158.163.152', '162.158.163.175', '162.158.163.152', '2025-01-16 15:48:39', '2025-01-16 17:38:34'),
	(114, 8, 2, '2025-01-16 10:38:54', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-16 16:08:54', NULL),
	(115, 8, 2, '2025-01-16 10:49:56', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-16 16:19:56', NULL),
	(116, 6, 2, '2025-01-17 04:41:36', NULL, 'Logged in successfully', NULL, '162.158.162.170', NULL, '162.158.162.170', NULL, '2025-01-17 10:11:36', NULL),
	(117, 6, 2, '2025-01-17 04:44:57', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-17 10:14:57', NULL),
	(118, 1, 1, '2025-01-17 05:26:23', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-17 10:56:23', NULL),
	(119, 1, 1, '2025-01-17 05:31:33', NULL, 'Logged in successfully', NULL, '162.158.162.103', NULL, '162.158.162.103', NULL, '2025-01-17 11:01:33', NULL),
	(120, 8, 2, '2025-01-17 05:35:41', '2025-01-17 05:38:40', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.163.151', '162.158.162.86', '162.158.163.151', '2025-01-17 11:05:41', '2025-01-17 11:08:40'),
	(121, 1, 1, '2025-01-17 05:37:11', '2025-01-17 05:57:52', 'Logged in successfully', 'Logged out successfully', '162.158.162.67', '162.158.162.86', '162.158.162.67', '162.158.162.86', '2025-01-17 11:07:11', '2025-01-17 11:27:52'),
	(122, 13, 2, '2025-01-17 05:39:42', '2025-01-17 05:58:22', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.162.87', '162.158.162.86', '162.158.162.87', '2025-01-17 11:09:42', '2025-01-17 11:28:22'),
	(123, 1, 1, '2025-01-17 05:58:05', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-17 11:28:05', NULL),
	(124, 13, 2, '2025-01-17 05:58:40', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-17 11:28:40', NULL),
	(125, 8, 2, '2025-01-17 05:59:20', '2025-01-17 06:01:25', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.176', '162.158.163.176', '162.158.163.176', '2025-01-17 11:29:20', '2025-01-17 11:31:25'),
	(126, 1, 1, '2025-01-17 06:02:11', NULL, 'Logged in successfully', NULL, '162.158.162.129', NULL, '162.158.162.129', NULL, '2025-01-17 11:32:11', NULL),
	(127, 1, 1, '2025-01-17 06:09:24', '2025-01-17 08:42:58', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.162.87', '162.158.162.87', '162.158.162.87', '2025-01-17 11:39:24', '2025-01-17 14:12:58'),
	(128, 6, 2, '2025-01-17 06:15:05', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-17 11:45:05', NULL),
	(129, 6, 2, '2025-01-17 06:37:12', '2025-01-17 06:42:36', 'Logged in successfully', 'Logged out successfully', '162.158.163.91', '162.158.162.102', '162.158.163.91', '162.158.162.102', '2025-01-17 12:07:12', '2025-01-17 12:12:36'),
	(130, 6, 2, '2025-01-17 06:39:07', NULL, 'Logged in successfully', NULL, '162.158.162.48', NULL, '162.158.162.48', NULL, '2025-01-17 12:09:07', NULL),
	(131, 6, 2, '2025-01-17 06:42:53', '2025-01-17 06:43:50', 'Logged in successfully', 'Logged out successfully', '172.69.165.50', '162.158.163.244', '172.69.165.50', '162.158.163.244', '2025-01-17 12:12:53', '2025-01-17 12:13:50'),
	(132, 6, 2, '2025-01-17 07:01:19', NULL, 'Logged in successfully', NULL, '162.158.162.66', NULL, '162.158.162.66', NULL, '2025-01-17 12:31:19', NULL),
	(133, 6, 2, '2025-01-17 07:36:01', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-17 13:06:01', NULL),
	(134, 6, 2, '2025-01-17 07:40:46', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-17 13:10:46', NULL),
	(135, 6, 2, '2025-01-17 08:44:48', '2025-01-17 09:18:13', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.162.83', '162.158.163.176', '162.158.162.83', '2025-01-17 14:14:48', '2025-01-17 14:48:13'),
	(136, 6, 2, '2025-01-17 09:28:41', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-17 14:58:41', NULL),
	(137, 6, 2, '2025-01-17 09:36:37', '2025-01-17 09:39:24', 'Logged in successfully', 'Logged out successfully', '162.158.162.49', '162.158.162.49', '162.158.162.49', '162.158.162.49', '2025-01-17 15:06:37', '2025-01-17 15:09:24'),
	(138, 6, 2, '2025-01-18 07:51:19', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-18 13:21:19', NULL),
	(139, 1, 1, '2025-01-19 05:22:08', '2025-01-19 05:43:36', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.163.175', '162.158.162.87', '162.158.163.175', '2025-01-19 10:52:08', '2025-01-19 11:13:36'),
	(140, 6, 2, '2025-01-20 05:00:23', '2025-01-20 05:30:43', 'Logged in successfully', 'Logged out successfully', '162.158.163.152', '162.158.162.67', '162.158.163.152', '162.158.162.67', '2025-01-20 10:30:23', '2025-01-20 11:00:43'),
	(141, 1, 1, '2025-01-20 05:01:48', '2025-01-20 12:22:36', 'Logged in successfully', 'Logged out successfully', '162.158.163.152', '162.158.162.87', '162.158.163.152', '162.158.162.87', '2025-01-20 10:31:48', '2025-01-20 17:52:36'),
	(142, 6, 2, '2025-01-20 05:34:58', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-20 11:04:58', NULL),
	(143, 5, 2, '2025-01-20 05:47:30', NULL, 'Logged in successfully', NULL, '162.158.162.103', NULL, '162.158.162.103', NULL, '2025-01-20 11:17:30', NULL),
	(144, 6, 2, '2025-01-20 05:55:00', NULL, 'Logged in successfully', NULL, '162.158.162.29', NULL, '162.158.162.29', NULL, '2025-01-20 11:25:00', NULL),
	(145, 6, 2, '2025-01-20 06:39:11', NULL, 'Logged in successfully', NULL, '162.158.163.243', NULL, '162.158.163.243', NULL, '2025-01-20 12:09:11', NULL),
	(146, 12, 2, '2025-01-20 07:38:42', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-20 13:08:42', NULL),
	(147, 6, 2, '2025-01-20 08:44:58', '2025-01-20 09:10:15', 'Logged in successfully', 'Logged out successfully', '162.158.163.78', '162.158.162.108', '162.158.163.78', '162.158.162.108', '2025-01-20 14:14:58', '2025-01-20 14:40:15'),
	(148, 5, 2, '2025-01-20 09:20:15', NULL, 'Logged in successfully', NULL, '172.69.165.63', NULL, '172.69.165.63', NULL, '2025-01-20 14:50:15', NULL),
	(149, 1, 1, '2025-01-20 10:16:55', '2025-01-20 12:16:49', 'Logged in successfully', 'Logged out successfully', '162.158.163.175', '162.158.162.82', '162.158.163.175', '162.158.162.82', '2025-01-20 15:46:55', '2025-01-20 17:46:49'),
	(150, 6, 2, '2025-01-20 11:47:01', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-20 17:17:01', NULL),
	(151, 5, 2, '2025-01-20 11:55:21', '2025-01-20 12:06:12', 'Logged in successfully', 'Logged out successfully', '162.158.163.151', '162.158.163.176', '162.158.163.151', '162.158.163.176', '2025-01-20 17:25:21', '2025-01-20 17:36:12'),
	(152, 3, 2, '2025-01-20 12:18:01', NULL, 'Logged in successfully', NULL, '162.158.163.165', NULL, '162.158.163.165', NULL, '2025-01-20 17:48:01', NULL),
	(153, 9, 2, '2025-01-20 12:25:24', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-20 17:55:24', NULL),
	(154, 1, 1, '2025-01-20 16:17:14', '2025-01-20 16:39:25', 'Logged in successfully', 'Logged out successfully', '172.69.165.50', '162.158.163.175', '172.69.165.50', '162.158.163.175', '2025-01-20 21:47:14', '2025-01-20 22:09:25'),
	(155, 8, 2, '2025-01-20 16:22:40', NULL, 'Logged in successfully', NULL, '162.158.162.48', NULL, '162.158.162.48', NULL, '2025-01-20 21:52:40', NULL),
	(156, 15, 2, '2025-01-20 16:39:42', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-20 22:09:42', NULL),
	(157, 9, 2, '2025-01-21 04:17:06', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-21 09:47:06', NULL),
	(158, 9, 2, '2025-01-21 04:19:28', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-21 09:49:28', NULL),
	(159, 5, 2, '2025-01-21 04:22:58', NULL, 'Logged in successfully', NULL, '162.158.163.92', NULL, '162.158.163.92', NULL, '2025-01-21 09:52:58', NULL),
	(160, 9, 2, '2025-01-21 04:34:58', NULL, 'Logged in successfully', NULL, '162.158.163.82', NULL, '162.158.163.82', NULL, '2025-01-21 10:04:58', NULL),
	(161, 6, 2, '2025-01-21 04:40:12', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-21 10:10:12', NULL),
	(162, 1, 1, '2025-01-21 04:43:21', '2025-01-21 12:10:31', 'Logged in successfully', 'Logged out successfully', '162.158.162.118', '162.158.163.151', '162.158.162.118', '162.158.163.151', '2025-01-21 10:13:21', '2025-01-21 17:40:31'),
	(163, 6, 2, '2025-01-21 04:51:19', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-21 10:21:19', NULL),
	(164, 17, 2, '2025-01-21 05:00:33', '2025-01-21 05:08:16', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.162.86', '162.158.162.87', '162.158.162.86', '2025-01-21 10:30:33', '2025-01-21 10:38:16'),
	(165, 18, 2, '2025-01-21 05:03:31', '2025-01-21 05:28:41', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.163.165', '162.158.162.48', '162.158.163.165', '2025-01-21 10:33:31', '2025-01-21 10:58:41'),
	(166, 15, 2, '2025-01-21 05:15:04', '2025-01-21 06:10:46', 'Logged in successfully', 'Logged out successfully', '162.158.162.207', '162.158.162.86', '162.158.162.207', '162.158.162.86', '2025-01-21 10:45:04', '2025-01-21 11:40:46'),
	(167, 6, 2, '2025-01-21 05:15:15', '2025-01-21 06:22:08', 'Logged in successfully', 'Logged out successfully', '162.158.162.29', '162.158.162.48', '162.158.162.29', '162.158.162.48', '2025-01-21 10:45:15', '2025-01-21 11:52:08'),
	(168, 12, 2, '2025-01-21 05:15:48', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-21 10:45:48', NULL),
	(169, 15, 2, '2025-01-21 05:17:17', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-21 10:47:17', NULL),
	(170, 15, 2, '2025-01-21 05:19:14', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-21 10:49:14', NULL),
	(171, 15, 2, '2025-01-21 05:20:08', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-21 10:50:08', NULL),
	(172, 18, 2, '2025-01-21 05:31:41', '2025-01-21 05:36:50', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.175', '162.158.163.176', '162.158.163.175', '2025-01-21 11:01:41', '2025-01-21 11:06:50'),
	(173, 17, 2, '2025-01-21 05:38:21', '2025-01-21 05:44:23', 'Logged in successfully', 'Logged out successfully', '162.158.162.29', '162.158.162.48', '162.158.162.29', '162.158.162.48', '2025-01-21 11:08:21', '2025-01-21 11:14:23'),
	(174, 10, 2, '2025-01-21 05:40:02', '2025-01-21 06:42:41', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.163.190', '162.158.162.86', '162.158.163.190', '2025-01-21 11:10:02', '2025-01-21 12:12:41'),
	(175, 18, 2, '2025-01-21 05:44:41', '2025-01-21 06:08:23', 'Logged in successfully', 'Logged out successfully', '162.158.163.92', '172.69.165.63', '162.158.163.92', '172.69.165.63', '2025-01-21 11:14:41', '2025-01-21 11:38:23'),
	(176, 1, 1, '2025-01-21 06:10:26', '2025-01-21 06:21:57', 'Logged in successfully', 'Logged out successfully', '162.158.163.78', '162.158.163.221', '162.158.163.78', '162.158.163.221', '2025-01-21 11:40:26', '2025-01-21 11:51:57'),
	(177, 3, 2, '2025-01-21 06:16:05', NULL, 'Logged in successfully', NULL, '162.158.162.170', NULL, '162.158.162.170', NULL, '2025-01-21 11:46:05', NULL),
	(178, 18, 2, '2025-01-21 06:36:26', '2025-01-21 07:42:40', 'Logged in successfully', 'Logged out successfully', '162.158.163.221', '162.158.163.248', '162.158.163.221', '162.158.163.248', '2025-01-21 12:06:26', '2025-01-21 13:12:40'),
	(179, 6, 2, '2025-01-21 06:52:27', '2025-01-21 06:56:48', 'Logged in successfully', 'Logged out successfully', '162.158.162.170', '162.158.163.152', '162.158.162.170', '162.158.163.152', '2025-01-21 12:22:27', '2025-01-21 12:26:48'),
	(180, 12, 2, '2025-01-21 07:00:03', NULL, 'Logged in successfully', NULL, '162.158.163.78', NULL, '162.158.163.78', NULL, '2025-01-21 12:30:03', NULL),
	(181, 6, 2, '2025-01-21 07:10:17', '2025-01-21 08:25:13', 'Logged in successfully', 'Logged out successfully', '162.158.163.151', '162.158.163.175', '162.158.163.151', '162.158.163.175', '2025-01-21 12:40:17', '2025-01-21 13:55:13'),
	(182, 8, 2, '2025-01-21 07:30:56', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-21 13:00:56', NULL),
	(183, 10, 2, '2025-01-21 07:44:32', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-21 13:14:32', NULL),
	(184, 15, 2, '2025-01-21 08:17:34', NULL, 'Logged in successfully', NULL, '162.158.162.28', NULL, '162.158.162.28', NULL, '2025-01-21 13:47:34', NULL),
	(185, 15, 2, '2025-01-21 08:20:53', NULL, 'Logged in successfully', NULL, '162.158.162.74', NULL, '162.158.162.74', NULL, '2025-01-21 13:50:53', NULL),
	(186, 1, 1, '2025-01-21 08:49:41', '2025-01-21 09:03:53', 'Logged in successfully', 'Logged out successfully', '162.158.162.82', '162.158.162.48', '162.158.162.82', '162.158.162.48', '2025-01-21 14:19:41', '2025-01-21 14:33:53'),
	(187, 6, 2, '2025-01-21 08:54:00', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-21 14:24:00', NULL),
	(188, 1, 1, '2025-01-21 08:59:16', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-21 14:29:16', NULL),
	(189, 10, 2, '2025-01-21 09:07:08', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-21 14:37:08', NULL),
	(190, 14, 2, '2025-01-21 09:16:27', NULL, 'Logged in successfully', NULL, '162.158.162.82', NULL, '162.158.162.82', NULL, '2025-01-21 14:46:27', NULL),
	(191, 6, 2, '2025-01-21 09:28:52', '2025-01-21 09:47:08', 'Logged in successfully', 'Logged out successfully', '162.158.163.20', '162.158.162.108', '162.158.163.20', '162.158.162.108', '2025-01-21 14:58:52', '2025-01-21 15:17:08'),
	(192, 17, 2, '2025-01-21 09:32:20', '2025-01-21 09:43:29', 'Logged in successfully', 'Logged out successfully', '162.158.162.102', '162.158.162.103', '162.158.162.102', '162.158.162.103', '2025-01-21 15:02:20', '2025-01-21 15:13:29'),
	(193, 6, 2, '2025-01-21 09:33:50', NULL, 'Logged in successfully', NULL, '162.158.162.103', NULL, '162.158.162.103', NULL, '2025-01-21 15:03:50', NULL),
	(194, 6, 2, '2025-01-21 09:37:49', NULL, 'Logged in successfully', NULL, '162.158.162.170', NULL, '162.158.162.170', NULL, '2025-01-21 15:07:49', NULL),
	(195, 18, 2, '2025-01-21 09:44:08', '2025-01-21 09:52:47', 'Logged in successfully', 'Logged out successfully', '162.158.162.102', '162.158.162.86', '162.158.162.102', '162.158.162.86', '2025-01-21 15:14:08', '2025-01-21 15:22:47'),
	(196, 18, 2, '2025-01-21 09:51:56', '2025-01-21 10:49:43', 'Logged in successfully', 'Logged out successfully', '162.158.163.86', '162.158.162.48', '162.158.163.86', '162.158.162.48', '2025-01-21 15:21:56', '2025-01-21 16:19:43'),
	(197, 17, 2, '2025-01-21 09:53:18', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-21 15:23:18', NULL),
	(198, 1, 1, '2025-01-21 10:57:02', NULL, 'Logged in successfully', NULL, '162.158.162.102', NULL, '162.158.162.102', NULL, '2025-01-21 16:27:02', NULL),
	(199, 5, 2, '2025-01-21 11:33:47', '2025-01-21 11:57:38', 'Logged in successfully', 'Logged out successfully', '162.158.163.151', '162.158.163.151', '162.158.163.151', '162.158.163.151', '2025-01-21 17:03:47', '2025-01-21 17:27:38'),
	(200, 6, 2, '2025-01-21 11:55:58', NULL, 'Logged in successfully', NULL, '162.158.163.171', NULL, '162.158.163.171', NULL, '2025-01-21 17:25:58', NULL),
	(201, 6, 2, '2025-01-21 12:32:37', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-21 18:02:37', NULL),
	(202, 18, 2, '2025-01-21 15:58:16', NULL, 'Logged in successfully', NULL, '172.69.165.50', NULL, '172.69.165.50', NULL, '2025-01-21 21:28:16', NULL),
	(203, 1, 1, '2025-01-21 18:39:52', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-22 00:09:52', NULL),
	(204, 1, 1, '2025-01-22 04:42:48', '2025-01-22 07:12:34', 'Logged in successfully', 'Logged out successfully', '162.158.163.102', '162.158.162.29', '162.158.163.102', '162.158.162.29', '2025-01-22 10:12:48', '2025-01-22 12:42:34'),
	(205, 5, 2, '2025-01-22 04:45:18', NULL, 'Logged in successfully', NULL, '172.69.165.63', NULL, '172.69.165.63', NULL, '2025-01-22 10:15:18', NULL),
	(206, 6, 2, '2025-01-22 04:49:43', NULL, 'Logged in successfully', NULL, '162.158.162.104', NULL, '162.158.162.104', NULL, '2025-01-22 10:19:43', NULL),
	(207, 6, 2, '2025-01-22 05:06:24', NULL, 'Logged in successfully', NULL, '162.158.162.123', NULL, '162.158.162.123', NULL, '2025-01-22 10:36:24', NULL),
	(208, 18, 2, '2025-01-22 05:29:34', '2025-01-22 05:45:27', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.163.176', '162.158.162.86', '162.158.163.176', '2025-01-22 10:59:34', '2025-01-22 11:15:27'),
	(209, 1, 1, '2025-01-22 05:48:48', NULL, 'Logged in successfully', NULL, '172.69.165.50', NULL, '172.69.165.50', NULL, '2025-01-22 11:18:48', NULL),
	(210, 17, 2, '2025-01-22 05:50:10', '2025-01-22 07:38:10', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.151', '162.158.163.176', '162.158.163.151', '2025-01-22 11:20:10', '2025-01-22 13:08:10'),
	(211, 4, 2, '2025-01-22 05:59:18', NULL, 'Logged in successfully', NULL, '162.158.163.72', NULL, '162.158.163.72', NULL, '2025-01-22 11:29:18', NULL),
	(212, 1, 1, '2025-01-22 06:03:50', NULL, 'Logged in successfully', NULL, '162.158.163.109', NULL, '162.158.163.109', NULL, '2025-01-22 11:33:50', NULL),
	(213, 6, 2, '2025-01-22 06:13:37', '2025-01-22 06:26:15', 'Logged in successfully', 'Logged out successfully', '162.158.162.49', '162.158.162.238', '162.158.162.49', '162.158.162.238', '2025-01-22 11:43:37', '2025-01-22 11:56:15'),
	(214, 6, 2, '2025-01-22 06:13:49', NULL, 'Logged in successfully', NULL, '162.158.162.245', NULL, '162.158.162.245', NULL, '2025-01-22 11:43:49', NULL),
	(215, 1, 1, '2025-01-22 06:39:24', NULL, 'Logged in successfully', NULL, '162.158.163.102', NULL, '162.158.163.102', NULL, '2025-01-22 12:09:24', NULL),
	(216, 18, 2, '2025-01-22 06:39:56', NULL, 'Logged in successfully', NULL, '162.158.163.89', NULL, '162.158.163.89', NULL, '2025-01-22 12:09:56', NULL),
	(217, 1, 1, '2025-01-22 07:01:43', '2025-01-22 07:05:35', 'Logged in successfully', 'Logged out successfully', '162.158.163.159', '162.158.162.92', '162.158.163.159', '162.158.162.92', '2025-01-22 12:31:43', '2025-01-22 12:35:35'),
	(218, 12, 2, '2025-01-22 07:13:34', '2025-01-22 08:15:13', 'Logged in successfully', 'Logged out successfully', '162.158.162.29', '162.158.162.106', '162.158.162.29', '162.158.162.106', '2025-01-22 12:43:34', '2025-01-22 13:45:13'),
	(219, 3, 2, '2025-01-22 07:28:21', '2025-01-22 07:46:26', 'Logged in successfully', 'Logged out successfully', '162.158.163.152', '162.158.163.128', '162.158.163.152', '162.158.163.128', '2025-01-22 12:58:21', '2025-01-22 13:16:26'),
	(220, 17, 2, '2025-01-22 07:28:47', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-22 12:58:47', NULL),
	(221, 18, 2, '2025-01-22 07:38:25', '2025-01-22 07:46:46', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.162.206', '162.158.162.48', '162.158.162.206', '2025-01-22 13:08:25', '2025-01-22 13:16:46'),
	(222, 9, 2, '2025-01-22 07:45:05', NULL, 'Logged in successfully', NULL, '162.158.163.106', NULL, '162.158.163.106', NULL, '2025-01-22 13:15:05', NULL),
	(223, 15, 2, '2025-01-22 07:46:47', NULL, 'Logged in successfully', NULL, '162.158.163.127', NULL, '162.158.163.127', NULL, '2025-01-22 13:16:47', NULL),
	(224, 3, 2, '2025-01-22 07:47:06', NULL, 'Logged in successfully', NULL, '162.158.162.19', NULL, '162.158.162.19', NULL, '2025-01-22 13:17:06', NULL),
	(225, 17, 2, '2025-01-22 07:52:33', NULL, 'Logged in successfully', NULL, '162.158.163.90', NULL, '162.158.163.90', NULL, '2025-01-22 13:22:33', NULL),
	(226, 17, 2, '2025-01-22 07:57:01', NULL, 'Logged in successfully', NULL, '162.158.162.61', NULL, '162.158.162.61', NULL, '2025-01-22 13:27:01', NULL),
	(227, 1, 1, '2025-01-22 08:07:03', NULL, 'Logged in successfully', NULL, '162.158.163.89', NULL, '162.158.163.89', NULL, '2025-01-22 13:37:03', NULL),
	(228, 14, 2, '2025-01-22 08:11:38', NULL, 'Logged in successfully', NULL, '162.158.163.239', NULL, '162.158.163.239', NULL, '2025-01-22 13:41:38', NULL),
	(229, 10, 2, '2025-01-22 08:14:13', NULL, 'Logged in successfully', NULL, '162.158.162.32', NULL, '162.158.162.32', NULL, '2025-01-22 13:44:13', NULL),
	(230, 1, 1, '2025-01-22 08:15:23', '2025-01-22 12:07:57', 'Logged in successfully', 'Logged out successfully', '162.158.162.107', '162.158.163.93', '162.158.162.107', '162.158.163.93', '2025-01-22 13:45:23', '2025-01-22 17:37:57'),
	(231, 1, 1, '2025-01-22 09:47:24', NULL, 'Logged in successfully', NULL, '162.158.162.185', NULL, '162.158.162.185', NULL, '2025-01-22 15:17:24', NULL),
	(232, 6, 2, '2025-01-22 10:52:42', NULL, 'Logged in successfully', NULL, '162.158.162.108', NULL, '162.158.162.108', NULL, '2025-01-22 16:22:42', NULL),
	(233, 12, 2, '2025-01-22 10:54:22', NULL, 'Logged in successfully', NULL, '162.158.163.129', NULL, '162.158.163.129', NULL, '2025-01-22 16:24:22', NULL),
	(234, 1, 1, '2025-01-22 17:38:06', NULL, 'Logged in successfully', NULL, '162.158.163.89', NULL, '162.158.163.89', NULL, '2025-01-22 23:08:06', NULL),
	(235, 13, 2, '2025-01-23 04:37:11', NULL, 'Logged in successfully', NULL, '162.158.162.66', NULL, '162.158.162.66', NULL, '2025-01-23 10:07:11', NULL),
	(236, 1, 1, '2025-01-23 04:37:49', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-23 10:07:49', NULL),
	(237, 18, 2, '2025-01-23 04:57:48', '2025-01-23 04:57:52', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.162.86', '162.158.162.86', '162.158.162.86', '2025-01-23 10:27:48', '2025-01-23 10:27:52'),
	(238, 6, 2, '2025-01-23 05:04:50', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-23 10:34:50', NULL),
	(239, 1, 1, '2025-01-23 05:23:07', NULL, 'Logged in successfully', NULL, '162.158.162.103', NULL, '162.158.162.103', NULL, '2025-01-23 10:53:07', NULL),
	(240, 1, 1, '2025-01-23 05:47:35', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-23 11:17:35', NULL),
	(241, 12, 2, '2025-01-23 06:43:42', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-23 12:13:42', NULL),
	(242, 6, 2, '2025-01-23 06:57:25', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-23 12:27:25', NULL),
	(243, 18, 2, '2025-01-23 07:51:51', '2025-01-23 07:52:16', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.162.48', '162.158.162.48', '162.158.162.48', '2025-01-23 13:21:51', '2025-01-23 13:22:16'),
	(244, 5, 2, '2025-01-23 09:34:34', '2025-01-23 11:40:17', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.163.172', '162.158.162.86', '162.158.163.172', '2025-01-23 15:04:34', '2025-01-23 17:10:17'),
	(245, 16, 2, '2025-01-23 09:51:50', NULL, 'Logged in successfully', NULL, '172.69.165.11', NULL, '172.69.165.11', NULL, '2025-01-23 15:21:50', NULL),
	(246, 6, 2, '2025-01-23 11:33:32', NULL, 'Logged in successfully', NULL, '162.158.163.172', NULL, '162.158.163.172', NULL, '2025-01-23 17:03:32', NULL),
	(247, 1, 1, '2025-01-23 11:59:40', NULL, 'Logged in successfully', NULL, '162.158.163.189', NULL, '162.158.163.189', NULL, '2025-01-23 17:29:40', NULL),
	(248, 1, 1, '2025-01-23 12:00:19', '2025-01-23 12:48:08', 'Logged in successfully', 'Logged out successfully', '162.158.163.244', '162.158.163.151', '162.158.163.244', '162.158.163.151', '2025-01-23 17:30:19', '2025-01-23 18:18:08'),
	(249, 1, 1, '2025-01-23 12:14:17', NULL, 'Logged in successfully', NULL, '162.158.163.243', NULL, '162.158.163.243', NULL, '2025-01-23 17:44:17', NULL),
	(250, 1, 1, '2025-01-24 04:43:35', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-24 10:13:35', NULL),
	(251, 17, 2, '2025-01-24 05:16:34', '2025-01-24 05:43:24', 'Logged in successfully', 'Logged out successfully', '162.158.163.127', '162.158.163.127', '162.158.163.127', '162.158.163.127', '2025-01-24 10:46:34', '2025-01-24 11:13:24'),
	(252, 5, 2, '2025-01-24 05:30:01', NULL, 'Logged in successfully', NULL, '162.158.162.182', NULL, '162.158.162.182', NULL, '2025-01-24 11:00:01', NULL),
	(253, 6, 2, '2025-01-24 05:32:28', '2025-01-24 05:57:37', 'Logged in successfully', 'Logged out successfully', '162.158.162.183', '162.158.163.148', '162.158.162.183', '162.158.163.148', '2025-01-24 11:02:28', '2025-01-24 11:27:37'),
	(254, 12, 2, '2025-01-24 06:12:52', NULL, 'Logged in successfully', NULL, '162.158.162.174', NULL, '162.158.162.174', NULL, '2025-01-24 11:42:52', NULL),
	(255, 1, 1, '2025-01-24 06:16:12', NULL, 'Logged in successfully', NULL, '162.158.163.147', NULL, '162.158.163.147', NULL, '2025-01-24 11:46:12', NULL),
	(256, 1, 1, '2025-01-24 06:37:28', NULL, 'Logged in successfully', NULL, '162.158.162.182', NULL, '162.158.162.182', NULL, '2025-01-24 12:07:28', NULL),
	(257, 6, 2, '2025-01-24 06:38:31', NULL, 'Logged in successfully', NULL, '162.158.162.182', NULL, '162.158.162.182', NULL, '2025-01-24 12:08:31', NULL),
	(258, 6, 2, '2025-01-24 06:49:24', NULL, 'Logged in successfully', NULL, '162.158.163.160', NULL, '162.158.163.160', NULL, '2025-01-24 12:19:24', NULL),
	(259, 1, 1, '2025-01-24 06:53:43', '2025-01-24 06:56:42', 'Logged in successfully', 'Logged out successfully', '162.158.162.182', '162.158.162.183', '162.158.162.182', '162.158.162.183', '2025-01-24 12:23:43', '2025-01-24 12:26:42'),
	(260, 6, 2, '2025-01-24 07:11:59', NULL, 'Logged in successfully', NULL, '162.158.162.54', NULL, '162.158.162.54', NULL, '2025-01-24 12:41:59', NULL),
	(261, 1, 1, '2025-01-24 07:12:43', NULL, 'Logged in successfully', NULL, '172.69.165.39', NULL, '172.69.165.39', NULL, '2025-01-24 12:42:43', NULL),
	(262, 1, 1, '2025-01-24 09:15:05', '2025-01-24 09:23:29', 'Logged in successfully', 'Logged out successfully', '162.158.162.49', '162.158.162.48', '162.158.162.49', '162.158.162.48', '2025-01-24 14:45:05', '2025-01-24 14:53:29'),
	(263, 6, 2, '2025-01-24 09:43:32', '2025-01-24 09:44:02', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.163.147', '162.158.162.48', '162.158.163.147', '2025-01-24 15:13:32', '2025-01-24 15:14:02'),
	(264, 17, 2, '2025-01-24 10:04:27', NULL, 'Logged in successfully', NULL, '162.158.163.159', NULL, '162.158.163.159', NULL, '2025-01-24 15:34:27', NULL),
	(265, 16, 2, '2025-01-24 10:47:08', NULL, 'Logged in successfully', NULL, '162.158.162.11', NULL, '162.158.162.11', NULL, '2025-01-24 16:17:08', NULL),
	(266, 5, 2, '2025-01-24 11:15:24', '2025-01-24 11:48:25', 'Logged in successfully', 'Logged out successfully', '162.158.162.183', '162.158.162.110', '162.158.162.183', '162.158.162.110', '2025-01-24 16:45:24', '2025-01-24 17:18:25'),
	(267, 1, 1, '2025-01-24 11:18:37', '2025-01-24 12:04:11', 'Logged in successfully', 'Logged out successfully', '162.158.162.175', '172.69.165.62', '162.158.162.175', '172.69.165.62', '2025-01-24 16:48:37', '2025-01-24 17:34:11'),
	(268, 12, 2, '2025-01-24 12:10:27', NULL, 'Logged in successfully', NULL, '172.69.165.63', NULL, '172.69.165.63', NULL, '2025-01-24 17:40:27', NULL),
	(269, 1, 1, '2025-01-24 19:35:52', NULL, 'Logged in successfully', NULL, '162.158.163.147', NULL, '162.158.163.147', NULL, '2025-01-25 01:05:52', NULL),
	(270, 6, 2, '2025-01-27 04:34:32', NULL, 'Logged in successfully', NULL, '162.158.162.175', NULL, '162.158.162.175', NULL, '2025-01-27 10:04:32', NULL),
	(271, 6, 2, '2025-01-27 04:46:26', NULL, 'Logged in successfully', NULL, '162.158.163.148', NULL, '162.158.163.148', NULL, '2025-01-27 10:16:26', NULL),
	(272, 6, 2, '2025-01-27 04:52:50', NULL, 'Logged in successfully', NULL, '162.158.163.148', NULL, '162.158.163.148', NULL, '2025-01-27 10:22:50', NULL),
	(273, 6, 2, '2025-01-27 04:55:38', NULL, 'Logged in successfully', NULL, '172.69.165.29', NULL, '172.69.165.29', NULL, '2025-01-27 10:25:38', NULL),
	(274, 6, 2, '2025-01-27 05:00:29', '2025-01-27 06:14:59', 'Logged in successfully', 'Logged out successfully', '162.158.162.182', '162.158.162.29', '162.158.162.182', '162.158.162.29', '2025-01-27 10:30:29', '2025-01-27 11:44:59'),
	(275, 5, 2, '2025-01-27 05:01:11', NULL, 'Logged in successfully', NULL, '162.158.162.182', NULL, '162.158.162.182', NULL, '2025-01-27 10:31:11', NULL),
	(276, 1, 1, '2025-01-27 05:11:48', NULL, 'Logged in successfully', NULL, '162.158.162.110', NULL, '162.158.162.110', NULL, '2025-01-27 10:41:48', NULL),
	(277, 12, 2, '2025-01-27 05:23:41', NULL, 'Logged in successfully', NULL, '162.158.162.175', NULL, '162.158.162.175', NULL, '2025-01-27 10:53:41', NULL),
	(278, 17, 2, '2025-01-27 06:16:31', NULL, 'Logged in successfully', NULL, '162.158.163.2', NULL, '162.158.163.2', NULL, '2025-01-27 11:46:31', NULL),
	(279, 12, 2, '2025-01-27 06:17:06', NULL, 'Logged in successfully', NULL, '162.158.162.183', NULL, '162.158.162.183', NULL, '2025-01-27 11:47:06', NULL),
	(280, 17, 2, '2025-01-27 06:36:33', NULL, 'Logged in successfully', NULL, '172.69.165.38', NULL, '172.69.165.38', NULL, '2025-01-27 12:06:33', NULL),
	(281, 16, 2, '2025-01-27 07:08:19', NULL, 'Logged in successfully', NULL, '162.158.162.128', NULL, '162.158.162.128', NULL, '2025-01-27 12:38:19', NULL),
	(282, 1, 1, '2025-01-27 08:41:55', '2025-01-27 11:38:06', 'Logged in successfully', 'Logged out successfully', '162.158.162.93', '162.158.163.247', '162.158.162.93', '162.158.163.247', '2025-01-27 14:11:55', '2025-01-27 17:08:06'),
	(283, 12, 2, '2025-01-27 10:22:43', NULL, 'Logged in successfully', NULL, '162.158.162.129', NULL, '162.158.162.129', NULL, '2025-01-27 15:52:43', NULL),
	(284, 6, 2, '2025-01-27 10:58:32', NULL, 'Logged in successfully', NULL, '172.69.165.37', NULL, '172.69.165.37', NULL, '2025-01-27 16:28:32', NULL),
	(285, 6, 2, '2025-01-27 12:42:59', NULL, 'Logged in successfully', NULL, '162.158.163.147', NULL, '162.158.163.147', NULL, '2025-01-27 18:12:59', NULL),
	(286, 1, 1, '2025-01-27 16:01:33', '2025-01-27 16:03:45', 'Logged in successfully', 'Logged out successfully', '162.158.162.244', '162.158.162.111', '162.158.162.244', '162.158.162.111', '2025-01-27 21:31:33', '2025-01-27 21:33:45'),
	(287, 18, 2, '2025-01-27 16:23:28', '2025-01-27 16:24:00', 'Logged in successfully', 'Logged out successfully', '162.158.163.206', '162.158.163.206', '162.158.163.206', '162.158.163.206', '2025-01-27 21:53:28', '2025-01-27 21:54:00'),
	(288, 5, 2, '2025-01-27 17:04:04', NULL, 'Logged in successfully', NULL, '172.69.165.39', NULL, '172.69.165.39', NULL, '2025-01-27 22:34:04', NULL),
	(289, 1, 1, '2025-01-28 04:47:58', '2025-01-28 07:52:09', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.77', '162.158.163.176', '162.158.163.77', '2025-01-28 10:17:58', '2025-01-28 13:22:09'),
	(290, 6, 2, '2025-01-28 04:48:42', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-28 10:18:42', NULL),
	(291, 6, 2, '2025-01-28 04:52:06', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-28 10:22:06', NULL),
	(292, 6, 2, '2025-01-28 04:58:22', NULL, 'Logged in successfully', NULL, '162.158.162.67', NULL, '162.158.162.67', NULL, '2025-01-28 10:28:22', NULL),
	(293, 6, 2, '2025-01-28 04:59:09', NULL, 'Logged in successfully', NULL, '162.158.162.171', NULL, '162.158.162.171', NULL, '2025-01-28 10:29:09', NULL),
	(294, 5, 2, '2025-01-28 05:04:51', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-01-28 10:34:51', NULL),
	(295, 1, 1, '2025-01-28 05:23:33', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-28 10:53:33', NULL),
	(296, 12, 2, '2025-01-28 05:24:02', NULL, 'Logged in successfully', NULL, '162.158.162.83', NULL, '162.158.162.83', NULL, '2025-01-28 10:54:02', NULL),
	(297, 5, 2, '2025-01-28 06:04:39', NULL, 'Logged in successfully', NULL, '162.158.162.67', NULL, '162.158.162.67', NULL, '2025-01-28 11:34:39', NULL),
	(298, 1, 1, '2025-01-28 06:12:04', NULL, 'Logged in successfully', NULL, '162.158.162.170', NULL, '162.158.162.170', NULL, '2025-01-28 11:42:04', NULL),
	(299, 16, 2, '2025-01-28 06:40:02', NULL, 'Logged in successfully', NULL, '172.69.165.11', NULL, '172.69.165.11', NULL, '2025-01-28 12:10:02', NULL),
	(300, 18, 2, '2025-01-28 06:40:35', NULL, 'Logged in successfully', NULL, '162.158.162.67', NULL, '162.158.162.67', NULL, '2025-01-28 12:10:35', NULL),
	(301, 3, 2, '2025-01-28 06:40:52', '2025-01-28 06:42:56', 'Logged in successfully', 'Logged out successfully', '162.158.163.151', '162.158.162.86', '162.158.163.151', '162.158.162.86', '2025-01-28 12:10:52', '2025-01-28 12:12:56'),
	(302, 1, 1, '2025-01-28 06:43:25', '2025-01-28 07:15:19', 'Logged in successfully', 'Logged out successfully', '162.158.163.152', '162.158.163.82', '162.158.163.152', '162.158.163.82', '2025-01-28 12:13:25', '2025-01-28 12:45:19'),
	(303, 18, 2, '2025-01-28 06:44:20', '2025-01-28 06:44:55', 'Logged in successfully', 'Logged out successfully', '162.158.162.170', '162.158.163.222', '162.158.162.170', '162.158.163.222', '2025-01-28 12:14:20', '2025-01-28 12:14:55'),
	(304, 18, 2, '2025-01-28 06:45:40', '2025-01-28 06:45:46', 'Logged in successfully', 'Logged out successfully', '162.158.162.82', '162.158.162.82', '162.158.162.82', '162.158.162.82', '2025-01-28 12:15:40', '2025-01-28 12:15:46'),
	(305, 17, 2, '2025-01-28 06:46:02', '2025-01-28 06:48:05', 'Logged in successfully', 'Logged out successfully', '162.158.162.49', '162.158.163.152', '162.158.162.49', '162.158.163.152', '2025-01-28 12:16:02', '2025-01-28 12:18:05'),
	(306, 18, 2, '2025-01-28 06:48:25', '2025-01-28 06:51:26', 'Logged in successfully', 'Logged out successfully', '162.158.162.87', '162.158.162.66', '162.158.162.87', '162.158.162.66', '2025-01-28 12:18:25', '2025-01-28 12:21:26'),
	(307, 1, 1, '2025-01-28 06:50:07', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-28 12:20:07', NULL),
	(308, 17, 2, '2025-01-28 06:51:42', '2025-01-28 06:55:58', 'Logged in successfully', 'Logged out successfully', '162.158.163.221', '162.158.163.82', '162.158.163.221', '162.158.163.82', '2025-01-28 12:21:42', '2025-01-28 12:25:58'),
	(309, 18, 2, '2025-01-28 06:56:14', '2025-01-28 06:56:51', 'Logged in successfully', 'Logged out successfully', '162.158.163.247', '162.158.163.222', '162.158.163.247', '162.158.163.222', '2025-01-28 12:26:14', '2025-01-28 12:26:51'),
	(310, 18, 2, '2025-01-28 06:56:55', NULL, 'Logged in successfully', NULL, '162.158.163.247', NULL, '162.158.163.247', NULL, '2025-01-28 12:26:55', NULL),
	(311, 17, 2, '2025-01-28 06:57:09', '2025-01-28 07:01:32', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.162.82', '162.158.162.48', '162.158.162.82', '2025-01-28 12:27:09', '2025-01-28 12:31:32'),
	(312, 17, 2, '2025-01-28 06:57:27', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-28 12:27:27', NULL),
	(313, 6, 2, '2025-01-28 06:58:11', '2025-01-28 07:06:45', 'Logged in successfully', 'Logged out successfully', '162.158.163.175', '162.158.163.130', '162.158.163.175', '162.158.163.130', '2025-01-28 12:28:11', '2025-01-28 12:36:45'),
	(314, 1, 1, '2025-01-28 07:00:10', '2025-01-28 07:00:44', 'Logged in successfully', 'Logged out successfully', '162.158.163.175', '162.158.163.175', '162.158.163.175', '162.158.163.175', '2025-01-28 12:30:10', '2025-01-28 12:30:44'),
	(315, 18, 2, '2025-01-28 07:01:49', '2025-01-28 07:02:23', 'Logged in successfully', 'Logged out successfully', '162.158.162.129', '162.158.162.48', '162.158.162.129', '162.158.162.48', '2025-01-28 12:31:49', '2025-01-28 12:32:23'),
	(316, 8, 2, '2025-01-28 07:02:25', '2025-01-28 07:10:44', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.175', '162.158.163.176', '162.158.163.175', '2025-01-28 12:32:25', '2025-01-28 12:40:44'),
	(317, 17, 2, '2025-01-28 07:02:55', NULL, 'Logged in successfully', NULL, '162.158.163.91', NULL, '162.158.163.91', NULL, '2025-01-28 12:32:55', NULL),
	(318, 6, 2, '2025-01-28 07:06:59', '2025-01-28 07:08:06', 'Logged in successfully', 'Logged out successfully', '162.158.163.130', '162.158.163.130', '162.158.163.130', '162.158.163.130', '2025-01-28 12:36:59', '2025-01-28 12:38:06'),
	(319, 1, 1, '2025-01-28 07:09:27', '2025-01-28 07:17:07', 'Logged in successfully', 'Logged out successfully', '162.158.163.175', '162.158.162.87', '162.158.163.175', '162.158.162.87', '2025-01-28 12:39:27', '2025-01-28 12:47:07'),
	(320, 1, 1, '2025-01-28 07:11:04', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-28 12:41:04', NULL),
	(321, 1, 1, '2025-01-28 07:14:27', NULL, 'Logged in successfully', NULL, '162.158.162.87', NULL, '162.158.162.87', NULL, '2025-01-28 12:44:27', NULL),
	(322, 1, 1, '2025-01-28 07:15:28', NULL, 'Logged in successfully', NULL, '162.158.163.82', NULL, '162.158.163.82', NULL, '2025-01-28 12:45:28', NULL),
	(323, 12, 2, '2025-01-28 07:53:03', '2025-01-28 08:05:43', 'Logged in successfully', 'Logged out successfully', '162.158.162.171', '162.158.163.151', '162.158.162.171', '162.158.163.151', '2025-01-28 13:23:03', '2025-01-28 13:35:43'),
	(324, 1, 1, '2025-01-28 08:05:57', '2025-01-28 12:19:40', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.81', '162.158.163.176', '162.158.163.81', '2025-01-28 13:35:57', '2025-01-28 17:49:40'),
	(325, 7, 2, '2025-01-28 08:07:41', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-28 13:37:41', NULL),
	(326, 17, 2, '2025-01-28 08:25:23', NULL, 'Logged in successfully', NULL, '162.158.163.81', NULL, '162.158.163.81', NULL, '2025-01-28 13:55:23', NULL),
	(327, 5, 2, '2025-01-28 08:43:55', '2025-01-28 08:55:01', 'Logged in successfully', 'Logged out successfully', '162.158.163.91', '162.158.163.78', '162.158.163.91', '162.158.163.78', '2025-01-28 14:13:55', '2025-01-28 14:25:01'),
	(328, 6, 2, '2025-01-28 08:48:05', NULL, 'Logged in successfully', NULL, '162.158.162.170', NULL, '162.158.162.170', NULL, '2025-01-28 14:18:05', NULL),
	(329, 10, 2, '2025-01-28 08:49:07', NULL, 'Logged in successfully', NULL, '162.158.163.129', NULL, '162.158.163.129', NULL, '2025-01-28 14:19:07', NULL),
	(330, 5, 2, '2025-01-28 08:58:08', '2025-01-28 09:04:33', 'Logged in successfully', 'Logged out successfully', '162.158.163.78', '162.158.163.78', '162.158.163.78', '162.158.163.78', '2025-01-28 14:28:08', '2025-01-28 14:34:33'),
	(331, 15, 2, '2025-01-28 09:47:29', NULL, 'Logged in successfully', NULL, '162.158.163.129', NULL, '162.158.163.129', NULL, '2025-01-28 15:17:29', NULL),
	(332, 1, 1, '2025-01-28 09:48:53', NULL, 'Logged in successfully', NULL, '162.158.163.78', NULL, '162.158.163.78', NULL, '2025-01-28 15:18:53', NULL),
	(333, 8, 2, '2025-01-28 09:54:35', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-28 15:24:35', NULL),
	(334, 3, 2, '2025-01-28 10:06:50', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-28 15:36:50', NULL),
	(335, 6, 2, '2025-01-28 10:21:53', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-28 15:51:53', NULL),
	(336, 5, 2, '2025-01-28 10:28:16', '2025-01-28 12:12:34', 'Logged in successfully', 'Logged out successfully', '162.158.162.48', '162.158.163.151', '162.158.162.48', '162.158.163.151', '2025-01-28 15:58:16', '2025-01-28 17:42:34'),
	(337, 15, 2, '2025-01-28 10:38:46', NULL, 'Logged in successfully', NULL, '162.158.162.129', NULL, '162.158.162.129', NULL, '2025-01-28 16:08:46', NULL),
	(338, 3, 2, '2025-01-28 10:41:46', '2025-01-28 10:45:46', 'Logged in successfully', 'Logged out successfully', '162.158.162.83', '162.158.163.152', '162.158.162.83', '162.158.163.152', '2025-01-28 16:11:46', '2025-01-28 16:15:46'),
	(339, 17, 2, '2025-01-28 10:46:01', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-01-28 16:16:01', NULL),
	(340, 19, 2, '2025-01-28 12:35:49', NULL, 'Logged in successfully', NULL, '172.69.165.10', NULL, '172.69.165.10', NULL, '2025-01-28 18:05:49', NULL),
	(341, 1, 1, '2025-01-28 19:05:58', NULL, 'Logged in successfully', NULL, '172.69.165.51', NULL, '172.69.165.51', NULL, '2025-01-29 00:35:58', NULL),
	(342, 6, 2, '2025-01-29 04:47:09', NULL, 'Logged in successfully', NULL, '162.158.163.78', NULL, '162.158.163.78', NULL, '2025-01-29 10:17:09', NULL),
	(343, 1, 1, '2025-01-29 05:06:50', NULL, 'Logged in successfully', NULL, '162.158.163.91', NULL, '162.158.163.91', NULL, '2025-01-29 10:36:50', NULL),
	(344, 6, 2, '2025-01-29 05:19:15', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-29 10:49:15', NULL),
	(345, 12, 2, '2025-01-29 06:51:34', NULL, 'Logged in successfully', NULL, '162.158.163.82', NULL, '162.158.163.82', NULL, '2025-01-29 12:21:34', NULL),
	(346, 5, 2, '2025-01-29 09:35:51', '2025-01-29 11:26:33', 'Logged in successfully', 'Logged out successfully', '162.158.163.91', '162.158.162.128', '162.158.163.91', '162.158.162.128', '2025-01-29 15:05:51', '2025-01-29 16:56:33'),
	(347, 5, 2, '2025-01-29 10:31:55', '2025-01-29 10:39:17', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.163.152', '162.158.162.86', '162.158.163.152', '2025-01-29 16:01:55', '2025-01-29 16:09:17'),
	(348, 1, 1, '2025-01-29 11:29:49', '2025-01-29 12:01:24', 'Logged in successfully', 'Logged out successfully', '162.158.162.86', '162.158.163.176', '162.158.162.86', '162.158.163.176', '2025-01-29 16:59:49', '2025-01-29 17:31:24'),
	(349, 6, 2, '2025-01-29 11:36:20', NULL, 'Logged in successfully', NULL, '162.158.163.130', NULL, '162.158.163.130', NULL, '2025-01-29 17:06:20', NULL),
	(350, 6, 2, '2025-01-29 12:01:47', NULL, 'Logged in successfully', NULL, '162.158.163.129', NULL, '162.158.163.129', NULL, '2025-01-29 17:31:47', NULL),
	(351, 1, 1, '2025-01-30 04:40:52', '2025-01-30 11:34:07', 'Logged in successfully', 'Logged out successfully', '162.158.162.170', '162.158.162.48', '162.158.162.170', '162.158.162.48', '2025-01-30 10:10:52', '2025-01-30 17:04:07'),
	(352, 5, 2, '2025-01-30 05:10:38', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-01-30 10:40:38', NULL),
	(353, 6, 2, '2025-01-30 05:18:03', NULL, 'Logged in successfully', NULL, '162.158.162.48', NULL, '162.158.162.48', NULL, '2025-01-30 10:48:03', NULL),
	(354, 6, 2, '2025-01-30 05:20:24', NULL, 'Logged in successfully', NULL, '162.158.162.171', NULL, '162.158.162.171', NULL, '2025-01-30 10:50:24', NULL),
	(355, 12, 2, '2025-01-30 06:31:57', NULL, 'Logged in successfully', NULL, '162.158.162.48', NULL, '162.158.162.48', NULL, '2025-01-30 12:01:57', NULL),
	(356, 1, 1, '2025-01-30 06:35:42', '2025-01-30 11:53:18', 'Logged in successfully', 'Logged out successfully', '162.158.163.152', '162.158.162.48', '162.158.163.152', '162.158.162.48', '2025-01-30 12:05:42', '2025-01-30 17:23:18'),
	(357, 6, 2, '2025-01-30 07:13:56', NULL, 'Logged in successfully', NULL, '162.158.163.81', NULL, '162.158.163.81', NULL, '2025-01-30 12:43:56', NULL),
	(358, 5, 2, '2025-01-30 07:49:18', NULL, 'Logged in successfully', NULL, '162.158.163.77', NULL, '162.158.163.77', NULL, '2025-01-30 13:19:18', NULL),
	(359, 5, 2, '2025-01-30 07:53:24', NULL, 'Logged in successfully', NULL, '162.158.162.82', NULL, '162.158.162.82', NULL, '2025-01-30 13:23:24', NULL),
	(360, 12, 2, '2025-01-30 12:14:29', NULL, 'Logged in successfully', NULL, '162.158.162.82', NULL, '162.158.162.82', NULL, '2025-01-30 17:44:29', NULL),
	(361, 1, 1, '2025-01-31 04:41:44', '2025-01-31 09:12:26', 'Logged in successfully', 'Logged out successfully', '162.158.163.176', '162.158.163.82', '162.158.163.176', '162.158.163.82', '2025-01-31 10:11:44', '2025-01-31 14:42:26'),
	(362, 6, 2, '2025-01-31 04:55:41', NULL, 'Logged in successfully', NULL, '162.158.163.248', NULL, '162.158.163.248', NULL, '2025-01-31 10:25:41', NULL),
	(363, 6, 2, '2025-01-31 05:05:28', NULL, 'Logged in successfully', NULL, '162.158.162.66', NULL, '162.158.162.66', NULL, '2025-01-31 10:35:28', NULL),
	(364, 12, 2, '2025-01-31 06:04:37', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-31 11:34:37', NULL),
	(365, 6, 2, '2025-01-31 06:15:39', NULL, 'Logged in successfully', NULL, '162.158.163.78', NULL, '162.158.163.78', NULL, '2025-01-31 11:45:39', NULL),
	(366, 5, 2, '2025-01-31 06:53:13', NULL, 'Logged in successfully', NULL, '162.158.163.176', NULL, '162.158.163.176', NULL, '2025-01-31 12:23:13', NULL),
	(367, 12, 2, '2025-01-31 09:13:24', '2025-01-31 09:14:26', 'Logged in successfully', 'Logged out successfully', '162.158.162.128', '162.158.162.67', '162.158.162.128', '162.158.162.67', '2025-01-31 14:43:24', '2025-01-31 14:44:26'),
	(368, 6, 2, '2025-01-31 09:14:33', NULL, 'Logged in successfully', NULL, '162.158.163.92', NULL, '162.158.163.92', NULL, '2025-01-31 14:44:33', NULL),
	(369, 1, 1, '2025-01-31 09:14:43', '2025-01-31 11:45:45', 'Logged in successfully', 'Logged out successfully', '172.69.165.11', '162.158.163.248', '172.69.165.11', '162.158.163.248', '2025-01-31 14:44:43', '2025-01-31 17:15:45'),
	(370, 1, 1, '2025-01-31 09:15:55', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-01-31 14:45:55', NULL),
	(371, 6, 2, '2025-01-31 09:17:23', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-01-31 14:47:23', NULL),
	(372, 6, 2, '2025-01-31 10:30:03', NULL, 'Logged in successfully', NULL, '162.158.163.120', NULL, '162.158.163.120', NULL, '2025-01-31 16:00:03', NULL),
	(373, 6, 2, '2025-01-31 11:36:03', NULL, 'Logged in successfully', NULL, '162.158.163.78', NULL, '162.158.163.78', NULL, '2025-01-31 17:06:03', NULL),
	(374, 12, 2, '2025-01-31 11:51:59', NULL, 'Logged in successfully', NULL, '162.158.162.128', NULL, '162.158.162.128', NULL, '2025-01-31 17:21:59', NULL),
	(375, 5, 2, '2025-02-03 04:57:50', NULL, 'Logged in successfully', NULL, '162.158.162.129', NULL, '162.158.162.129', NULL, '2025-02-03 10:27:50', NULL),
	(376, 1, 1, '2025-02-03 05:02:10', NULL, 'Logged in successfully', NULL, '162.158.162.67', NULL, '162.158.162.67', NULL, '2025-02-03 10:32:10', NULL),
	(377, 12, 2, '2025-02-03 05:30:44', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-02-03 11:00:44', NULL),
	(378, 3, 2, '2025-02-03 05:32:55', '2025-02-03 06:14:23', 'Logged in successfully', 'Logged out successfully', '162.158.163.151', '172.69.165.11', '162.158.163.151', '172.69.165.11', '2025-02-03 11:02:55', '2025-02-03 11:44:23'),
	(379, 6, 2, '2025-02-03 05:34:26', NULL, 'Logged in successfully', NULL, '162.158.162.83', NULL, '162.158.162.83', NULL, '2025-02-03 11:04:26', NULL),
	(380, 6, 2, '2025-02-03 05:36:15', NULL, 'Logged in successfully', NULL, '162.158.162.66', NULL, '162.158.162.66', NULL, '2025-02-03 11:06:15', NULL),
	(381, 1, 1, '2025-02-03 05:38:01', NULL, 'Logged in successfully', NULL, '162.158.163.151', NULL, '162.158.163.151', NULL, '2025-02-03 11:08:01', NULL),
	(382, 6, 2, '2025-02-03 05:44:57', NULL, 'Logged in successfully', NULL, '162.158.163.77', NULL, '162.158.163.77', NULL, '2025-02-03 11:14:57', NULL),
	(383, 1, 1, '2025-02-03 05:49:15', NULL, 'Logged in successfully', NULL, '162.158.163.175', NULL, '162.158.163.175', NULL, '2025-02-03 11:19:15', NULL),
	(384, 12, 2, '2025-02-03 05:59:18', NULL, 'Logged in successfully', NULL, '162.158.163.82', NULL, '162.158.163.82', NULL, '2025-02-03 11:29:18', NULL),
	(385, 18, 2, '2025-02-03 06:01:24', NULL, 'Logged in successfully', NULL, '162.158.163.82', NULL, '162.158.163.82', NULL, '2025-02-03 11:31:24', NULL),
	(386, 15, 2, '2025-02-03 06:14:44', '2025-02-03 06:28:52', 'Logged in successfully', 'Logged out successfully', '172.69.165.11', '162.158.162.48', '172.69.165.11', '162.158.162.48', '2025-02-03 11:44:44', '2025-02-03 11:58:52'),
	(387, 1, 1, '2025-02-03 06:21:32', NULL, 'Logged in successfully', NULL, '162.158.163.81', NULL, '162.158.163.81', NULL, '2025-02-03 11:51:32', NULL),
	(388, 1, 1, '2025-02-03 06:24:35', NULL, 'Logged in successfully', NULL, '162.158.162.86', NULL, '162.158.162.86', NULL, '2025-02-03 11:54:35', NULL),
	(389, 4, 2, '2025-02-03 06:25:32', NULL, 'Logged in successfully', NULL, '172.69.165.51', NULL, '172.69.165.51', NULL, '2025-02-03 11:55:32', NULL),
	(390, 1, 1, '2025-02-03 06:27:22', NULL, 'Logged in successfully', NULL, '172.69.165.51', NULL, '172.69.165.51', NULL, '2025-02-03 11:57:22', NULL),
	(391, 3, 2, '2025-02-03 06:29:07', NULL, 'Logged in successfully', NULL, '162.158.162.48', NULL, '162.158.162.48', NULL, '2025-02-03 11:59:07', NULL),
	(392, 17, 2, '2025-02-03 06:36:02', NULL, 'Logged in successfully', NULL, '162.158.162.49', NULL, '162.158.162.49', NULL, '2025-02-03 12:06:02', NULL),
	(393, 1, 1, '2025-02-03 08:09:49', NULL, 'Logged in successfully', NULL, '162.158.163.77', NULL, '162.158.163.77', NULL, '2025-02-03 13:39:49', NULL),
	(394, 1, 1, '2025-02-03 08:25:09', NULL, 'Logged in successfully', NULL, '162.158.163.152', NULL, '162.158.163.152', NULL, '2025-02-03 13:55:09', NULL),
	(395, 1, 1, '2025-02-03 08:28:14', NULL, 'Logged in successfully', NULL, '172.69.165.50', NULL, '172.69.165.50', NULL, '2025-02-03 13:58:14', NULL);
/*!40000 ALTER TABLE `tbl_login_logs` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.tbl_notifications
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

-- Dumping data for table tlmis_testing.tbl_notifications: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.tbl_secrets
DROP TABLE IF EXISTS `tbl_secrets`;
CREATE TABLE IF NOT EXISTS `tbl_secrets` (
  `otp_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `verified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`otp_id`) USING BTREE,
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.tbl_secrets: ~34 rows (approximately)
INSERT INTO `tbl_secrets` (`otp_id`, `user_id`, `mobile`, `otp`, `created_at`, `verified_at`) VALUES
	(3, 1, '8888888888', '123456', '2025-02-07 16:54:14', '2025-02-07 16:54:29'),
	(4, 1, '8888888888', '123456', '2025-02-07 16:54:35', '2025-02-07 16:54:46'),
	(5, 1, '8888888888', '123456', '2025-02-07 16:54:58', '2025-02-07 16:55:01'),
	(6, 1, '8888888888', '123456', '2025-02-07 16:55:15', '2025-02-07 16:55:19'),
	(7, 1, '8888888888', '123456', '2025-02-07 17:03:14', '2025-02-07 17:03:17'),
	(8, 1, '8888888888', '123456', '2025-02-07 17:07:13', '2025-02-07 17:07:17'),
	(9, 1, '8888888888', '123456', '2025-02-08 16:57:56', '2025-02-08 16:58:03'),
	(10, 1, '8888888888', '123456', '2025-02-08 16:58:19', '2025-02-08 16:58:26'),
	(11, 1, '8888888888', '123456', '2025-02-08 16:59:04', '2025-02-08 16:59:09'),
	(12, 1, '8888888888', '123456', '2025-02-08 16:59:31', '2025-02-08 16:59:35'),
	(13, 1, '8888888888', '123456', '2025-02-08 17:04:35', '2025-02-08 17:04:41'),
	(14, 1, '8888888888', '123456', '2025-02-08 17:05:20', '2025-02-08 17:05:26'),
	(15, 1, '8888888888', '123456', '2025-02-08 17:05:42', '2025-02-08 17:05:48'),
	(16, 1, '8888888888', '123456', '2025-02-08 17:20:40', '2025-02-08 17:20:46'),
	(17, 1, '8888888888', '123456', '2025-02-08 17:23:40', '2025-02-08 17:23:46'),
	(18, 1, '8888888888', '123456', '2025-02-08 17:40:04', '2025-02-08 17:40:12'),
	(19, 1, '8888888888', '123456', '2025-02-08 17:40:22', '2025-02-08 17:40:28'),
	(20, 1, '8888888888', '123456', '2025-02-08 17:42:15', '2025-02-08 17:42:21'),
	(21, 1, '8888888888', '123456', '2025-02-08 17:48:10', '2025-02-08 17:48:17'),
	(22, 1, '8888888888', '123456', '2025-02-08 17:54:50', '2025-02-08 17:54:56'),
	(23, 1, '8888888888', '123456', '2025-02-08 17:55:08', '2025-02-08 17:55:15'),
	(24, 1, '8888888888', '123456', '2025-02-08 17:56:14', '2025-02-08 17:56:27'),
	(25, 1, '8888888888', '123456', '2025-02-08 17:57:04', '2025-02-08 17:57:10'),
	(26, 1, '8888888888', '123456', '2025-02-08 17:58:26', '2025-02-08 17:58:32'),
	(27, 1, '8888888888', '123456', '2025-02-08 17:58:44', '2025-02-08 17:58:49'),
	(28, 1, '8888888888', '123456', '2025-02-08 18:00:39', '2025-02-08 18:00:45'),
	(29, 1, '8888888888', '123456', '2025-02-08 18:01:04', '2025-02-08 18:01:10'),
	(30, 1, '8888888888', '123456', '2025-02-08 18:03:48', '2025-02-08 18:03:55'),
	(31, 1, '8888888888', '123456', '2025-02-08 18:04:47', '2025-02-08 18:04:50'),
	(32, 1, '8888888888', '123456', '2025-02-08 18:08:56', '2025-02-08 18:09:06'),
	(33, 1, '8888888888', '123456', '2025-02-18 16:35:40', '2025-02-18 16:35:48'),
	(34, 1, '8888888888', '123456', '2025-02-18 16:54:51', '2025-02-18 16:54:57'),
	(35, 1, '8888888888', '123456', '2025-02-20 11:45:06', '2025-02-20 11:45:13'),
	(36, 1, '8888888888', '123456', '2025-02-20 18:21:03', '2025-02-20 18:21:09');

-- Dumping structure for table tlmis_testing.tbl_task
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_task: ~20 rows (approximately)
INSERT INTO `tbl_task` (`task_id`, `title`, `fk_task_priority_id`, `fk_task_category_id`, `entry_date`, `due_date`, `description`, `status`, `remark`, `ref_docs`, `has_file`, `created_by`, `created_date`, `created_ipaddress`, `updated_by`, `updated_date`, `updated_ipaddress`, `closed_remark`, `closed_by`, `closed_date`, `closed_ipaddress`, `is_replied`) VALUES
	(1, 'Middleware', 2, 10, '2025-02-03', '2025-02-04', 'NA', 'I', NULL, '["2"]', 'Y', 1, '2025-02-04 07:38:16', '162.158.163.206', 1, '2025-02-04 11:56:55', '162.158.162.45', NULL, NULL, NULL, NULL, 'N'),
	(2, 'Task1', 1, 1, '2025-02-04', '2025-02-10', 'Task1 Assigned Today', 'C', NULL, NULL, 'N', 1, '2025-02-04 07:40:20', '162.158.163.205', 1, '2025-02-04 09:45:53', '162.158.162.79', 'Complete', 1, '2025-02-04 15:15:53', '162.158.162.44', 'Y'),
	(3, 'Task2', 1, 1, '2025-02-04', '2025-02-15', 'xyz', 'C', NULL, NULL, 'N', 1, '2025-02-04 07:42:57', '172.69.165.75', NULL, '2025-02-10 08:42:57', NULL, 'Close', 1, '2025-02-10 14:12:57', '162.158.162.171', 'Y'),
	(4, 'Digitization of Government Documents', 2, 9, '2025-02-04', '2025-02-07', 'Scanning and storing physical government documents in digital format to ensure quick access and enhanced security.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:47:16', '162.158.162.50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(5, 'School Infrastructure Monitoring System', 1, 6, '2025-02-04', '2025-02-07', 'Developing a digital portal to track and manage the physical infrastructure of government schools, including classrooms, sanitation, and internet facilities.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:50:14', '162.158.162.44', NULL, '2025-02-10 09:08:21', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(6, 'Digital Nutrition Awareness and Supplement Distribution System', 1, 7, '2025-02-04', '2025-02-12', 'Creating an online portal to educate women about nutrition and ensure the distribution of essential supplements like iron, folic acid, and calcium.', 'I', NULL, NULL, 'Y', 1, '2025-02-04 11:52:15', '162.158.162.45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(7, 'National Animal Health Monitoring System', 2, 3, '2025-02-04', '2025-02-13', 'Developing a digital platform to track and monitor animal diseases, vaccination schedules, and veterinary health records.', 'C', NULL, NULL, 'Y', 1, '2025-02-04 11:53:39', '162.158.163.179', NULL, '2025-02-10 10:15:00', NULL, 'viewed', 1, '2025-02-10 15:45:00', '162.158.163.156', 'Y'),
	(8, 'Test 05', 1, 1, '2025-02-05', '2025-02-07', 'Any', 'I', NULL, '["5"]', 'Y', 1, '2025-02-05 05:19:30', '162.158.162.79', 1, '2025-02-07 07:34:28', '162.158.162.45', NULL, NULL, NULL, NULL, 'N'),
	(9, 'Task 06', 1, 5, '2025-02-05', '2025-02-11', 'Carrer growth', 'I', NULL, '["4"]', 'Y', 1, '2025-02-05 05:24:04', '162.158.162.78', 1, '2025-02-10 09:42:49', '162.158.162.44', NULL, NULL, NULL, NULL, 'Y'),
	(10, 'Test 05/02/2025', 1, 9, '2025-02-05', '2025-02-28', 'NA', 'I', NULL, '["3"]', 'N', 1, '2025-02-05 05:29:57', '162.158.162.45', 1, '2025-02-07 07:36:19', '172.69.165.75', NULL, NULL, NULL, NULL, 'N'),
	(11, 'title-0001', 1, 5, '2025-02-10', '2025-02-12', 'desc..', 'C', NULL, '["3"]', 'N', 1, '2025-02-10 10:20:37', '162.158.162.163', NULL, '2025-02-10 10:24:24', NULL, NULL, 1, '2025-02-10 15:54:24', '162.158.163.23', 'Y'),
	(12, 'ccc', 1, 2, '2025-02-11', '2025-02-15', 'rdtfufu', 'I', NULL, '["6"]', 'N', 1, '2025-02-11 09:35:18', '162.158.163.134', 1, '2025-02-11 10:36:43', '162.158.162.162', NULL, NULL, NULL, NULL, 'N'),
	(13, 'task34', 2, 3, '2025-02-11', '2025-02-14', 'technical work', 'C', NULL, NULL, 'N', 1, '2025-02-11 10:04:21', '162.158.163.134', NULL, '2025-02-11 10:06:48', NULL, 'close', 1, '2025-02-11 15:36:48', '162.158.162.162', 'Y'),
	(14, 'Task-12', 2, 2, '2025-02-12', '2025-02-14', 'this is urgent!', 'C', NULL, '["4"]', 'N', 1, '2025-02-12 06:06:27', '162.158.163.24', NULL, '2025-02-18 06:23:42', NULL, 'close this task', 1, '2025-02-18 11:53:42', '172.69.165.75', 'Y'),
	(15, 'New Task', 2, 2, '2025-02-15', '2025-02-25', 'new task of the day', 'O', NULL, NULL, 'Y', 1, '2025-02-15 09:25:49', '172.69.165.25', NULL, '2025-02-18 06:12:18', NULL, 'Finaly Done', 1, '2025-02-15 17:43:11', '162.158.163.24', 'Y'),
	(16, 'task0024', 1, 4, '2025-02-15', '2025-02-25', 'task urgent', 'C', NULL, NULL, 'Y', 1, '2025-02-15 09:38:17', '162.158.162.163', NULL, '2025-02-18 07:27:03', NULL, 'OK!!', 1, '2025-02-18 12:57:03', '172.69.165.24', 'Y'),
	(17, '3300TAsk', 1, 5, '2025-02-15', '2025-02-20', 'xyc', 'C', NULL, NULL, 'Y', 1, '2025-02-15 10:19:42', '172.69.165.13', NULL, '2025-02-18 06:43:41', NULL, 'AVERAGE', 1, '2025-02-18 12:13:41', '172.69.165.12', 'Y'),
	(18, 'TEST', 1, 9, '2025-02-15', '2025-02-16', 'NA', 'C', NULL, '["6"]', 'N', 1, '2025-02-15 10:36:10', '162.158.162.91', 1, '2025-02-18 07:27:55', '162.158.163.23', '.....', 1, '2025-02-18 12:57:55', '172.69.165.25', 'Y'),
	(19, 'task18', 2, 2, '2025-02-18', '2025-02-22', 'this is very crutial task', 'C', NULL, NULL, 'Y', 1, '2025-02-18 04:58:55', '162.158.163.133', NULL, '2025-02-18 05:06:26', NULL, 'GREAT WORK', 1, '2025-02-18 10:36:26', '162.158.163.24', 'Y'),
	(20, 'Task_104', 2, 4, '2025-02-17', '2025-02-19', 'Notice by CM', 'C', NULL, '["7"]', 'N', 1, '2025-02-18 05:31:55', '162.158.162.118', 1, '2025-02-18 06:38:04', '162.158.163.252', 'GREAT WORK !!', 1, '2025-02-18 12:08:04', '162.158.162.162', 'Y');

-- Dumping structure for table tlmis_testing.tbl_task_closed_trs
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_task_closed_trs: ~15 rows (approximately)
INSERT INTO `tbl_task_closed_trs` (`closed_id`, `fk_task_id`, `closed_remark`, `closed_by`, `closed_date`, `closed_ipaddress`) VALUES
	(1, 2, 'Complete', 1, '2025-02-04 15:15:53', '162.158.162.44'),
	(2, 3, 'good Job', 1, '2025-02-04 15:17:22', '162.158.163.206'),
	(6, 3, 'Close', 1, '2025-02-10 14:12:57', '162.158.162.171'),
	(7, 7, 'viewed', 1, '2025-02-10 15:45:00', '162.158.163.156'),
	(8, 11, NULL, 1, '2025-02-10 15:54:24', '162.158.163.23'),
	(9, 13, 'close', 1, '2025-02-11 15:36:48', '162.158.162.162'),
	(10, 15, 'xdf', 1, '2025-02-15 15:05:13', '172.69.165.12'),
	(11, 14, NULL, 1, '2025-02-15 15:12:20', '162.158.163.134'),
	(12, 15, 'Finaly Done', 1, '2025-02-15 17:43:11', '162.158.163.24'),
	(13, 19, 'GREAT WORK', 1, '2025-02-18 10:36:26', '162.158.163.24'),
	(14, 14, 'close this task', 1, '2025-02-18 11:53:42', '172.69.165.75'),
	(15, 20, 'GREAT WORK !!', 1, '2025-02-18 12:08:04', '162.158.162.162'),
	(16, 17, 'AVERAGE', 1, '2025-02-18 12:13:41', '172.69.165.12'),
	(17, 16, 'OK!!', 1, '2025-02-18 12:57:03', '172.69.165.24'),
	(18, 18, '.....', 1, '2025-02-18 12:57:55', '172.69.165.25');

-- Dumping structure for table tlmis_testing.tbl_task_details
DROP TABLE IF EXISTS `tbl_task_details`;
CREATE TABLE IF NOT EXISTS `tbl_task_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` enum('P','C','B') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'P' COMMENT 'C - Completed , P - Not Completed, IP - In Progress,B - Send back',
  `related_officers` json DEFAULT NULL COMMENT 'fk',
  `section_id` smallint NOT NULL,
  `worktype_id` int NOT NULL DEFAULT (0),
  `work_no` int NOT NULL DEFAULT (0),
  `generated_task_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `application_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `work_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `TL_date` date DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `task_entry_date` date DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `create_date` datetime DEFAULT (now()),
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `document` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_id` smallint DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appli_from_id` (`task_entry_date`) USING BTREE,
  KEY `generated_task_code` (`generated_task_code`),
  KEY `TL_date` (`TL_date`),
  KEY `section_id` (`section_id`),
  KEY `worktype_id` (`worktype_id`),
  KEY `file_id` (`file_id`),
  KEY `application_date` (`application_date`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.tbl_task_details: ~159 rows (approximately)
INSERT INTO `tbl_task_details` (`id`, `status`, `related_officers`, `section_id`, `worktype_id`, `work_no`, `generated_task_code`, `application_no`, `subject`, `work_description`, `TL_date`, `application_date`, `task_entry_date`, `priority`, `create_date`, `update_date`, `create_by`, `document`, `file_id`, `update_by`, `create_ip`, `update_ip`) VALUES
	(1, 'P', '["3", "7", "10", "16", "17"]', 1, 4, 240001, NULL, 'क्रं 5229/मुमंस/2024/एम 5-27', 'विभागों की समीक्षा बैठक संबंधी', 'माननीय मुख्यमंत्रीजी द्वारा विभागों की समीक्षा शीघ्र किया जाना प्रस्तावित है तथा समीक्षा के साथ विभाग द्वारा विगत 01 वर्ष में किये गये कार्यों तथा आगामी 01 वर्ष एवं 04 वर्षों की कार्ययोजना के संबंध में भी समीक्षा की जाएगी। भारत सरकार एवं राज्य सरकार की योजनाओं की प्रगति की भी समीक्षा की जाएगी। म्ंेम व िक्वपदह ठनेपदमेे एवं म्ंेम व िस्पअपदह संबंधी विभाग अंतर्गत क्या-क्या त्मवितउे किये गये हैं तथा क्या-क्या त्मवितउे प्रस्तावित है, की जानकारी  बैठक हेतु संकलित किया जाना है।', NULL, '2025-01-06', '2025-01-06', 1, '2025-01-06 15:15:17', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.233', NULL),
	(2, 'C', '["3", "7", "10", "16", "17"]', 1, 9, 240002, NULL, 'क्रं एफ 4-270/गृह-सी/2024', 'छत्तीसगढ़ नक्सलवाद उन्मूलन नीति के संशोधन के संबंध में अभिमत बाबत्।', 'स्मरण पत्र/समय-सीमा', NULL, '2025-01-07', '2025-01-07', 1, '2025-01-07 13:26:39', '2025-01-22 08:59:17', 1, NULL, NULL, 1, '162.158.163.234', '162.158.162.49'),
	(3, 'P', '["5", "6", "12"]', 2, 14, 240003, NULL, 'क्रं-12480/781/स्था-01/मबावि/24-25', 'महिला एवं बाल विकास विभाग अंतर्गत पदस्थ अधिकारियों/कर्मचारियों को समयमान वेतनमान दिये जाने विषयक्।', 'समयमान वेतनमान दिये जाने विषयक्।', NULL, '2025-01-07', '2025-01-07', 3, '2025-01-07 14:02:08', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.234', NULL),
	(4, 'C', '["5", "6", "12"]', 2, 14, 240004, NULL, 'क्र./12474/450/स्था.03/मबावि/2024-25', 'स्व. श्रीमती नीलिमा पाणीग्राही, पर्यवेक्षक की मृत्यु उपरांत उनके आश्रित परिवार को बकाया स्वत्वों का भुगतान संबंध की गई कार्यवाही से अवगत कराने बाबत्।', 'स्व. श्रीमती नीलिमा पाणीग्राही, पर्यवेक्षक की मृत्यु उपरांत उनके आश्रित परिवार को बकाया स्वत्वों का भुगतान संबंध की गई कार्यवाही से अवगत कराने बाबत्।', NULL, '2025-01-07', '2025-01-07', 3, '2025-01-07 15:39:10', '2025-01-28 10:37:39', 1, NULL, NULL, 1, '172.69.165.59', '162.158.163.129'),
	(5, 'C', '["5", "6", "13"]', 2, 14, 240005, NULL, 'क्र./12462/बजट-ऑडिट/2024-25', 'बंद योजनाओं की अवशेष राशि की जानकारी बाबत्।', 'बंद योजनाओं की अवशेष राशि की जानकारी बाबत्।', NULL, '2025-01-07', '2025-01-07', 3, '2025-01-07 15:45:33', '2025-01-22 10:23:26', 1, NULL, NULL, 1, '162.158.162.43', '162.158.163.109'),
	(6, 'C', '["5", "6", "12"]', 2, 14, 240006, NULL, 'क्र./12776/422 पार्ट 03/मबावि/स्था.01/2023-24', 'श्रीमती अर्चना चौहान, अधीक्षक (मूल पद बाल विकास परियोजना अध्किारी ) बाल संप्रेक्षण गृह, बिलासपुर छ.ग. का ‘‘ न जांच, न मांग, न घटना प्रमााण पत्र‘‘ जारी करने विषयक्।', 'श्रीमती अर्चना चौहान, अधीक्षक (मूल पद बाल विकास परियोजना अध्किारी ) बाल संप्रेक्षण गृह, बिलासपुर छ.ग. का ‘‘ न जांच, न मांग, न घटना प्रमााण पत्र‘‘ जारी करने विषयक्।', NULL, '2025-01-07', '2025-01-07', 3, '2025-01-07 15:50:56', '2025-01-23 05:24:32', 1, NULL, NULL, 1, '162.158.163.153', '162.158.162.103'),
	(7, 'C', '["5", "6"]', 2, 14, 240007, NULL, 'क्र./12485/25/समन्वय/संचा./मबावि/2024-25', 'नई दिल्ली द्वारा क्षेत्रीय कार्यालय की स्थापना हेतु भूमि के आबंटन के संबंध मे।', 'नई दिल्ली द्वारा क्षेत्रीय कार्यालय की स्थापना हेतु भूमि के आबंटन के संबंध मे।', NULL, '2025-01-07', '2025-01-07', 1, '2025-01-07 17:28:08', '2025-01-15 09:19:55', 1, NULL, NULL, 1, '172.69.165.21', '162.158.162.102'),
	(8, 'P', '["5", "6"]', 2, 14, 240008, NULL, 'क्र./12500/पो. अभि./मबावि/2024-25', 'पोषण अभियान योजना अंतर्गत स्वीकृत संविदा पदों को भरे जाने की स्वीकृति हेतु प्रस्ताव।', 'पोषण अभियान योजना अंतर्गत स्वीकृत संविदा पदों को भरे जाने की स्वीकृति हेतु प्रस्ताव।', NULL, '2025-01-07', '2025-01-07', 3, '2025-01-07 17:36:03', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.32', NULL),
	(9, 'C', '["5", "6"]', 2, 14, 240009, NULL, 'पत्र क्र./12531/75/3/मबावि/सा.वि./24-25', 'राज्य वीरता पुरस्कार वर्ष 2024 के संबंध में।', 'राज्य वीरता पुरस्कार वर्ष 2024 के संबंध में।', NULL, '2025-01-08', '2025-01-08', 1, '2025-01-08 16:32:08', '2025-01-21 11:03:51', 1, NULL, NULL, 1, '162.158.163.233', '162.158.162.102'),
	(10, 'C', '["5", "6", "13"]', 2, 14, 240010, NULL, 'क्र./12523/आई.टी/मबावि/2024-25', 'मांग संख्या 55 -योजना शीर्ष 7097 - महिला एवं बाल विकास विभाग का डिजीटाईजेशन - 14 सहायक अनुदान - 012 अन्य अनुदान अंतर्गत कार्ययोजना की स्वीकृति एवं राशि विमुक्तिकरण का प्रस्ताव।', 'मांग संख्या 55 -योजना शीर्ष 7097 - महिला एवं बाल विकास विभाग का डिजीटाईजेशन - #14 सहायक अनुदान - 012 अन्य अनुदान अंतर्गत कार्ययोजना की स्वीकृति एवं राशि विमुक्तिकरण का प्रस्ताव।', NULL, '2025-01-08', '2025-01-08', 3, '2025-01-08 16:37:50', '2025-01-22 10:22:59', 1, NULL, NULL, 1, '162.158.163.132', '162.158.163.109'),
	(11, 'C', '["5", "6", "13"]', 2, 14, 240011, NULL, 'क्र./12524/आई.टी/मबावि/2024-25', 'मांग संख्या 55 -योजना शीर्ष 7097 - महिला एवं बाल विकास विभाग का डिजीटाईजेशन -# 14 सहायक अनुदान - 012 अन्य अनुदान अंतर्गत कार्ययोजना की स्वीकृति एवं राशि विमुक्तिकरण का प्रस्ताव।', 'मांग संख्या 55 -योजना शीर्ष 7097 - महिला एवं बाल विकास विभाग का डिजीटाईजेशन - #14 सहायक अनुदान - 012 अन्य अनुदान अंतर्गत कार्ययोजना की स्वीकृति एवं राशि विमुक्तिकरण का प्रस्ताव।', NULL, '2025-01-08', '2025-01-08', 1, '2025-01-08 16:41:58', '2025-01-28 09:56:00', 1, NULL, NULL, 1, '162.158.162.113', '162.158.162.49'),
	(12, 'P', '["5", "6"]', 2, 14, 240012, NULL, 'क्र./9676/मबावि/आईसीडीएस/2024-25', 'जनमन क्षे़त्रों में आंगनबाड़ी केन्द्रों की स्वीकृति का प्रस्ताव।', 'जनमन क्षे़त्रों में आंगनबाड़ी केन्द्रों की स्वीकृति का प्रस्ताव।', NULL, '2025-01-08', '2025-01-08', 3, '2025-01-08 16:48:30', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.20', NULL),
	(13, 'P', '["5", "6", "12"]', 2, 14, 240013, NULL, 'क्र./12577/755/स्था.-01/2024-25', 'स्थानांतरण करने के संबंध में।', 'स्थानांतरण करने के संबंध में।', NULL, '2025-01-08', '2025-01-08', 3, '2025-01-08 16:51:28', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.234', NULL),
	(14, 'P', '["5", "6"]', 2, 14, 240014, NULL, 'क्र./12593/मबावि/मसमि/24-25', 'घरेलू हिंसा से महिलाओं का संरक्षण अधिनियम 2005 के तहत सेवा प्रदाताओं का पंजीयन/अधिसूचना जारी करने विषयक्।', 'घरेलू हिंसा से महिलाओं का संरक्षण अधिनियम 2005 के तहत सेवा प्रदाताओं का पंजीयन/अधिसूचना जारी करने विषयक्।', NULL, '2025-01-08', '2025-01-08', 3, '2025-01-08 17:01:21', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.105', NULL),
	(15, 'C', '["5", "6", "12"]', 2, 14, 240015, NULL, 'क्र./12582/755/स्था.01/2024-25', 'जिला महिला एवं बाल विकास अधिकारी सक्ती के पदस्थापना के संबंध में।', 'जिला महिला एवं बाल विकास अधिकारी सक्ती के पदस्थापना के संबंध में।', NULL, '2025-01-08', '2025-01-08', 3, '2025-01-08 17:04:50', '2025-01-22 10:22:31', 1, NULL, NULL, 1, '172.69.165.51', '162.158.163.109'),
	(16, 'P', '["5", "6"]', 2, 14, 240016, NULL, 'क्र./12598/मबावि/24-25', 'महिलाओं का कार्यस्थल पर लैंगिक उत्पीड़न (निवारण, प्रतिषेध और प्रतितोष) अधिनियम 2013 के क्रियान्वयन के संबंध में।', 'महिलाओं का कार्यस्थल पर लैंगिक उत्पीड़न (निवारण, प्रतिषेध और प्रतितोष) अधिनियम 2013 के क्रियान्वयन के संबंध में।', NULL, '2025-01-09', '2025-01-09', 1, '2025-01-09 13:59:15', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.233', NULL),
	(17, 'C', '["5", "6"]', 2, 14, 240017, NULL, 'क्र./12591/63/मबावि/सावि/23-24', 'गरीब सुकन्याओं के विवाह हेतु मुख्यमंत्री कन्यादान योजना के पुनर्संचालन अथवा नये सिरे से माननीय प्रधानमंत्री कन्यादान योजना संचालित किये जाने के संबंध में।', 'गरीब सुकन्याओं के विवाह हेतु मुख्यमंत्री कन्यादान योजना के पुनर्संचालन अथवा नये सिरे से माननीय प्रधानमंत्री कन्यादान योजना संचालित किये जाने के संबंध में।', NULL, '2025-01-09', '2025-01-09', 3, '2025-01-09 14:03:04', '2025-01-22 10:22:07', 1, NULL, NULL, 1, '162.158.163.234', '162.158.163.109'),
	(18, 'C', '["5", "6"]', 2, 14, 240018, NULL, 'क्र./12601/संचा./मबावि/2024-25', 'स्थानांतरण आदेश के संबंध में केवियट दायर करने बाबत्।', 'स्थानांतरण आदेश के संबंध में केवियट दायर करने बाबत्।', NULL, '2025-01-09', '2025-01-09', 3, '2025-01-09 14:05:48', '2025-01-28 10:02:47', 1, NULL, NULL, 1, '172.69.165.58', '162.158.162.49'),
	(19, 'P', '["5", "6"]', 2, 14, 240019, NULL, 'क्र./एफ-965/11439/स्था.01/मबावि/2024-25', 'महिला एवं बाल विकास विभाग अंतर्गत संयुक्त संचालक से अपर संचालक के पद पर पदोन्नति।', 'महिला एवं बाल विकास विभाग अंतर्गत संयुक्त संचालक से अपर संचालक के पद पर पदोन्नति।', NULL, '2025-01-09', '2025-01-09', 3, '2025-01-09 17:25:30', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.233', NULL),
	(20, 'P', '["5", "6"]', 2, 14, 240020, NULL, 'क्र./12411/781/स्था.01/मबावि/2024-25', 'महिला एवं बाल विकास विभाग अंतर्गत पदस्थ सहायक सांख्यिकी अधिकारी संवर्ग को समयमान वेतनमान का लाभ प्रदान करने विषयक्।', 'महिला एवं बाल विकास विभाग अंतर्गत पदस्थ सहायक सांख्यिकी अधिकारी संवर्ग को समयमान वेतनमान का लाभ प्रदान करने विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 10:39:22', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.21', NULL),
	(21, 'C', '["5", "6", "12"]', 2, 14, 240021, NULL, 'dz@12400@442@eckfo@LFkk-01@2023&24', 'विभाग के प्रथम/द्वितीय श्रेणी अधिकारियों के न मांग, न जांच, न घटना प्रमाण पत्र जारी करने विषयक्। (सुश्री फबियोला खलखो, बाल विकास परियोजना अधिकारी)', 'विभाग के प्रथम/द्वितीय श्रेणी अधिकारियों के न मांग, न जांच, न घटना प्रमाण पत्र जारी करने विषयक्। (सुश्री फबियोला खलखो, बाल विकास परियोजना अधिकारी)', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 10:43:39', '2025-01-23 05:24:57', 1, NULL, NULL, 1, '172.69.165.20', '162.158.162.103'),
	(22, 'C', '["5", "6", "12"]', 2, 14, 240022, NULL, 'dz-@12399@422 ikVZ 03@eckfo@LFkk-01@2023&24', 'श्रीमती वृन्दा देवांगन बाल विकास परियोजना अधिकारी, एकीकृत बाल विकास परियोजना-फरसगांव जिला-कोण्डागांव छ.ग. का ‘‘ न जांच, न मांग, न घटना प्रमाण पत्र‘‘ जारी करने विषयक्।', 'श्रीमती वृन्दा देवांगन बाल विकास परियोजना अधिकारी, एकीकृत बाल विकास परियोजना-फरसगांव जिला-कोण्डागांव छ.ग. का ‘‘ न जांच, न मांग, न घटना प्रमाण पत्र‘‘ जारी करने विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 10:48:12', '2025-01-23 05:25:15', 1, NULL, NULL, 1, '172.69.165.21', '162.158.162.103'),
	(23, 'P', '["5", "6", "12"]', 2, 14, 240023, NULL, 'क्र./12396/734 III /मबावि/स्था. 02/2024-25', 'श्रीमती शिल्पा अग्रवाल, पर्यवेक्षक, महिला एवं बाल विकास रामानुजनगर, जिला-सूरजपूर का स्थानांतरण करने के संबंध में।', 'श्रीमती शिल्पा अग्रवाल, पर्यवेक्षक, महिला एवं बाल विकास रामानुजनगर, जिला-सूरजपूर का स्थानांतरण करने के संबंध में।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 11:01:17', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.82', NULL),
	(24, 'P', '["5", "6", "12"]', 2, 14, 240024, NULL, 'क्र./12342/स्था.03/2024-25', 'अधीक्षक, सहायक ग्रेड- 1, 2 एवं 3 का स्थानांतरण के संबंध में', 'अधीक्षक, सहायक ग्रेड- 1, 2 एवं 3 का स्थानांतरण के संबंध में', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 11:05:41', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.186', NULL),
	(25, 'C', '["5", "6", "12"]', 2, 14, 240025, NULL, 'क्र./11952/182ए/स्था.-01/मबावि/20254-25', 'परीक्षा में सम्मिलित होने की अनुमति प्रदान करने विषयक्।  1/ श्रीमती खुशबू तिवारी, परियाजना अधिकारी।  2/ श्री अन्वेष दीवान, परियोजना अधिकारी।  3/ श्री आशाराम पोर्ते, परियोजना अधिकारी।', 'परीक्षा में सम्मिलित होने की अनुमति प्रदान करने विषयक्। \r\n1/ श्रीमती खुशबू तिवारी, परियाजना अधिकारी। \r\n2/ श्री अन्वेष दीवान, परियोजना अधिकारी। \r\n3/ श्री आशाराम पोर्ते, परियोजना अधिकारी।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 11:10:33', '2025-01-15 09:19:55', 1, NULL, NULL, 1, '162.158.163.186', '162.158.162.102'),
	(26, 'C', '["5", "6", "13"]', 2, 14, 240026, NULL, 'क्रं 12028/आईसीडीएस-01/मबावि/2024-25', 'आंगनबाड़ी कार्यकर्ताओं के समस्या के समाधान हेतु अनुरोध।', 'MDM', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 11:36:00', '2025-01-28 10:03:47', 1, NULL, NULL, 1, '162.158.163.114', '162.158.162.49'),
	(27, 'P', '["5", "6", "12"]', 2, 14, 240027, NULL, 'क्रं 12056/755 पार्ट-03/स्था-01/मबावि/2024-25', 'श्रीमती अपूर्णा श्रीवास्तव, परियोजना अधिकारी, एकीकृत बाल विकास परियोजना-डौंडीलोहारा, जिला-बालोद के पद पर उपस्थिति के संबंध में।', 'श्रीमती अपूर्णा श्रीवास्तव, परियोजना अधिकारी, एकीकृत बाल विकास परियोजना-डौंडीलोहारा, जिला-बालोद के पद पर उपस्थिति के संबंध में।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 11:39:16', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.113', NULL),
	(28, 'C', '["5", "6", "12"]', 2, 14, 240028, NULL, 'क्रं 11814/मबावि/मसमि/2024-25', 'महतारी वंदन योजना अंतर्गत फर्जी आवेदन के माध्यम से लाभ प्राप्त करने बाबत्।', 'महतारी वंदन योजना अंतर्गत फर्जी आवेदन के माध्यम से लाभ प्राप्त करने बाबत्।', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 11:48:30', '2025-01-23 05:29:09', 1, NULL, NULL, 1, '162.158.163.186', '162.158.163.221'),
	(29, 'P', '["5", "6", "12"]', 2, 14, 240029, NULL, 'क्रं 11765/मबावि/स्था-03/2024-25', 'पदोन्नति का लाभ देने बाबत्- श्रीमती मंजूला आवल, रिटायर्ड एच.एल.व्हीच (स्वास्थ्य पर्यवेक्षक)', 'पदोन्नति का लाभ देने बाबत्- श्रीमती मंजूला आवल, रिटायर्ड एच.एल.व्हीच (स्वास्थ्य पर्यवेक्षक)', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 11:50:25', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.186', NULL),
	(30, 'P', '["5", "6", "12"]', 2, 14, 240030, NULL, 'क्रं 11565/मबावि/मसमि/2024-25', 'कार्यस्थल पर महिलाओं का लैंगिक उत्पीडन संबंधी पत्रों पर आवश्यक कार्यवाही बाबत्।', 'कार्यस्थल पर महिलाओं का लैंगिक उत्पीडन संबंधी पत्रों पर आवश्यक कार्यवाही बाबत्।', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 11:52:36', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.185', NULL),
	(31, 'C', '["5", "6", "12"]', 2, 14, 240031, NULL, 'क्रं 11445/442/मबावि/स्था-01/2024-25', 'विभाग के प्रथम/द्वितीय श्रेणी अधिकारियों के न मांग, न जांच, न घटना प्रमाण पत्र जारी करने विषयक्।', 'विभाग के प्रथम/द्वितीय श्रेणी अधिकारियों के न मांग, न जांच, न घटना प्रमाण पत्र जारी करने विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:06:23', '2025-01-23 05:29:29', 1, NULL, NULL, 1, '162.158.162.178', '162.158.163.221'),
	(32, 'P', '["5", "6", "12"]', 2, 14, 240032, NULL, 'क्रं 31/1119/मबावि/मि.वा./सारा/2024-25', 'राज्य स्तरीय निरीक्षण समिति में नामांकित स्वैच्छिक संगठनों के प्रतिनिधियों के लिए दैनिक आधार पर मानदेय तथा यात्रा भत्ता विषयक्।', 'राज्य स्तरीय निरीक्षण समिति में नामांकित स्वैच्छिक संगठनों के प्रतिनिधियों के लिए दैनिक आधार पर मानदेय तथा यात्रा भत्ता विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:10:56', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.178', NULL),
	(33, 'P', '["5", "6", "12"]', 2, 14, 240033, NULL, 'क्रं 11150/755/स्था-01/2024-25', 'श्री विरेन्द्र साहू, परियोजना अधिकारी, एकीकृत बाल विकास परियोजना-डोंगरगांव, जिला- राजनांदगांव का स्थानांतरण आदेश में संशोधन के संबंध में।', 'श्री विरेन्द्र साहू, परियोजना अधिकारी, एकीकृत बाल विकास परियोजना-डोंगरगांव, जिला- राजनांदगांव का स्थानांतरण आदेश में संशोधन के संबंध में।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:16:40', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.179', NULL),
	(34, 'P', '["5", "6", "12"]', 2, 14, 240034, NULL, 'क्रं 10791/490/स्था-01/2023/2024-25', 'असंवैधानिक ढंग से आरोपित किये जाने के संबंध में अभ्यावेदन-’ श्रीमती प्रीति खोखर चखियार, जिला कार्यक्रम अधिकारी, जशपुर', 'असंवैधानिक ढंग से आरोपित किये जाने के संबंध में अभ्यावेदन-’ श्रीमती प्रीति खोखर चखियार, जिला कार्यक्रम अधिकारी, जशपुर', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 12:18:46', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.178', NULL),
	(35, 'P', '["5", "6", "12"]', 2, 14, 240035, NULL, 'क्रं 10619/स्था-03/2024-25', 'समयमान-वेतनमान का लाभ प्रदान करने के संबंध में (श्री हेमलता मिश्रा, उप संचालक)', 'समयमान-वेतनमान का लाभ प्रदान करने के संबंध में (श्री हेमलता मिश्रा, उप संचालक)', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 12:20:55', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.178', NULL),
	(36, 'C', '["5", "6", "13"]', 2, 14, 240036, NULL, 'क्रं 12412/बजट-ऑडिट/2024-25', 'ऑडिट रिपोर्ट वर्ष 2021-22 (राज्य वित्त) दूसरा अध्याय-वित्तीय प्रबंधन एवं बजट नियंत्रण की कंडिकाओं पर विभागीय ज्ञापन विषयक्। (मांग संख्या 41 एवं 64)', 'ऑडिट रिपोर्ट वर्ष 2021-22 (राज्य वित्त) दूसरा अध्याय-वित्तीय प्रबंधन एवं बजट नियंत्रण की कंडिकाओं पर विभागीय ज्ञापन विषयक्। (मांग संख्या 41 एवं 64)', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 12:23:41', '2025-01-22 10:21:23', 1, NULL, NULL, 1, '162.158.162.179', '162.158.163.109'),
	(37, 'C', '["5", "6", "13"]', 2, 14, 240037, NULL, 'क्रं 12383/मबावि/निर्माण/2024-25', 'वित्तीय वर्ष 2024-25 में आंगनबाडी केन्द्रों का निर्माण मद अंतर्गत मांग संख्या41 एवं64 में प्रावधानित बजट राशि को नवीन मद के रूप के रूप में शामिल किये जाने हेतु आकस्मिकता निधि से राशि रूपये 2000.00 का प्रावधान करने हेतु प्रस्ताव प्रेषण।', 'वित्तीय वर्ष 2024-25 में आंगनबाडी केन्द्रों का निर्माण मद अंतर्गत मांग संख्या41 एवं64 में प्रावधानित बजट राशि को नवीन मद के रूप के रूप में शामिल किये जाने हेतु आकस्मिकता निधि से राशि रूपये 2000.00 का प्रावधान करने हेतु प्रस्ताव प्रेषण।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:27:49', '2025-01-22 11:47:30', 1, NULL, NULL, 1, '162.158.162.178', '172.69.165.11'),
	(38, 'P', '["5", "6", "13"]', 2, 14, 240038, NULL, 'क्रं 63/12204/मबावि/मि.वा./सारा/2024-25', 'राज्य में संचालित विशिष्ट दत्तक ग्रहण अभिकरणों को मान्यता प्रदान करने विषयक्।', 'राज्य में संचालित विशिष्ट दत्तक ग्रहण अभिकरणों को मान्यता प्रदान करने विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:30:20', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.178', NULL),
	(39, 'P', '["5", "6", "12"]', 2, 9, 240039, NULL, 'विभागीय', 'पंचूराम ठाकुर के सेवा विवरण संबंधी।', 'पंचूराम ठाकुर के सेवा विवरण संबंधी।', NULL, '2025-01-14', '2025-01-14', 2, '2025-01-14 12:34:31', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.20', NULL),
	(40, 'C', '["5", "6", "13"]', 2, 14, 240040, NULL, 'क्र. 4664/बजट-ऑडिट/2024-25', 'ऑडिट रिपोर्ट वर्ष 2013-14 (राज्य वित्त) से संबंधित कंडिकाओं पर बिन्दुवार अतिरिक्त जानकारी विषयक्।', 'ऑडिट रिपोर्ट वर्ष 2013-14 (राज्य वित्त) से संबंधित कंडिकाओं पर बिन्दुवार अतिरिक्त जानकारी विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:37:16', '2025-01-21 11:07:45', 1, NULL, NULL, 1, '172.69.165.58', '162.158.162.103'),
	(41, 'C', '["5", "6", "13"]', 2, 14, 240041, NULL, 'क्र./5233/मबावि/सावि/24-25', 'महिलाओं के कल्याण, सुरक्षा तथा संरक्षण संबंधी कानूनी अधिकारों के प्रचार-प्रसार के लिए जागरूकता/विधि सहायता/महिला जागृति शिविरों के आयोजन का प्रस्ताव।', 'महिलाओं के कल्याण, सुरक्षा तथा संरक्षण संबंधी कानूनी अधिकारों के प्रचार-प्रसार के लिए जागरूकता/विधि सहायता/महिला जागृति शिविरों के आयोजन का प्रस्ताव।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:46:57', '2025-01-15 09:19:55', 1, NULL, NULL, 1, '162.158.163.19', '162.158.162.86'),
	(42, 'C', '["5", "6", "13"]', 2, 14, 240042, NULL, 'क्र./8098/मबावि/24-25', 'मिशन शक्ति योजना का क्रियान्वयन अंतर्गत संचालित राज्य एवं जिला स्तरीय महिला सशक्तिकरण केन्द्र हेतु अनावर्ती मद में प्रावधानित बजट अंतर्गत सामग्री का क्रय बाबत् नवीन सेवा अंतर्गत क्रय की स्वीकृति।', 'मिशन शक्ति योजना का क्रियान्वयन अंतर्गत संचालित राज्य एवं जिला स्तरीय महिला सशक्तिकरण केन्द्र हेतु अनावर्ती मद में प्रावधानित बजट अंतर्गत सामग्री का क्रय बाबत् नवीन सेवा अंतर्गत क्रय की स्वीकृति।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:50:45', '2025-01-15 09:19:55', 1, NULL, NULL, 1, '172.69.165.20', '162.158.162.87'),
	(43, 'P', '["5", "6", "13"]', 2, 14, 240043, NULL, 'क्र./10058/स्था-01/मबावि/2024-25', 'मिशन सक्षम आंगनबाड़ी एवं पोषण 2.0 के तहत् पद संरचना सृजन विषयक्।', 'मिशन सक्षम आंगनबाड़ी एवं पोषण 2.0 के तहत् पद संरचना सृजन विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 12:55:07', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.59', NULL),
	(44, 'P', '["5", "6", "13"]', 2, 14, 240044, NULL, 'क्र./15577/207/मबावि/निर्माण/2024-25', 'वित्तीय वर्ष 2024-25 में मांग संख्या 41 में उद्देश्य शीर्ष 24-003 अनुरक्षण कार्य हेतु प्रावधानित बजट को नवीन मद के रूप मं शामिल किये जाने हेतु द्वितीय अनपूरक बजट प्रस्ताव।', 'वित्तीय वर्ष 2024-25 में मांग संख्या 41 में उद्देश्य शीर्ष 24-003 अनुरक्षण कार्य हेतु प्रावधानित बजट को नवीन मद के रूप मं शामिल किये जाने हेतु द्वितीय अनपूरक बजट प्रस्ताव।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 13:00:03', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.58', NULL),
	(45, 'C', '["5", "6", "13"]', 2, 14, 240045, NULL, 'क्र./12209/बजट-ऑडिट/2024-25', 'लोक लेखा समिति के प्रारूप प्रतिवेदन की तथ्यात्मक पुष्टि एवं अद्यतन जानकारी-ऑडिट रिपोर्ट वर्ष 2007-08/आधिक्य/बचत)', 'लोक लेखा समिति के प्रारूप प्रतिवेदन की तथ्यात्मक पुष्टि एवं अद्यतन जानकारी-ऑडिट रिपोर्ट वर्ष 2007-08/आधिक्य/बचत)', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 13:04:55', '2025-01-15 09:19:55', 1, NULL, NULL, 1, '162.158.163.238', '162.158.162.87'),
	(46, 'C', '["5", "6", "13"]', 2, 14, 240046, NULL, 'क्र./12176/25/समन्वय/संचा./मबावि/2024-25', '’’सर्व श्रेष्ठ भारत-विकास के राजदूत’’ के संबंध में जानकारी भेजने बाबत्।', '’’सर्व श्रेष्ठ भारत-विकास के राजदूत’’ के संबंध में जानकारी भेजने बाबत्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 13:10:46', '2025-01-15 09:19:55', 1, NULL, NULL, 1, '162.158.163.153', '162.158.162.86'),
	(47, 'P', '["5", "6", "13"]', 2, 14, 240047, NULL, 'क्र./12181/मबावि/आईसीडीएस/2024-25', 'आंगनबाड़ी गुणवत्ता उन्नयन अभियान के प्रचार-प्रसार देयकों के भुगतान की स्वीकृति विषयक्।', 'आंगनबाड़ी गुणवत्ता उन्नयन अभियान के प्रचार-प्रसार देयकों के भुगतान की स्वीकृति विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 13:13:24', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.58', NULL),
	(48, 'P', '["5", "6", "13"]', 2, 14, 240048, NULL, 'क्र./12332/मबावि/निर्माण/2024-25', 'आंगनबाड़ी केन्द्रों में पेयजल सूविधा कार्य हेतु भारत सरकार द्वारा जारी केन्द्रांश राशि के आहरण हेतु पुनर्विनियोजन प्रस्ताव बाबत्।', 'आंगनबाड़ी केन्द्रों में पेयजल सूविधा कार्य हेतु भारत सरकार द्वारा जारी केन्द्रांश राशि के आहरण हेतु पुनर्विनियोजन प्रस्ताव बाबत्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 13:18:11', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '172.69.165.13', NULL),
	(49, 'C', '["7", "8", "17"]', 1, 9, 240049, NULL, 'विभागीय', 'दर्पण पोर्टल में एन.जी.ओ. के पंजीकरण के सम्बंध में।', 'दर्पण पोर्टल में एन.जी.ओ. के पंजीकरण के सम्बंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 13:31:57', '2025-01-22 08:59:05', 1, NULL, NULL, 1, '172.69.165.59', '162.158.162.49'),
	(50, 'P', '["17", "18"]', 1, 9, 240050, NULL, 'विभागीय', 'मिशन वात्सल्य योजनांतर्गत वात्सल्य सदन के प्रशासकीय स्वीकृति के प्रस्ताव के सम्बंध में।', 'मिशन वात्सल्य योजनांतर्गत वात्सल्य सदन के प्रशासकीय स्वीकृति के प्रस्ताव के सम्बंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 13:33:19', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.234', NULL),
	(51, 'P', '["7", "8"]', 1, 9, 240051, NULL, 'विभागीय', 'कार्यस्थल पर महिलाओं के यौन उत्पीडन से सम्बंधित जमीनी क्रियान्वयन तथा सभी विभागों में क्रियान्वयन के संबंध में कार्ययोजना की जानकारी।', 'कार्यस्थल पर महिलाओं के यौन उत्पीडन से सम्बंधित जमीनी क्रियान्वयन तथा सभी विभागों में क्रियान्वयन के संबंध में कार्ययोजना की जानकारी।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 13:35:08', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.234', NULL),
	(52, 'P', '["3", "15", "18"]', 1, 9, 240052, NULL, 'विभागीय', 'सुपोषित ग्राम पंचायत के सम्बंध में जिलों से पोर्टल पर किये गये अद्यतन जानकारी तथा समस्त प्रस्ताव MoWCD को प्रेषित करने के सम्बंध में जानकारी।', 'सुपोषित ग्राम पंचायत के सम्बंध में जिलों से पोर्टल पर किये गये अद्यतन जानकारी तथा समस्त प्रस्ताव MoWCD को प्रेषित करने के सम्बंध में जानकारी।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 13:37:44', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.233', NULL),
	(53, 'P', '["5", "6"]', 2, 14, 240053, NULL, 'क्र.46/12638/मबावि/आईसीपीएस/सारा/24-25', 'मिशन वात्सल्य (Child Protection Services) अंतर्गत प्रवर्तकता कार्यक्रम क्रियान्वयन दिशा निर्देश 2022 में सांशोधन विषयक।', 'मिशन वात्सल्य (Child Protection Services) अंतर्गत प्रवर्तकता कार्यक्रम क्रियान्वयन दिशा निर्देश 2022 में सांशोधन विषयक।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 15:40:04', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.86', NULL),
	(54, 'C', '["5", "6"]', 2, 14, 240054, NULL, 'क्र./12639/समन्वय/संचा./मबावि/2024-25', '’’छत्तीसगढ़ नक्सलवाद उन्मूलन नीति’’ के संशोधन के संबंध में अभिमत बाबत्।', '’’छत्तीसगढ़ नक्सलवाद उन्मूलन नीति’’ के संशोधन के संबंध में अभिमत बाबत्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 15:43:50', '2025-01-20 11:26:15', 1, NULL, NULL, 1, '162.158.162.87', '162.158.163.151'),
	(55, 'C', '["5", "6"]', 2, 14, 240055, NULL, 'क्र./12650/समन्वय/संचा./मबावि/2023-24', 'मोदी की गारंटी और वादे की अद्यतन जानकारी भेजने विषयक्।', 'मोदी की गारंटी और वादे की अद्यतन जानकारी भेजने विषयक्।', NULL, '2025-01-14', '2025-01-14', 3, '2025-01-14 15:45:54', '2025-01-28 10:33:37', 1, NULL, NULL, 1, '162.158.163.151', '162.158.163.130'),
	(56, 'C', '["10", "14"]', 1, 10, 240056, NULL, 'क्र. 2703/818/वि-7', 'महात्मा गांधी नरेगा अंतर्गत अभिसरण के माध्यम से आंगनबाड़ी भवन निर्माण के संबंध में।', 'महात्मा गांधी नरेगा अंतर्गत अभिसरण के माध्यम से आंगनबाड़ी भवन निर्माण के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:10:39', '2025-01-28 10:33:19', 1, NULL, NULL, 1, '162.158.162.49', '162.158.163.130'),
	(57, 'P', '["15", "18"]', 1, 10, 240057, NULL, 'अर्द्ध. पत्र क्र./ 3990/अभि/02', 'छत्तीसगढ़ लोक आयोग के प्रकरणों में आपे विभाग से विभिन्न प्रकरणों में अपेक्षित जानकारियों की सूची अनुसार अपन विभाग के अधिनस्थों को यथाशीघ्र वांछित जानकारियां/प्रतिवेदन नियद समय में आयोग को उपलब्ध कराने हेतु (विविध 107/2022, 89/2018, 96/2013)', 'छत्तीसगढ़ लोक आयोग के प्रकरणों में आपे विभाग से विभिन्न प्रकरणों में अपेक्षित जानकारियों की सूची अनुसार अपन विभाग के अधिनस्थों को यथाशीघ्र वांछित जानकारियां/प्रतिवेदन नियद समय में आयोग को उपलब्ध कराने हेतु (विविध 107/2022, 89/2018, 96/2013)', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:17:35', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(58, 'C', '["10", "14"]', 1, 3, 240058, NULL, 'CD-II-22/18/2024-CD-II (e-116697)', 'Minutes of Meeting Review the availability of basic facilities in Anganwadi centress. (The state has been requsted to ensure uploading/rectification of the data on the Pt on priority by 15 th November 2024', 'Minutes of Meeting Review the availability of basic facilities in Anganwadi centress. (The state has been requsted to ensure uploading/rectification of the data on the Pt on priority by 15 th November 2024', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:25:30', '2025-01-28 10:32:22', 1, NULL, NULL, 1, '162.158.163.243', '162.158.163.130'),
	(59, 'C', '["16"]', 1, 10, 240059, NULL, 'क्र./97/नि.स./स./वित्त/2024', 'ऑडिट रिपोर्ट कंडिकाओं पर पालन प्रतिवेदन एवं अतिरिक्त जानकारी विधानसभा को समय पर उपलबध कराने के संबंध में।', 'ऑडिट रिपोर्ट कंडिकाओं पर पालन प्रतिवेदन एवं अतिरिक्त जानकारी विधानसभा को समय पर उपलबध कराने के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:30:49', '2025-01-28 10:31:41', 1, NULL, NULL, 1, '162.158.162.49', '162.158.163.130'),
	(60, 'C', '["9"]', 1, 10, 240060, NULL, 'क्र./4547/मुमंस/2024', 'ग्राम पंचायत फरसवानी के आंगनबाड़ी केन्द्र फरसवानी में आंगनबाड़ी कार्यकर्ता के पद पर फर्जी तरीके से न्यू ग्राम पंचायत के निवासी श्रीमती रजनी बियार की नियुक्ति को निरस्त कर दोषी अधिकारी के ऊपर उचित कार्यवाही करने बाबत्।', 'ग्राम पंचायत फरसवानी के आंगनबाड़ी केन्द्र फरसवानी में आंगनबाड़ी कार्यकर्ता के पद पर फर्जी तरीके से न्यू ग्राम पंचायत के निवासी श्रीमती रजनी बियार की नियुक्ति को निरस्त कर दोषी अधिकारी के ऊपर उचित कार्यवाही करने बाबत्।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:35:38', '2025-01-28 10:31:29', 1, NULL, NULL, 1, '162.158.162.170', '162.158.163.130'),
	(61, 'C', '["9"]', 1, 10, 240061, NULL, 'आंगनबाड़ी कार्यकर्ता बिलासपुर सं ईमेल द्वारा प्राप्त', 'आंगनबाड़ी कार्यकर्ता के समस्या के समाधान हेतु अनुरोध।', 'आंगनबाड़ी कार्यकर्ता के समस्या के समाधान हेतु अनुरोध।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:41:55', '2025-01-28 10:31:15', 1, NULL, NULL, 1, '162.158.162.102', '162.158.163.130'),
	(62, 'C', '["9", "15"]', 1, 3, 240062, NULL, 'CD-II-22/13/2024-CD-II-(e-115958)', 'Timely submussion of US/SoEs of various components under mission Sksham Anganwadi and Poshan 2.0-reg.', 'Timely submussion of US/SoEs of various components under mission Sksham Anganwadi and Poshan 2.0-reg.', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:48:33', '2025-01-28 10:31:03', 1, NULL, NULL, 1, '162.158.162.87', '162.158.163.130'),
	(63, 'C', '["16"]', 1, 14, 240063, NULL, 'S.No. R2-41/DIF/PFMS/Ledacy', 'PFMS-Pendency of Legacy Data Entry in PFMS-regarding.', 'PFMS-Pendency of Legacy Data Entry in PFMS-regarding.', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:53:36', '2025-01-28 10:30:43', 1, NULL, NULL, 1, '162.158.163.222', '162.158.163.130'),
	(64, 'P', '["8"]', 1, 10, 240064, NULL, 'विभागीय', 'महतारी वंदन योजना की कुल दर्ज शिकायत तथा निराकरण की जानकारी का अवलोकन।', 'महतारी वंदन योजना की कुल दर्ज शिकायत तथा निराकरण की जानकारी का अवलोकन।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 17:59:30', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.244', NULL),
	(65, 'P', '["9", "14"]', 1, 10, 240065, NULL, 'क्र./2466/आर-246/आरडीएसएस/2022213/2', 'आरडीएसएस योजना के अनिवार्यता के तहत वित्तीय वर्ष 2023-24 में शासकीय विभागों के बकाया विद्युत देयकों के भुगतान के संबंध में।', 'आरडीएसएस योजना के अनिवार्यता के तहत वित्तीय वर्ष 2023-24 में शासकीय विभागों के बकाया विद्युत देयकों के भुगतान के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:04:16', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.86', NULL),
	(66, 'P', '["10", "14"]', 1, 10, 240066, NULL, 'Letter No. 107 Commerce and Industry Department', 'Regarding uploading of identified layers and correctiong of attributes for alredy uploaded layers in SMP under PM GatiShakti Scheme', 'Regarding uploading of identified layers and correctiong of attributes for alredy uploaded layers in SMP under PM GatiShakti Scheme', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:12:46', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.91', NULL),
	(67, 'P', '["9"]', 1, 10, 240067, NULL, 'F.No.11/2/2019-CD-I', 'Inclusion of AWWs and AWhs under Ayushman Bharat Pradhan Matri-Jan Arogya Yojana (AB Pm-jay)reg.', 'Inclusion of AWWs and AWhs under Ayushman Bharat Pradhan Matri-Jan Arogya Yojana (AB Pm-jay)reg.', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:17:47', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.151', NULL),
	(68, 'C', '["17"]', 1, 3, 240068, NULL, 'No. CW-II-30/30/2022-CW-II (e-101382)', 'Up-dation of Data by the States/UTs on the DBT Bharat Portal Mission (from 01.04.2024 to 30.06.2024) Vatsalya mission Scheme-Reg.', 'Up-dation of Data by the States/UTs on the DBT Bharat Portal Mission (from 01.04.2024 to 30.06.2024) Vatsalya mission Scheme-Reg.', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:25:23', '2025-01-22 08:49:11', 1, NULL, NULL, 1, '162.158.162.86', '162.158.163.102'),
	(69, 'P', '["3"]', 1, 10, 240069, NULL, 'No. CG/GMTD-RYP/LC/2023-24,', 'महिला एवं बाल विकास विभाग (JUVENILE) के कार्यालयों में कार्यरत लीज लाईन के लंबित बिलों के भुगतान बाबत।', 'महिला एवं बाल विकास विभाग (JUVENILE) के कार्यालयों में कार्यरत लीज लाईन के लंबित बिलों के भुगतान बाबत।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:33:45', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.109', NULL),
	(70, 'P', '["3"]', 1, 10, 240070, NULL, 'No. CG/GMTD-RYP/LC/2023-24,', 'महिला एवं बाल विकास के कार्यालयों में कार्यरत लीज लाईन के लंबित जिलों के भुगतान बाबत्।', 'महिला एवं बाल विकास के कार्यालयों में कार्यरत लीज लाईन के लंबित जिलों के भुगतान बाबत्।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:35:26', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.86', NULL),
	(71, 'P', '["4"]', 1, 10, 240071, NULL, 'विभागीय', 'विभाग का वेब पोर्टल तैयार करने के संबंध में।', 'विभाग का वेब पोर्टल तैयार करने के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:40:22', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.247', NULL),
	(72, 'P', '["4"]', 1, 10, 240072, NULL, 'विभागीय', 'छत्तीसगढ़ राज्य महिला आयोग के सदस्यों के वेतन भत्ते एवं अन्य सुविधाओं के संबंध में।', 'छत्तीसगढ़ राज्य महिला आयोग के सदस्यों के वेतन भत्ते एवं अन्य सुविधाओं के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:41:50', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.102', NULL),
	(73, 'P', '["10", "14"]', 1, 9, 240073, NULL, 'विभागीय', 'NIPCCD के चिन्हाकित जमीन के संबंध में।', 'NIPCCD के चिन्हाकित जमीन के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:49:08', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(74, 'C', '["17"]', 1, 3, 240074, NULL, 'D.O. No. CW-I-19011-2-2024-cw-I', 'Veer Ball Dewas 2024-report on celebration activities in states/Uts', 'Veer Ball Dewas 2024-report on celebration activities in states/Uts', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:50:18', '2025-01-28 10:23:37', 1, NULL, NULL, 1, '162.158.162.86', '162.158.163.151'),
	(75, 'P', '["3", "15"]', 1, 9, 240075, NULL, 'विभागीय', 'रेडी-टू-ईट पोर्टल के संबंध में।', 'रेडी-टू-ईट पोर्टल के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:50:24', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.48', NULL),
	(76, 'P', '["3", "15"]', 1, 9, 240076, NULL, 'विभागीय', 'THR Recipe परिवर्तन के संबंध में।', 'THR Recipe परिवर्तन के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:51:52', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(77, 'P', '["3", "15"]', 1, 9, 240077, NULL, 'विभागीय', 'गर्म पका हुआ भोजन के मानकीकरण के संबंध में।', 'गर्म पका हुआ भोजन के मानकीकरण के संबंध में।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:53:38', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(78, 'C', '["16"]', 1, 10, 240078, NULL, 'क्र./4599/04-00112/वित्त/ब-4/2', 'वर्ष 2025-2026 के बजट प्रस्ताव (नीवन मद के प्रस्ताव सहित) पर सचिव स्तरीय चर्चा।', 'वर्ष 2025-2026 के बजट प्रस्ताव (नीवन मद के प्रस्ताव सहित) पर सचिव स्तरीय चर्चा।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:54:49', '2025-01-28 10:21:03', 1, NULL, NULL, 1, '162.158.163.151', '162.158.163.152'),
	(79, 'P', '["18"]', 1, 10, 240079, NULL, 'क्र./02/919/2024/साप्रवि/1-7,', 'छत्तीसगढ़ लोक आयोग से संबंधित लोक शिकायती प्रकरणों के संबंध में तथ्यात्मक प्रतिवेदन, दस्तावेज या अनय वांछित जानकारी उपलब्ध कराने बाबत्ं', 'छत्तीसगढ़ लोक आयोग से संबंधित लोक शिकायती प्रकरणों के संबंध में तथ्यात्मक प्रतिवेदन, दस्तावेज या अनय वांछित जानकारी उपलब्ध कराने बाबत्ं', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 18:57:52', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.151', NULL),
	(80, 'C', '["7"]', 1, 10, 240080, NULL, 'No. f 20-35-2023', 'Decreminalization of various Acts/Rules under reducing the compliance burden forbusiness and citizen in Chhattisgarh.', 'Decreminalization of various Acts/Rules under reducing the compliance burden forbusiness and citizen in Chhattisgarh.', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 19:04:15', '2025-01-28 10:20:22', 1, NULL, NULL, 1, '162.158.163.171', '162.158.162.48'),
	(81, 'P', '["3", "7", "10", "16", "17"]', 1, 10, 240081, NULL, 'क्र./5229/मुमंस/2024/एम 5-27,', 'विभागों की समीक्षा बैठक संबंधी।', 'विभागों की समीक्षा बैठक संबंधी।', NULL, '2025-01-14', '2025-01-14', 1, '2025-01-14 19:09:15', '2025-01-15 09:19:55', 1, NULL, NULL, NULL, '162.158.163.247', NULL),
	(83, 'C', '["5", "6"]', 2, 14, 240082, NULL, 'क्र./12693/111/मबावि/सावि/24-25', 'पाटन छत्तीसगढ़ी ग्रामीण जन विकास सेवा संस्थान ग्राम ढौर, तहसील पाटन जिला दुर्ग द्वारा महिलाओं को व्यावसायिक प्रशिक्षण (सिलाई) हेतु अनुदान प्रस्ताव वर्ष 2024-25', 'पाटन छत्तीसगढ़ी ग्रामीण जन विकास सेवा संस्थान ग्राम ढौर, तहसील पाटन जिला दुर्ग द्वारा महिलाओं को व्यावसायिक प्रशिक्षण (सिलाई) हेतु अनुदान प्रस्ताव वर्ष 2024-25', NULL, '2025-01-14', '2025-01-15', 3, '2025-01-15 16:52:02', '2025-01-22 10:19:39', 1, NULL, NULL, 1, '162.158.163.152', '162.158.163.110'),
	(84, 'P', '["5", "6", "12"]', 2, 14, 240084, NULL, 'क्र./12660/734/मबावि/स्था.02/2024-25', 'स्थानांतरण करने के संबंध में।', '1/ श्रीमती रश्मि निर्मलकर, पर्यवेक्षक\r\n2/ श्रीमती मक्सीमा केरकेट्टा, \r\n3/ श्रीमती अंजना खलखो, पर्यवेक्षक\r\n4/ श्रीमती गीता जयकृष्णन, पर्यवेक्षक', NULL, '2025-01-10', '2025-01-15', 3, '2025-01-15 16:58:38', NULL, 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(85, 'C', '["5", "6"]', 2, 14, 240085, NULL, 'क्र./12680/मबावि/प्रशि/2024-25', 'एन.जी.ओ. एवं स्वायत्त संस्थाओं को प्रदाय किये जाने वाले अनुदान के संबंध में।', 'एन.जी.ओ. एवं स्वायत्त संस्थाओं को प्रदाय किये जाने वाले अनुदान के संबंध में।', NULL, '2025-01-14', '2025-01-15', 3, '2025-01-15 17:01:30', '2025-01-22 10:19:08', 1, NULL, NULL, 1, '162.158.163.175', '162.158.163.110'),
	(86, 'P', '["5", "6"]', 2, 14, 240086, NULL, 'क्र./12711/533/स्था.-03/मबावि/2024-25', 'क्वांटिफायबल डाटा (मात्रात्मक आंकड़े) समिति की बैठक के संबंध में।', 'क्वांटिफायबल डाटा (मात्रात्मक आंकड़े) समिति की बैठक के संबंध में।', NULL, '2025-01-14', '2025-01-15', 3, '2025-01-15 17:04:14', NULL, 1, NULL, NULL, NULL, '162.158.163.77', NULL),
	(87, 'C', '["5", "6"]', 2, 14, 240087, NULL, 'क्र./12659/961/स्था. 02/मबावि/2024-25', 'No. of persons with disabilities working in the state Government Establishment as well as private section within the State/UT reg.', 'No. of persons with disabilities working in the state Government Establishment as well as private section within the State/UT reg.', NULL, '2025-01-10', '2025-01-15', 3, '2025-01-15 17:12:11', '2025-01-22 10:18:38', 1, NULL, NULL, 1, '162.158.163.176', '162.158.163.110'),
	(88, 'P', '["5", "6", "13"]', 2, 14, 240088, NULL, 'क्र./12383/मबावि/निर्माण/2024-25', 'वित्तीय वर्ष 2024-25 में आंगनबाड़ियों केन्द्रों का निर्माण मद अंतर्गत मांग संख्या 41 एवं 64 में प्रावधानित बजट राशि को नवीन मद के रूप् में शामिल किये जाने हेतु आकस्मिकता निधि से राशि रूप्ये 2000.00 का प्रावधान करने हेतु प्रस्ताव प्रेषण।', 'वित्तीय वर्ष 2024-25 में आंगनबाड़ियों केन्द्रों का निर्माण मद अंतर्गत मांग संख्या 41 एवं 64 में प्रावधानित बजट राशि को नवीन मद के रूप् में शामिल किये जाने हेतु आकस्मिकता निधि से राशि रूप्ये 2000.00 का प्रावधान करने हेतु प्रस्ताव प्रेषण।', NULL, '2025-01-03', '2025-01-16', 3, '2025-01-16 10:30:48', NULL, 1, NULL, NULL, NULL, '162.158.163.190', NULL),
	(89, 'P', '["5", "6", "13"]', 2, 14, 240089, NULL, 'क्र./12003/मबावि/2024-25', 'महतारी वंदन योजना का क्रियान्वयन अंतर्गत 04 नग लेपटॉप का क्रय बाबत्।', 'महतारी वंदन योजना का क्रियान्वयन अंतर्गत 04 नग लेपटॉप का क्रय बाबत्।', NULL, '2024-12-27', '2025-01-16', 3, '2025-01-16 11:14:38', NULL, 1, NULL, NULL, NULL, '162.158.162.86', NULL),
	(90, 'C', '["5", "6", "13"]', 2, 14, 240090, NULL, 'क्र./12101/मबावि/भंडार/2024-25', 'वाहन की पात्रता में शिथिलीकरण का प्रस्ताव।', 'वाहन की पात्रता में शिथिलीकरण का प्रस्ताव।', NULL, '2024-12-31', '2025-01-16', 3, '2025-01-16 11:27:50', '2025-01-28 10:19:20', 1, NULL, NULL, 1, '162.158.163.175', '162.158.162.48'),
	(91, 'C', '["6", "10", "12"]', 1, 4, 240091, NULL, 'क्र./205 मुमंस/2025/एम 5-27', 'माननीय मुख्यमंत्रीजी द्वारा निर्देशित पत्रों पर त्वरित कार्रवाही करने बाबत्।', 'माननीय मुख्यमंत्रीजी द्वारा निर्देशित पत्रों पर त्वरित कार्रवाही करने बाबत्।', NULL, '2025-01-10', '2025-01-16', 1, '2025-01-16 11:52:52', '2025-01-22 10:17:40', 1, NULL, NULL, 1, '172.69.165.63', '162.158.163.110'),
	(92, 'P', '["3", "7", "10"]', 1, 9, 240092, NULL, 'क्र. एफ 15-1/2024/एफ-6(पार्ट)', 'दिनांक 30 अगस्त, 2024 को लखनऊ, उत्तर प्रदेश में आयोजित मध्य क्षेत्रीय परिषद की स्थायी समिति की 16 वीं बैठक का कार्यवाही विवरण के संबंध में।', 'दिनांक 30 अगस्त, 2024 को लखनऊ, उत्तर प्रदेश में आयोजित मध्य क्षेत्रीय परिषद की स्थायी समिति की 16 वीं बैठक का कार्यवाही विवरण के संबंध में।', NULL, '2025-01-14', '2025-01-16', 1, '2025-01-16 12:00:28', NULL, 1, NULL, NULL, NULL, '162.158.163.243', NULL),
	(93, 'C', '["3", "7", "10"]', 1, 9, 240093, NULL, 'PLGMj-2403/1/2025-GAD-5', 'छत्तीसगढ़ की विधान सभा के बजट सत्र वर्ष 2025 हेतु माननीय राज्यपाल का अभिभाषण।', 'छत्तीसगढ़ की विधान सभा के बजट सत्र वर्ष 2025 हेतु माननीय राज्यपाल का अभिभाषण।', NULL, '2025-01-15', '2025-01-16', 1, '2025-01-16 12:05:06', '2025-01-28 10:18:46', 1, NULL, NULL, 1, '162.158.162.102', '162.158.162.48'),
	(94, 'P', '["17", "18"]', 1, 12, 240094, NULL, 'No. 743 III-6-3/16(JJC-66)', 'Regarding guideline with regard to utilization of the amount deposited/transmitted to the Observation Homes as cost/fine deposited by Petitioners in compliance of the order of Hon\'ble High Court.', 'Regarding guideline with regard to utilization of the amount deposited/transmitted to the Observation Homes as cost/fine deposited by Petitioners in compliance of the order of Hon\'ble High Court.', NULL, '2025-01-14', '2025-01-16', 1, '2025-01-16 12:10:53', NULL, 1, NULL, NULL, NULL, '162.158.163.172', NULL),
	(95, 'C', '["7", "8"]', 1, 14, 240095, NULL, 'क्र./174/2203/दो-गृह/रापुसे/2024', 'आवेदक प्रकाश बांधे, ग्राम मुन्दरा अभनपुर-रायपुर द्वारा की गई शिकायत के संबंध में।', 'आवेदक प्रकाश बांधे, ग्राम मुन्दरा अभनपुर-रायपुर द्वारा की गई शिकायत के संबंध में।', NULL, '2025-01-14', '2025-01-16', 1, '2025-01-16 12:15:45', '2025-01-28 10:17:33', 1, NULL, NULL, 1, '162.158.162.67', '162.158.162.48'),
	(96, 'P', '["6", "12", "18"]', 1, 9, 240096, NULL, 'क्र./302/प्र.क्र./225/2012/2025', 'प्रकरण क्रमांक 225/2012/में जानकारी हेतु।  (श्री अनिक अधिवक्ता विरूद्ध री राजेन्द्र कश्यप व अन्य)', 'प्रकरण क्रमांक 225/2012/में जानकारी हेतु। \r\n(श्री अनिक अधिवक्ता विरूद्ध री राजेन्द्र कश्यप व अन्य)', NULL, '2025-01-10', '2025-01-16', 1, '2025-01-16 12:19:07', NULL, 1, NULL, NULL, NULL, '172.69.165.11', NULL),
	(97, 'P', '["5", "6"]', 2, 14, 240097, NULL, 'क्र./12848/331बी/मबावि/एससीपीएस/24-25', 'छत्तीसगढ़ राज्य बाल अधिकार संरक्षण आयोग के सदस्यों के चयन संबंधी कार्यवाही हेतु चयन समिति की बैठक विषयक्।', 'छत्तीसगढ़ राज्य बाल अधिकार संरक्षण आयोग के सदस्यों के चयन संबंधी कार्यवाही हेतु चयन समिति की बैठक विषयक्।', NULL, '2025-01-15', '2025-01-16', 3, '2025-01-16 12:46:47', NULL, 1, NULL, NULL, NULL, '162.158.162.48', NULL),
	(98, 'P', '["5", "6"]', 2, 14, 240098, NULL, 'क्र./एफ-965/12802/स्था.01/मबावि/2024-25', 'महिला एवं बाल विकास विभाग अंतर्गत आंतरिक लेखा परीक्षा प्रकोष्ठ के गठन विषयक्।', 'महिला एवं बाल विकास विभाग अंतर्गत आंतरिक लेखा परीक्षा प्रकोष्ठ के गठन विषयक्।', NULL, '2025-01-14', '2025-01-16', 3, '2025-01-16 12:50:48', NULL, 1, NULL, NULL, NULL, '172.69.165.63', NULL),
	(99, 'P', '["5", "6"]', 2, 14, 240099, NULL, 'क्र./12715/853/मबावि/स्था.01/2024-25', 'महिला एवं बाल विकास विभाग में संभाग स्तीय कार्यालय सृजित करने के संबंध में।', 'महिला एवं बाल विकास विभाग में संभाग स्तीय कार्यालय सृजित करने के संबंध में।', NULL, '2025-01-14', '2025-01-16', 3, '2025-01-16 12:55:59', NULL, 1, NULL, NULL, NULL, '162.158.163.176', NULL),
	(100, 'P', '["5", "6", "13"]', 2, 14, 240100, NULL, 'क्र./11854/मबावि/भंडार/2024-25', 'कार्यालय हेतु 03 नग फोटोकापियर मशीन एवं 01 नग लेैपटॉप क्रय की प्रशासकीय एवं वित्त विभाग की स्वीकृति बाबत्।', 'कार्यालय हेतु 03 नग फोटोकापियर मशीन एवं 01 नग लेैपटॉप क्रय की प्रशासकीय एवं वित्त विभाग की स्वीकृति बाबत्।', NULL, '2024-12-16', '2025-01-16', 3, '2025-01-16 14:59:38', NULL, 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(101, 'P', '["5", "6", "13"]', 2, 14, 240101, NULL, 'क्र./12929/मबावि/ICDS-I/2024-25', 'आंगनबाड़ी सेवाओं के अन्तर्गत उपलब्ध निधि से आंगनबाड़ी कार्यकर्ता/सहायिका के लिए यूनिफार्म (साड़ी) प्रदाय विषयक्। वर्ष 2024-25', 'आंगनबाड़ी सेवाओं के अन्तर्गत उपलब्ध निधि से आंगनबाड़ी कार्यकर्ता/सहायिका के लिए यूनिफार्म (साड़ी) प्रदाय विषयक्। वर्ष 2024-25', NULL, '2025-01-16', '2025-01-16', 3, '2025-01-16 16:46:34', NULL, 1, NULL, NULL, NULL, '162.158.163.82', NULL),
	(102, 'P', '["5", "6", "13"]', 2, 14, 240102, NULL, 'क्र./12907/ICDS-01/मबावि/2024-25', 'चक्रानुक्रम मद से प्रदाय फर्नीचर सामग्री के भुगतान का प्रस्ताव- वष्र 2023-24।', 'चक्रानुक्रम मद से प्रदाय फर्नीचर सामग्री के भुगतान का प्रस्ताव- वष्र 2023-24।', NULL, '2025-01-16', '2025-01-16', 3, '2025-01-16 16:49:44', NULL, 1, NULL, NULL, NULL, '162.158.162.75', NULL),
	(103, 'C', '["5", "6"]', 2, 14, 240103, NULL, 'क्र./12906/समन्वय/संचा./मबावि/2024-25', 'राज्य के नक्सल प्रभावित क्षेत्रों में अत्यावश्यक (क्रिटिकल) अधोसंरचना के कार्यों को द्रुत गति से कराने विषयक्।', 'राज्य के नक्सल प्रभावित क्षेत्रों में अत्यावश्यक (क्रिटिकल) अधोसंरचना के कार्यों को द्रुत गति से कराने विषयक्।', NULL, '2025-01-16', '2025-01-17', 3, '2025-01-17 12:32:49', '2025-01-22 10:16:46', 1, NULL, NULL, 1, '162.158.163.129', '162.158.163.110'),
	(104, 'C', '["5", "6"]', 2, 14, 240104, NULL, 'क्र./12910/मबावि/समन्वय/2024-25', 'छत्तीसगढ़ का आर्थिक सर्वेक्षण वर्ष 2024-25।', 'छत्तीसगढ़ का आर्थिक सर्वेक्षण वर्ष 2024-25।', NULL, '2025-01-16', '2025-01-17', 3, '2025-01-17 12:35:21', '2025-01-22 10:15:52', 1, NULL, NULL, 1, '162.158.162.67', '162.158.163.90'),
	(105, 'C', '["5", "6"]', 2, 14, 240105, NULL, 'क्र./10395/मबावि/ICDS/2024.25', 'Administative Sanction of left over/remaining funds of Anganwadi Centers for upgradation into Saksham Anganwadi under Mission Saksham Anganwadi and POSHAN 2.0 for FY 2022-23 reg.', 'Administrative Sanction of left over/remaining funds of Anganwadi Centers for upgradation into Saksham Anganwadi under Mission Saksham Anganwadi and POSHAN 2.0 for FY 2022-23 reg.', NULL, '2024-11-26', '2025-01-17', 3, '2025-01-17 12:45:35', '2025-01-21 11:11:23', 1, NULL, NULL, 1, '162.158.163.82', '162.158.162.103'),
	(106, 'P', '["6", "17", "18"]', 1, 9, 240106, NULL, 'एफ 8-116/2024/NHRC/गृह-सी', 'राष्ट्रीय मानव अधिकार आयोग, नई दिल्ली का प्रकरण क्रमांक 489/33/2024-DH के संबंध में।', 'राष्ट्रीय मानव अधिकार आयोग, नई दिल्ली का प्रकरण क्रमांक 489/33/2024-DH के संबंध में।', NULL, '2025-01-08', '2025-01-17', 1, '2025-01-17 15:16:40', NULL, 1, NULL, NULL, NULL, '162.158.163.176', NULL),
	(107, 'P', '["5", "6", "12"]', 2, 14, 240107, NULL, 'क्र./12960/521/स्था.-03/मबावि/2024-25', 'महिला एवं बाल विकास विभाग में कार्यरत डाटा एंट्री आपरेटर का नियम विरूद्ध पदोन्नति देने के संबंध में।', 'महिला एवं बाल विकास विभाग में कार्यरत डाटा एंट्री आपरेटर का नियम विरूद्ध पदोन्नति देने के संबंध में।', NULL, '2025-01-16', '2025-01-17', 3, '2025-01-17 16:26:58', NULL, 1, NULL, NULL, NULL, '162.158.163.19', NULL),
	(108, 'P', '["5", "6", "12"]', 2, 14, 240108, NULL, 'क्र./12999/182ए/स्था.-01/मबावि/2024-25', 'परीक्षा में सम्मिलित होने की अनुमति प्रदान करने विषयक्। (सुश्री दीक्षा वैद्य, बाल विकास परियोजना अधिकारी)', 'परीक्षा में सम्मिलित होने की अनुमति प्रदान करने विषयक्। (सुश्री दीक्षा वैद्य, बाल विकास परियोजना अधिकारी)', NULL, '2025-01-17', '2025-01-17', 3, '2025-01-17 16:31:32', NULL, 1, NULL, NULL, NULL, '162.158.163.20', NULL),
	(109, 'P', '["5", "6", "13"]', 2, 14, 240109, NULL, 'क्र./11351/मबावि/ICDS/2024-25', 'राज्य शासन की निधि से आंगनबाड़ी केन्द्रों में चक्रानुक्रम मद अन्तर्गत सामग्री क्रय हेतु प्रस्ताव-वर्ष 2024-25।(बर्तन)', 'राज्य शासन की निधि से आंगनबाड़ी केन्द्रों में चक्रानुक्रम मद अन्तर्गत सामग्री क्रय हेतु प्रस्ताव-वर्ष 2024-25।(बर्तन)', NULL, '2024-12-12', '2025-01-20', 3, '2025-01-20 11:12:45', NULL, 1, NULL, NULL, NULL, '162.158.162.103', NULL),
	(110, 'P', '["5", "6", "12"]', 2, 14, 240110, NULL, 'क्र./9086/734 III/मबावि/स्था.-02/2024-25', 'स्थानांतरण आदेश पर संशोधन।  1/ श्रीमती कौशलया टेकाम 2/सुश्री हीरामुनी राजवाड़े।', 'स्थानांतरण आदेश पर संशोधन। \r\n1/ श्रीमती कौशलया टेकाम\r\n2/सुश्री हीरामुनी राजवाड़े।', NULL, '2024-10-17', '2025-01-20', 3, '2025-01-20 11:22:12', NULL, 1, NULL, NULL, NULL, '162.158.162.83', NULL),
	(111, 'C', '["5", "6"]', 2, 14, 240111, NULL, 'क्र./12397/130बी/मबावि/आई-04/2024-25', 'जिला-कोरिया/मनेन्द्रगढ़ की सीमाओं में हुए परिवर्तन के संबंध में।', 'जिला-कोरिया/मनेन्द्रगढ़ की सीमाओं में हुए परिवर्तन के संबंध में।', NULL, '2025-01-05', '2025-01-20', 3, '2025-01-20 11:37:06', '2025-01-22 10:24:20', 1, NULL, NULL, 1, '162.158.163.176', '162.158.163.109'),
	(112, 'C', '["5", "6"]', 2, 14, 240112, NULL, 'क्र./12397/130बी/मबावि/आई-04/2024-25', 'जिला-कोरिया/मनेन्द्रगढ़ की सीमाओं में हुए परिवर्तन के संबंध में।', 'जिला-कोरिया/मनेन्द्रगढ़ की सीमाओं में हुए परिवर्तन के संबंध में।', NULL, '2025-01-05', '2025-01-20', 3, '2025-01-20 11:37:06', '2025-01-21 11:13:43', 1, NULL, NULL, 1, '162.158.163.175', '162.158.162.103'),
	(113, 'C', '["5", "6", "13"]', 2, 14, 240113, NULL, 'क्र./11585/आईसीडीएस-1/2023-24', 'वजन त्यौहार के लिए प्रचार’प्रसार सामग्री का मुद्रण के भुगतान विषयक् । वर्ष 23-24', 'वजन त्यौहार के लिए प्रचार’प्रसार सामग्री का मुद्रण के भुगतान विषयक् । वर्ष 23-24', NULL, '2024-12-17', '2025-01-20', 3, '2025-01-20 12:00:57', '2025-01-22 10:14:09', 1, NULL, NULL, 1, '162.158.162.87', '162.158.163.90'),
	(114, 'C', '["5", "6", "13"]', 2, 14, 240114, NULL, 'क्र./12679/बजट-ऑडिट/2024-25', 'लोक लेखा समिति का चौदहवां प्रतिवेदन(पंचम विधानसभा) के कार्यान्वयन संबंधित जानकारी बाबत्।', 'लोक लेखा समिति का चौदहवां प्रतिवेदन(पंचम विधानसभा) के कार्यान्वयन संबंधित जानकारी बाबत्।', NULL, '2025-01-14', '2025-01-20', 3, '2025-01-20 12:48:54', '2025-01-22 10:13:35', 1, NULL, NULL, 1, '162.158.163.243', '162.158.163.90'),
	(115, 'P', '["5", "6", "12"]', 2, 14, 240115, NULL, 'क्र./12971/985/मबावि/स्था.01/2023', 'राज्य सेवा परीक्षा-2023 के माध्यम से सहायक संचालक/जिला महिला एवं बाल विकास अधिकारी के रिक्त पदों की पूर्ति हेतु चयनित अभ्यर्थियों के मूल दस्तावेजों का सत्यापन।', 'राज्य सेवा परीक्षा-2023 के माध्यम से सहायक संचालक/जिला महिला एवं बाल विकास अधिकारी के रिक्त पदों की पूर्ति हेतु चयनित अभ्यर्थियों के मूल दस्तावेजों का सत्यापन।', NULL, '2025-01-17', '2025-01-20', 3, '2025-01-20 12:53:32', NULL, 1, NULL, NULL, NULL, '162.158.163.77', NULL),
	(116, 'P', '["5", "6", "12"]', 2, 14, 240116, NULL, 'क्र./11724/734 III/मबावि/स्था.-02/2024-25', 'श्रीमती स्नेहलता गौतम, पर्यवेक्षक, परियोजना-जामगांव एम, जिला दुर्ग (छ.ग.) का स्थानांतरण के संबंध में।', 'श्रीमती स्नेहलता गौतम, पर्यवेक्षक, परियोजना-जामगांव एम, जिला दुर्ग (छ.ग.) का स्थानांतरण के संबंध में।', NULL, '2024-12-19', '2025-01-20', 3, '2025-01-20 15:58:23', NULL, 1, NULL, NULL, NULL, '162.158.163.176', NULL),
	(117, 'P', '["5", "6", "12"]', 2, 14, 240117, NULL, 'क्रं 9086/734 III/मबावि/स्था-02/2024-25', 'स्थानांतरण आदेश पर संशोधन।  (श्रीमती सरोजनी मिंज)', 'स्थानांतरण आदेश पर संशोधन। \r\n(श्रीमती सरोजनी मिंज)', NULL, '2024-10-17', '2025-01-20', 3, '2025-01-20 16:11:49', NULL, 1, NULL, NULL, NULL, '162.158.163.151', NULL),
	(118, 'P', '["5", "6", "12"]', 2, 14, 240118, NULL, 'क्रं 9077/755 पार्ट/स्था.01/2024', 'अधिकारियों का स्थानांतरण प्रस्ताव प्रेषित करने बाबत्। (शालिनी दलेला, सहायक संचालक)', 'अधिकारियों का स्थानांतरण प्रस्ताव प्रेषित करने बाबत्। (शालिनी दलेला, सहायक संचालक)', NULL, '2024-10-17', '2025-01-20', 3, '2025-01-20 17:08:34', NULL, 1, NULL, NULL, NULL, '162.158.162.87', NULL),
	(119, 'P', '["5", "6", "12"]', 2, 14, 240119, NULL, 'क्र./13073/998/मबावि/स्था.01/2023', 'राज्य सेवा परीक्षा-2023 के माध्यम से बाल विकास परियोजना अधिकारी संवर्ग की रिक्त पदों की  पूर्ति हेतु चयनित अभ्यर्थियों के मूल दस्तावेजों/प्रमाण पत्रों का सत्यापन।', 'राज्य सेवा परीक्षा-2023 के माध्यम से बाल विकास परियोजना अधिकारी संवर्ग की रिक्त पदों की  पूर्ति हेतु चयनित अभ्यर्थियों के मूल दस्तावेजों/प्रमाण पत्रों का सत्यापन।', NULL, '2025-01-20', '2025-01-20', 3, '2025-01-20 17:25:09', NULL, 1, NULL, NULL, NULL, '162.158.162.48', NULL),
	(120, 'C', '["5", "6", "13"]', 2, 14, 240120, NULL, 'क्र./13005/मबावि/सा.वि./2024-25', 'महतारी वंदन योजना के क्रियान्वयन हेतु वर्ष 2024-25 में प्रावधानित बजट से माह फरवरी-2025 की 12 वीं किश्त राशि का भुगतान हेतु विमुक्तिकरण एवं आहरण की स्वीकृति विषयक्।', 'महतारी वंदन योजना के क्रियान्वयन हेतु वर्ष 2024-25 में प्रावधानित बजट से माह फरवरी-2025 की 12 वीं किश्त राशि का भुगतान हेतु विमुक्तिकरण एवं आहरण की स्वीकृति विषयक्।', NULL, '2025-01-17', '2025-01-21', 1, '2025-01-21 10:32:31', '2025-01-22 10:26:15', 1, NULL, NULL, 1, '162.158.163.152', '162.158.163.109'),
	(121, 'C', '["5", "6"]', 2, 14, 240121, NULL, 'क्र./10493/मबावि/सावि/2024-25', 'वर्ष 2025-26 के बजट में नोनी सुरक्षा योजना के मापदंडों के संशोधन विषयक् प्रस्ताव।', 'वर्ष 2025-26 के बजट में नोनी सुरक्षा योजना के मापदंडों के संशोधन विषयक् प्रस्ताव।', NULL, '2024-11-27', '2025-01-21', 3, '2025-01-21 10:45:26', '2025-01-21 11:14:54', 1, NULL, NULL, 1, '172.69.165.10', '162.158.162.103'),
	(122, 'P', '["5", "6"]', 2, 14, 240122, NULL, 'क्र./12969/442/मबावि/स्था.01/2024-25', 'श्रीमती मंजू शुक्ला, अधीक्षक (बाल विकास परियोजना अधिकारी) का ‘‘ न मांग, न जांच, न घटना प्रमाण पत्र, जारी करने बाबत्।', 'श्रीमती मंजू शुक्ला, अधीक्षक (बाल विकास परियोजना अधिकारी) का ‘‘ न मांग, न जांच, न घटना प्रमाण पत्र, जारी करने बाबत्।', NULL, '2025-01-17', '2025-01-21', 3, '2025-01-21 11:16:18', NULL, 1, NULL, NULL, NULL, '162.158.162.48', NULL),
	(123, 'C', '["5", "6", "12"]', 2, 14, 240123, NULL, 'क्र./12967/442/मबावि/स्था.01/2024-25', 'श्रीमती मंजू शुक्ला, अधीक्षक (बाल विकास परियोजना अधिकारी) के अधिवार्षिकी आयु पूण्र करने पर सेवानिवृत्ति आदेश जारी करने बाबत्।', 'श्रीमती मंजू शुक्ला, अधीक्षक (बाल विकास परियोजना अधिकारी) के अधिवार्षिकी आयु पूण्र करने पर सेवानिवृत्ति आदेश जारी करने बाबत्।', NULL, '2025-01-17', '2025-01-21', 3, '2025-01-21 11:18:45', '2025-01-31 09:18:19', 1, NULL, NULL, 1, '162.158.162.170', '162.158.162.86'),
	(124, 'P', '["5", "6", "13"]', 2, 14, 240124, NULL, 'क्र./13122/मबावि/मवंयो./2024-25', 'वित्तीय वर्ष 2025-26 में महतारी वंदन योजना का क्रियान्वनय अंतर्गत कम्प्यूटर सह उपकरण का क्रया बाबत् नवीन मद प्रस्ताव।', 'वित्तीय वर्ष 2025-26 में महतारी वंदन योजना का क्रियान्वनय अंतर्गत कम्प्यूटर सह उपकरण का क्रया बाबत् नवीन मद प्रस्ताव।', NULL, '2025-01-21', '2025-01-22', 3, '2025-01-22 14:55:32', NULL, 1, NULL, NULL, NULL, '162.158.162.83', NULL),
	(125, 'C', '["5", "6", "13"]', 2, 14, 240125, NULL, 'क्र./13076/मबावि/समन्वय/2024-25', 'छत्तीसगढ़ विधान सभा हेतु माननीय राज्यपाल महोदय का अभिभाषण।', 'छत्तीसगढ़ विधान सभा हेतु माननीय राज्यपाल महोदय का अभिभाषण।', NULL, '2025-01-20', '2025-01-23', 3, '2025-01-23 12:19:07', '2025-01-31 09:17:55', 1, NULL, NULL, 1, '162.158.163.152', '162.158.162.86'),
	(126, 'C', '["5", "6", "13"]', 2, 14, 240126, NULL, 'क्र./13146/295/मबावि/निर्माण/2024-25', 'महात्मा गांधी नरेगा अंतर्गत अभिसरण के माध्यम से आंगनबाड़ी भवन निर्माण के संबंध में।', 'महात्मा गांधी नरेगा अंतर्गत अभिसरण के माध्यम से आंगनबाड़ी भवन निर्माण के संबंध में।', NULL, '2025-01-22', '2025-01-23', 3, '2025-01-23 14:19:34', '2025-01-31 09:18:48', 1, NULL, NULL, 1, '162.158.163.175', '162.158.162.86'),
	(127, 'P', '["5", "6", "12"]', 2, 14, 240127, NULL, 'क्र./13189/स्था.-03/2024-25', 'श्री विरेन्द्र कुमार सिंह, सहायक ग्रेड-02 का स्थानांतरण के संबंध में।', 'श्री विरेन्द्र कुमार सिंह, सहायक ग्रेड-02 का स्थानांतरण के संबंध में।', NULL, '2025-01-23', '2025-01-23', 3, '2025-01-23 14:29:06', NULL, 1, NULL, NULL, NULL, '162.158.162.86', NULL),
	(128, 'P', '["5", "6", "12", "15"]', 2, 12, 240128, NULL, 'WPC No. 6253/2024', 'WPC No. 6253/2024', '1 - Durga Women Self Help Group Jamdih Through President Smt.\r\nSarita Gupta W/o Vijay Gupta, Aged About 40 Years, President Of\r\nDurga Women Self Help Group-Jamdih, R/o Village-Jamdih, Gram\r\nPanchayat-Bhelwadih, P.S. & Tahsil- Balrampur, District- Balrampur-\r\nRamanujganj (C.G.)\r\n... Petitioner\r\nversus\r\n1 - State Of Chhattisgarh Through- The Secretary, Department Of\r\nWomen & Child Development, Mahanadi Bhawan, New Raipur, District-\r\nRaipur (C.G.)\r\n2 - The Collector, Balrampur, District- Balrampur-Ramanujganj (C.G.)\r\n3 - The District Program Officer, Women & Child Development\r\nDepartment- Balrampur, District- Balrampur-Ramanujganj (C.G.)\r\n4 - Project Officer, Integrated Women & Child Development- Balrampur,\r\nDistrict- Balrampur-Ramanujganj (C.G.)\r\n... Respondents', NULL, '2025-01-24', '2025-01-24', 1, '2025-01-24 11:51:30', '2025-01-24 12:25:09', 1, NULL, NULL, 1, '162.158.162.111', '162.158.162.245'),
	(129, 'P', '["5", "6", "12"]', 2, 14, 240129, NULL, 'क्र./13212/442/मबावि/स्था.01/2024-25', 'कु. फबिओला खलखो, परियोजना अधिकारी के अधिवार्षिकी आयु वर्ग होने के फलस्वरूप सेवानिवृत्त एवं न मांग, न जांच, न घटना प्रमाण पत्र जारी किये जाने विषयक्।', 'कु. फबिओला खलखो, परियोजना अधिकारी के अधिवार्षिकी आयु वर्ग होने के फलस्वरूप सेवानिवृत्त एवं न मांग, न जांच, न घटना प्रमाण पत्र जारी किये जाने विषयक्।', NULL, '2025-01-23', '2025-01-24', 3, '2025-01-24 12:49:33', NULL, 1, NULL, NULL, NULL, '162.158.162.183', NULL),
	(130, 'P', '["5", "6", "12"]', 2, 14, 240130, NULL, 'क्र./13199/मबावि/पो.अभि./2024-25', 'माननीय उच्च न्यायालय में प्रचलित प्रकरण WPC No. 104/2025 जैना मार्केटिंग एंड एसोसियेट विरूद्ध छ.ग. शासन एवं अन्य में अपील करने विषयक्।', 'माननीय उच्च न्यायालय में प्रचलित प्रकरण WPC No. 104/2025 जैना मार्केटिंग एंड एसोसियेट विरूद्ध छ.ग. शासन एवं अन्य में अपील करने विषयक्।', NULL, '2025-01-23', '2025-01-24', 2, '2025-01-24 16:52:08', NULL, 1, NULL, NULL, NULL, '162.158.162.67', NULL),
	(131, 'P', '["5", "6", "13"]', 2, 14, 240131, NULL, 'क्र./13270/54/मबावि/सा.वि./24-25', 'नये शक्ति सदन स्थापित करने हेतु योजना शीर्ष 6647 अंतर्गत अतिरिक्त बजट प्रावधान हेतु नवीन मद का प्रस्ताव बाबत्।', 'नये शक्ति सदन स्थापित करने हेतु योजना शीर्ष 6647 अंतर्गत अतिरिक्त बजट प्रावधान हेतु नवीन मद का प्रस्ताव बाबत्।', NULL, '2025-01-24', '2025-01-27', 3, '2025-01-27 11:02:22', NULL, 1, NULL, NULL, NULL, '162.158.162.111', NULL),
	(132, 'C', '["5", "6"]', 2, 14, 240132, NULL, 'क्र./13275/मबावि/आईसीडीएस/2024-25', 'बस्तर संभाग में एनीमिया की तथ्यात्मक जानकारी उपलब्ध कराने बाबत्।', 'बस्तर संभाग में एनीमिया की तथ्यात्मक जानकारी उपलब्ध कराने बाबत्।', NULL, '2025-01-24', '2025-01-27', 3, '2025-01-27 11:08:15', '2025-01-31 09:19:53', 1, NULL, NULL, 1, '162.158.162.55', '162.158.162.86'),
	(133, 'P', '["5", "6"]', 2, 14, 240133, NULL, 'क्र./13257/मबावि/सखी/2024-25', 'छत्तीसगढ़ टोनही प्रताड़ना निवारण अधिनियम, 2005 की धाराओं 04, 05, 06, 07 एवं 08 में परिवर्तन के संबंध में।', 'छत्तीसगढ़ टोनही प्रताड़ना निवारण अधिनियम, 2005 की धाराओं 04, 05, 06, 07 एवं 08 में परिवर्तन के संबंध में।', NULL, '2025-01-23', '2025-01-27', 3, '2025-01-27 11:15:36', NULL, 1, NULL, NULL, NULL, '172.69.165.72', NULL),
	(134, 'P', '["5", "6"]', 2, 14, 240134, NULL, 'क्र./13250/मबावि/सा.वि/24-25', 'एनजीओ दर्पण पोर्टल की जानकारी अद्यतन करने के संबंध में।', 'एनजीओ दर्पण पोर्टल की जानकारी अद्यतन करने के संबंध में।', NULL, '2025-01-23', '2025-01-27', 3, '2025-01-27 11:17:54', NULL, 1, NULL, NULL, NULL, '162.158.162.182', NULL),
	(135, 'P', '["5", "6"]', 2, 14, 240135, NULL, 'क्र./13211/स्था.01/मबावि/2024-25', 'मिशन सक्षम आंगनबाड़ी एवं पोषण 2.0 के तहत् पद संरचना हेतु आकस्मिकता निधि से अग्रिम राशि प्राप्त करते हुए नवीन सेवा मद का प्रस्ताव।', 'मिशन सक्षम आंगनबाड़ी एवं पोषण 2.0 के तहत् पद संरचना हेतु आकस्मिकता निधि से अग्रिम राशि प्राप्त करते हुए नवीन सेवा मद का प्रस्ताव।', NULL, '2025-01-23', '2025-01-27', 3, '2025-01-27 16:49:41', NULL, 1, NULL, NULL, NULL, '162.158.162.183', NULL),
	(136, 'P', '["5", "6", "12"]', 2, 14, 240136, NULL, 'क्र./13337/755/स्था.01/2024-25', 'श्री महेश राम मरकाम, जिला महिला एवं बाल विकास अधिकारी द्वारा स्थानांतरण आदेश निरस्त करने संबंधी अभ्यावेदन।', 'श्री महेश राम मरकाम, जिला महिला एवं बाल विकास अधिकारी द्वारा स्थानांतरण आदेश निरस्त करने संबंधी अभ्यावेदन।', NULL, '2025-01-24', '2025-01-27', 3, '2025-01-27 16:54:27', NULL, 1, NULL, NULL, NULL, '162.158.162.110', NULL),
	(137, 'P', '["5", "6", "12"]', 2, 14, 240137, NULL, 'क्र./10730/794/स्था.-01/2023-24', 'श्रीमती अर्चना चौहान, अधीक्षक, बाल सम्प्रेक्षण गृह बिलासपुर मूल पद परियोजना अधिकारी का स्वैच्छिक सेवानिवृत्ति बाबत्।', 'श्रीमती अर्चना चौहान, अधीक्षक, बाल सम्प्रेक्षण गृह बिलासपुर मूल पद परियोजना अधिकारी का स्वैच्छिक सेवानिवृत्ति बाबत्।', NULL, '2024-12-03', '2025-01-28', 3, '2025-01-28 10:49:00', NULL, 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(138, 'P', '["9", "10", "14"]', 1, 9, 240138, NULL, 'अ.शा.पत्र.क्रमांक 237/R-246/RDSS/2022/13/2', 'श्री सुबोध कुमार सिंह, प्रमुख सचिव, उर्जा विभाग से प्राप्त अर्द्ध शास. पत्र के संबंध में।( महिला एवं बाल विकास विभाग में लंबित विद्युत देयकों के संबंध में।)', 'श्री सुबोध कुमार सिंह, प्रमुख सचिव, उर्जा विभाग से प्राप्त अर्द्ध शास. पत्र के संबंध में।(\r\nमहिला एवं बाल विकास विभाग में लंबित विद्युत देयकों के संबंध में।)', NULL, '2025-01-24', '2025-01-28', 1, '2025-01-28 14:31:29', NULL, 1, NULL, NULL, NULL, '172.69.165.11', NULL),
	(139, 'P', '["7", "8", "19"]', 1, 3, 240139, NULL, 'D.O. No.PM-17/9/2017-PMMVY-Pt(1)', 'Pradhan Mantri Matru Vandana Yojana is one of the flagship schemes of the Government of India. It Provides maternity benefit to eligible pregnant women and lactating Mothers.', 'Pradhan Mantri Matru Vandana Yojana is one of the flagship schemes of the Government of India. It Provides maternity benefit to eligible pregnant women and lactating Mothers.', NULL, '2025-01-24', '2025-01-28', 1, '2025-01-28 14:41:31', NULL, 1, NULL, NULL, NULL, '172.69.165.51', NULL),
	(140, 'P', '["5", "6"]', 2, 14, 240140, NULL, 'क्र./13310/मबावि/मि.वा./2023-24', 'मिशन वात्सल्य योजनांतर्गत लेखों का संधारण डबल एंट्री सिस्टम से किये जा रहे टैली साफ्टवेयर लाईसेंस का नवीनीकरण किये जाने की स्वीकृति बाबत्।', 'मिशन वात्सल्य योजनांतर्गत लेखों का संधारण डबल एंट्री सिस्टम से किये जा रहे टैली साफ्टवेयर लाईसेंस का नवीनीकरण किये जाने की स्वीकृति बाबत्।', NULL, '2025-01-24', '2025-01-28', 3, '2025-01-28 17:23:39', NULL, 1, NULL, NULL, NULL, '172.69.165.51', NULL),
	(141, 'P', '["5", "6", "13"]', 2, 14, 240141, NULL, 'क्र./13308/55/मबावि/सा.वि./24-25', 'नये सखी निवास स्थापित करने हेतु योजना शीर्ष 6649 अंतर्गत अतिरिक्त बजट प्रावधान हेतु नवीन मद का प्रावधान बाबत्।', 'नये सखी निवास स्थापित करने हेतु योजना शीर्ष 6649 अंतर्गत अतिरिक्त बजट प्रावधान हेतु नवीन मद का प्रावधान बाबत्।', NULL, '2025-01-24', '2025-01-29', 3, '2025-01-29 11:31:28', NULL, 1, NULL, NULL, NULL, '162.158.163.175', NULL),
	(142, 'P', '["5", "6", "13"]', 2, 14, 240142, NULL, 'क्र./13331/मबावि/मि.वा./2024-25', 'संकल्प खुला आश्रय गृह(बालक) रायपुर को लंबित अनुदान राशि प्रदाय किये जाने की प्रशासकीय स्वीकृति बाबत्।', 'संकल्प खुला आश्रय गृह(बालक) रायपुर को लंबित अनुदान राशि प्रदाय किये जाने की प्रशासकीय स्वीकृति बाबत्।', NULL, '2025-01-24', '2025-01-29', 3, '2025-01-29 11:34:40', NULL, 1, NULL, NULL, NULL, '162.158.162.66', NULL),
	(143, 'P', '["5", "6", "13"]', 2, 14, 240143, NULL, 'क्र./13390/ICDS-01/मबावि/2024-25', 'पोषण अभियान अन्तर्गत वर्ष प्रदायित स्मार्ट फोन MDM  में लायसेंस नवीनकरण के संबंध में।', 'पोषण अभियान अन्तर्गत वर्ष प्रदायित स्मार्ट फोन MDM  में लायसेंस नवीनकरण के संबंध में।', NULL, '2025-01-27', '2025-01-29', 3, '2025-01-29 11:37:54', NULL, 1, NULL, NULL, NULL, '162.158.163.92', NULL),
	(144, 'P', '["5", "6"]', 2, 14, 240144, NULL, 'क्र./13380/मबावि/मरामि/24-25', 'महिलाओं का कार्यस्थल पर लैंगिक उत्पीड़न ( निवारण, प्रतिषेध और प्रतितोष) अधिनियम 2013 अंतर्गत प्रशिक्षण के संबंध में।', 'महिलाओं का कार्यस्थल पर लैंगिक उत्पीड़न ( निवारण, प्रतिषेध और प्रतितोष) अधिनियम 2013 अंतर्गत प्रशिक्षण के संबंध में।', NULL, '2025-01-27', '2025-01-29', 3, '2025-01-29 11:44:54', NULL, 1, NULL, NULL, NULL, '162.158.163.78', NULL),
	(145, 'P', '["5", "6"]', 2, 14, 240145, NULL, 'क्र./13484/मबावि/ICDS/2024-25', 'Clarification of Utilisation of unspent funds in the SNA account for release of subsequent funds-reg.', 'Clarification of Utilisation of unspent funds in the SNA account for release of subsequent funds-reg.', NULL, '2025-01-29', '2025-01-29', 3, '2025-01-29 13:55:36', NULL, 1, NULL, NULL, NULL, '162.158.163.221', NULL),
	(146, 'P', '["5", "6"]', 2, 14, 240146, NULL, 'क्र./3419/मबावि/सावि/म.वं.यो/ 24-25', 'आवेदक प्रकाश बांधे, ग्राम मुन्दरा अभनपुर-रायपुर द्वारा की गई शिकायत के संबंध में।', 'आवेदक प्रकाश बांधे, ग्राम मुन्दरा अभनपुर-रायपुर द्वारा की गई शिकायत के संबंध में।', NULL, '2025-01-28', '2025-01-29', 3, '2025-01-29 13:59:45', NULL, 1, NULL, NULL, NULL, '162.158.163.92', NULL),
	(147, 'P', '["5", "6", "12"]', 2, 14, 240147, NULL, 'क्र./एफ-422/13471/मबावि/स्था.-01/2024-25', 'बाल विकास परियोजना अधिकारियों का ‘‘न मांग, न जांच, न घटना‘‘ प्रमाण पत्र जारी करने विषयक्।( 1/ श्रीमती सरिता सिंह  2/ श्रीमती शाकुन्तला चक्रवती)', 'बाल विकास परियोजना अधिकारियों का ‘‘न मांग, न जांच, न घटना‘‘ प्रमाण पत्र जारी करने विषयक्।( 1/ श्रीमती सरिता सिंह  2/ श्रीमती शाकुन्तला चक्रवती)', NULL, '2025-01-29', '2025-01-29', 3, '2025-01-29 14:05:56', NULL, 1, NULL, NULL, NULL, '172.69.165.51', NULL),
	(148, 'P', '["5", "6"]', 2, 14, 240148, NULL, 'क्र./13483/स्था.01/मबावि/2025', 'श्रीमती अर्चना राणा सेठ, संयुक्त संचालक द्वारा असत्य कथन तथा जानबूझकर गलत लेख कर उच्चाधिकारियों व शासन को गुमराह करने संबंधी शिकायत द्वारा श्रीमती हेमलता मिश्रा, उप संचालक, राज्य स्तरीय संसाधन केन्द्र रायुपर।', 'श्रीमती अर्चना राणा सेठ, संयुक्त संचालक द्वारा असत्य कथन तथा जानबूझकर गलत लेख कर उच्चाधिकारियों व शासन को गुमराह करने संबंधी शिकायत द्वारा श्रीमती हेमलता मिश्रा, उप संचालक, राज्य स्तरीय संसाधन केन्द्र रायुपर।', NULL, '2025-01-29', '2025-01-29', 3, '2025-01-29 14:10:12', NULL, 1, NULL, NULL, NULL, '162.158.163.221', NULL),
	(149, 'C', '["5", "6", "12"]', 2, 14, 240149, NULL, 'क्र./13483/स्था.01/मबावि/2025', 'श्रीमती अर्चना राणा सेठ, संयुक्त संचालक द्वारा असत्य कथन तथा जानबूझकर गलत लेख कर उच्चाधिकारियों व शासन को गुमराह करने संबंधी शिकायत द्वारा श्रीमती हेमलता मिश्रा, उप संचालक, राज्य स्तरीय संसाधन केन्द्र रायुपर।', 'श्रीमती अर्चना राणा सेठ, संयुक्त संचालक द्वारा असत्य कथन तथा जानबूझकर गलत लेख कर उच्चाधिकारियों व शासन को गुमराह करने संबंधी शिकायत द्वारा श्रीमती हेमलता मिश्रा, उप संचालक, राज्य स्तरीय संसाधन केन्द्र रायुपर।', NULL, '2025-01-29', '2025-01-29', 3, '2025-01-29 14:15:54', '2025-02-03 05:51:32', 1, NULL, NULL, 1, '162.158.163.81', '162.158.163.176'),
	(150, 'P', '["5", "6", "12"]', 2, 14, 240150, NULL, 'क्र/1344/734/मबावि/स्था.02/2024-25', 'स्थानांतरण करने के संबंध में। (श्रीमती पूनम श्रीवास्तव, पर्यवेक्षक)', 'स्थानांतरण करने के संबंध में। (श्रीमती पूनम श्रीवास्तव, पर्यवेक्षक)', NULL, '2025-01-28', '2025-01-29', 3, '2025-01-29 14:19:04', NULL, 1, NULL, NULL, NULL, '162.158.163.92', NULL),
	(151, 'P', '["5", "6", "13"]', 2, 14, 240151, NULL, 'क्रं 9093/207/मबावि/निर्माण/2024-25', 'वित्तीय वर्ष 2024-25 में मांग संख्या 64 में उद्देश्य शीर्ष 24-003 अनुरक्षण काय्र हेतु प्रावधानित बजट राशि में से विमुक्तिकरण का प्रस्ताव।', 'वित्तीय वर्ष 2024-25 में मांग संख्या 64 में उद्देश्य शीर्ष 24-003 अनुरक्षण काय्र हेतु प्रावधानित बजट राशि में से विमुक्तिकरण का प्रस्ताव।', NULL, '2024-10-17', '2025-01-29', 3, '2025-01-29 17:22:25', NULL, 1, NULL, NULL, NULL, '162.158.162.49', NULL),
	(152, 'P', '["5", "6", "12"]', 2, 14, 240152, NULL, 'क्र./13500/स्था.02/म.बा.वि./2024-25', 'माननीय उच्च न्यायालय, बिलासपुर में दायर प्रकरण क्रमांक W.P.(C) No. 1249/2015  में पारित आदेश दिनांक 18.09.2024 के विरूद्ध अपील प्रस्तुत करने विषयक्।', 'माननीय उच्च न्यायालय, बिलासपुर में दायर प्रकरण क्रमांक W.P.(C) No. 1249/2015  में पारित आदेश दिनांक 18.09.2024 के विरूद्ध अपील प्रस्तुत करने विषयक्।', NULL, '2025-01-29', '2025-01-30', 1, '2025-01-30 10:49:11', NULL, 1, NULL, NULL, NULL, '162.158.163.152', NULL),
	(153, 'P', '["5", "6"]', 2, 14, 240153, NULL, 'क्र./13517/988/स्था.-01/2024-25', 'श्रीमती ज्योति मथरानी(निलंबित), परियोजना अधिकारी बस्तर एवं श्रीमती प्रभा नेताम(निलंबित), तत्कालीन पर्यवेक्षक सेक्टर-बस्तर, परियोजना-बस्तर जिला बस्तर के विरूद्ध आरोप पत्र उपलब्ध कराने बाबत्।', 'श्रीमती ज्योति मथरानी(निलंबित), परियोजना अधिकारी बस्तर एवं श्रीमती प्रभा नेताम(निलंबित), तत्कालीन पर्यवेक्षक सेक्टर-बस्तर, परियोजना-बस्तर जिला बस्तर के विरूद्ध आरोप पत्र उपलब्ध कराने बाबत्।', NULL, '2025-01-29', '2025-01-30', 3, '2025-01-30 10:54:01', NULL, 1, NULL, NULL, NULL, '162.158.163.176', NULL),
	(154, 'P', '["5", "6", "12"]', 2, 14, 240154, NULL, 'क्र./13520/755 पार्ट/स्था.01/2024-25', 'बाल विकास परियोजना अधिकारी के पद पर स्थानांतरण करने बाबत्। (अनुराधा आर्य, परियोजना अधिकारी)', 'बाल विकास परियोजना अधिकारी के पद पर स्थानांतरण करने बाबत्। (अनुराधा आर्य, परियोजना अधिकारी)', NULL, '2025-01-29', '2025-01-30', 3, '2025-01-30 10:57:29', NULL, 1, NULL, NULL, NULL, '162.158.163.222', NULL),
	(155, 'P', '["5", "6"]', 2, 14, 240155, NULL, 'क्र./एफ-117ए/13445/स्था.01/2024-25', 'पासपोर्ट बनवाने हेतु अनापत्ति प्रमाण पत्र प्रपत्र-A,G एवं H में जारी करने बाबत्। (श्री सुनिता खलखो, बाल विकास परियोजना अधिकारी)', 'पासपोर्ट बनवाने हेतु अनापत्ति प्रमाण पत्र प्रपत्र-एवं में जारी करने बाबत्। (श्री सुनिता खलखो, बाल विकास परियोजना अधिकारी)', NULL, '2025-01-28', '2025-01-30', 3, '2025-01-30 11:04:53', NULL, 1, NULL, NULL, NULL, '162.158.163.152', NULL),
	(156, 'C', '["5", "6", "13"]', 2, 14, 240156, NULL, 'क्र./11350/मबावि/ICDS/2024-25', 'राज्य शासन की निधि से आंगनबाड़ी केन्द्रों में चक्रानुक्रम मद अन्तर्गत सामग्री क्रय हेतु प्रस्ताव-वर्ष 2024-25।(ॅफर्नीचर)', 'राज्य शासन की निधि से आंगनबाड़ी केन्द्रों में चक्रानुक्रम मद अन्तर्गत सामग्री क्रय हेतु प्रस्ताव-वर्ष 2024-25।(ॅफर्नीचर)', NULL, '2024-12-12', '2025-01-30', 3, '2025-01-30 16:07:08', '2025-02-03 05:40:28', 1, NULL, NULL, 1, '162.158.162.129', '162.158.163.152'),
	(157, 'P', '["5", "6"]', 2, 14, 240157, NULL, 'क्र./13515/796बी/मबावि/स्था.01/2024-25', 'विभाग में राजपत्रित अधिकारियों को समयमान वेतनमान का लाभ प्रदाय करने बाबत्।', 'विभाग में राजपत्रित अधिकारियों को समयमान वेतनमान का लाभ प्रदाय करने बाबत्।', NULL, '2025-01-29', '2025-02-03', 3, '2025-01-31 14:05:52', '2025-02-03 14:01:01', 1, NULL, NULL, 1, '162.158.163.175', '162.158.163.248'),
	(158, 'P', '["3", "9", "10", "14", "15", "18"]', 1, 9, 240158, NULL, 'क्र./623/वि.प्र.क्र./108/2023/2025', 'विधिक प्रकरण क्रमांक 108/2023 में तथ्यात्मक प्रतिवेदन हेतु। (श्री रामजतन कुशवाहा व अन्य विरूद्ध श्री प्रतीक खरे। )', 'विधिक प्रकरण क्रमांक 108/2023 में तथ्यात्मक प्रतिवेदन हेतु। (श्री रामजतन कुशवाहा व अन्य विरूद्ध श्री प्रतीक खरे। )', NULL, '2025-01-28', '2025-01-31', 1, '2025-01-31 17:09:18', '2025-01-31 17:12:13', 1, NULL, NULL, 1, '162.158.162.129', '162.158.162.66'),
	(159, 'P', '["3", "9", "10", "14", "15", "18"]', 1, 9, 240159, NULL, 'क्र./624/वि.प्र.क्र./107/2023/2025', 'विधिक प्रकरण क्रमांक 107/2023 में तथ्यात्मक प्रतिवेदन हेतु। (श्री सुरेन्द्र कुमार चौबे व अन्य विरूद्ध श्री प्रतीक खरे। )', 'विधिक प्रकरण क्रमांक 107/2023 में तथ्यात्मक प्रतिवेदन हेतु। (श्री सुरेन्द्र कुमार चौबे व अन्य विरूद्ध श्री प्रतीक खरे। )', NULL, '2025-01-28', '2025-01-31', 1, '2025-01-31 17:15:23', NULL, 1, NULL, NULL, NULL, '162.158.162.87', NULL),
	(160, 'P', '["3", "6"]', 2, 4, 240160, NULL, 'test', 'test', 'test', NULL, '2025-02-03', '2025-02-03', 1, '2025-02-03 13:45:14', '2025-02-03 13:58:41', 1, NULL, NULL, 1, '162.158.163.176', '162.158.163.176');

-- Dumping structure for table tlmis_testing.tbl_task_files
DROP TABLE IF EXISTS `tbl_task_files`;
CREATE TABLE IF NOT EXISTS `tbl_task_files` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int DEFAULT NULL,
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `fk_task_id` (`fk_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_task_files: ~11 rows (approximately)
INSERT INTO `tbl_task_files` (`file_id`, `fk_task_id`, `file`, `file_name`, `file_size`) VALUES
	(2, 4, 'testing/task_files/sample_1738669636.pdf', 'sample.pdf', '18810'),
	(3, 5, 'testing/task_files/sample_1738669814.pdf', 'sample.pdf', '18810'),
	(4, 6, 'testing/task_files/sample_1738669935.pdf', 'sample.pdf', '18810'),
	(5, 7, 'testing/task_files/sample_1738670019.pdf', 'sample.pdf', '18810'),
	(6, 1, 'testing/task_files/sample_1738670215.pdf', 'sample.pdf', '18810'),
	(7, 8, 'testing/task_files/sample_1738732770.pdf', 'sample.pdf', '18810'),
	(8, 9, 'testing/task_files/sample_1738733044.pdf', 'sample.pdf', '18810'),
	(9, 15, 'testing/task_files/TLMIS_-_Tasks_1739611549.pdf', 'TLMIS - Tasks.pdf', '10790'),
	(10, 16, 'testing/task_files/TLMIS_-_Tasks_1739612297.pdf', 'TLMIS - Tasks.pdf', '10790'),
	(11, 17, 'testing/task_files/TLMIS_-_Tasks_1739614782.pdf', 'TLMIS - Tasks.pdf', '10790'),
	(12, 19, 'testing/task_files/Screenshot_2025-02-07_000805_1739854735.png', 'Screenshot 2025-02-07 000805.png', '13627');

-- Dumping structure for table tlmis_testing.tbl_task_reopen_trs
DROP TABLE IF EXISTS `tbl_task_reopen_trs`;
CREATE TABLE IF NOT EXISTS `tbl_task_reopen_trs` (
  `reopen_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int NOT NULL,
  `reopen_date` datetime DEFAULT (now()),
  `reopen_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reopen_by` int DEFAULT NULL,
  `reopen_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `closed_by` int DEFAULT NULL,
  `closed_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reopen_id`) USING BTREE,
  KEY `fk_task_id` (`fk_task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_task_reopen_trs: ~4 rows (approximately)
INSERT INTO `tbl_task_reopen_trs` (`reopen_id`, `fk_task_id`, `reopen_date`, `reopen_remark`, `reopen_by`, `reopen_ipaddress`, `closed_date`, `closed_remark`, `closed_by`, `closed_ipaddress`) VALUES
	(1, 3, '2025-02-10 08:42:41', 'Reopen test', 1, '162.158.162.170', '2025-02-10 14:12:57', 'Close', 1, '162.158.162.171'),
	(2, 15, '2025-02-15 12:08:37', 'yes', 1, '162.158.163.155', '2025-02-15 17:43:11', 'Finaly Done', 1, '162.158.163.24'),
	(3, 15, '2025-02-18 06:12:18', 'reopen task', 1, '162.158.162.5', NULL, NULL, NULL, NULL),
	(4, 14, '2025-02-18 06:22:29', 'open task again', 1, '162.158.163.179', '2025-02-18 11:53:42', 'close this task', 1, '172.69.165.75');

-- Dumping structure for table tlmis_testing.tbl_task_reply
DROP TABLE IF EXISTS `tbl_task_reply`;
CREATE TABLE IF NOT EXISTS `tbl_task_reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_by` int NOT NULL DEFAULT (0),
  `reply_date` date NOT NULL,
  `reply_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT (now()),
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int NOT NULL,
  `update_by` int DEFAULT NULL,
  `create_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `reply_date` (`reply_date`),
  KEY `grievance_id` (`task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.tbl_task_reply: ~457 rows (approximately)
INSERT INTO `tbl_task_reply` (`id`, `task_id`, `reply_by`, `reply_date`, `reply_description`, `file_name`, `create_date`, `update_date`, `create_by`, `update_by`, `create_ip`, `update_ip`) VALUES
	(1, '16', 5, '2025-01-14', 'forwarded to under secretary.', NULL, '2025-01-14 05:16:01', NULL, 5, NULL, '172.69.165.20', NULL),
	(2, '11', 13, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु दिनांक 10.01.2025 को प्रस्तुत, संयुक्त सचिव', NULL, '2025-01-14 06:13:40', NULL, 13, NULL, '172.69.165.58', NULL),
	(3, '10', 13, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु दिनांक 10.01.2025 को प्रस्तुत, संयुक्त सचिव', NULL, '2025-01-14 06:14:53', NULL, 13, NULL, '172.69.165.58', NULL),
	(4, '5', 13, '2025-01-14', 'विभागीय पत्र दिनांक 09.01.2025 द्वारा जानकारी वित्त विभाग को प्रेषित। कार्यवाही पूर्ण।', NULL, '2025-01-14 06:17:21', NULL, 13, NULL, '172.69.165.59', NULL),
	(5, '5', 13, '2025-01-14', 'विभागीय पत्र दिनांक 09.01.2025 द्वारा जानकारी वित्त विभाग को प्रेषित। कार्यवाही पूर्ण।', NULL, '2025-01-14 06:17:52', NULL, 13, NULL, '172.69.165.59', NULL),
	(6, '7', 6, '2025-01-14', 'विभागीय मंत्री की ओर से केन्द्रीय मंत्री महिला एवं बाल विकास को डी. ओ. प्रेषित करने हेतु नस्ती दिनांक 08.01.2025 प्रस्तुत', NULL, '2025-01-14 06:37:37', NULL, 6, NULL, '172.69.165.25', NULL),
	(7, '9', 6, '2025-01-14', 'विभागीय मंत्री की ओर से की ओर से बैठक की तिथि निर्धारित करने हेतु दिनांक 08.01.2025 को नस्ती प्रस्तुत', NULL, '2025-01-14 06:39:57', NULL, 6, NULL, '172.69.165.24', NULL),
	(8, '27', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु प्रस्तुत सं.स.-07.01.2025', NULL, '2025-01-14 07:16:11', NULL, 6, NULL, '172.69.165.59', NULL),
	(9, '27', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु प्रस्तुत सं.स.-07.01.2025', NULL, '2025-01-14 07:20:18', NULL, 6, NULL, '162.158.163.176', NULL),
	(10, '32', 12, '2025-01-14', 'एफ 12-2/2020/मबावि/50,\r\nप्र्रकरण के सबंध में संचालनालय को स्पष्ट प्रस्ताव हेतु दिनांक 10.01.2025 को पत्र प्रेषित किया गया है।', NULL, '2025-01-14 07:22:58', NULL, 12, NULL, '162.158.163.234', NULL),
	(11, '16', 6, '2025-01-14', 'संचालक को बैठक की सूचना पत्र जारी 16.01.2025', NULL, '2025-01-14 07:23:36', NULL, 6, NULL, '162.158.162.71', NULL),
	(12, '30', 12, '2025-01-14', 'एफ 11-2/2024/मबावि/50,\r\nदिनांक 16.01.2025 को 12.00बजे बैठक हेतु संचालक को दिनांक 11.01.2025 को पत्र प्रेषित।', NULL, '2025-01-14 07:32:55', NULL, 12, NULL, '172.69.165.21', NULL),
	(13, '22', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु प्रस्तुत सं.स.-14.01.2025', NULL, '2025-01-14 07:39:30', NULL, 6, NULL, '162.158.163.114', NULL),
	(14, '12', 6, '2025-01-14', 'प0क्र0. 1566/2023/50\r\nप्रशासकीय अनुमोदन हेतु दिनांक 09.01.2025 को नस्ती प्रस्तुत।', NULL, '2025-01-14 07:43:22', NULL, 6, NULL, '162.158.163.185', NULL),
	(15, '4', 6, '2025-01-14', 'अवलोकनार्थ प्रस्तुत-सं.स-09.01.2025', NULL, '2025-01-14 07:46:55', NULL, 6, NULL, '162.158.163.186', NULL),
	(16, '4', 12, '2025-01-14', 'आर 287/व्हीआईपी/2024/मबावि/50,\r\nसंचालनालय से प्राप्त जानकारी दिनांक 08.01.2025 को अवलोकनार्थ प्रस्तुत किया गया।\r\nसंयुक्त सचिव 09.01.2025', NULL, '2025-01-14 07:47:18', NULL, 12, NULL, '162.158.162.113', NULL),
	(17, '31', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु प्रस्तुत सं.स.-14.01.2025', NULL, '2025-01-14 07:51:55', NULL, 6, NULL, '172.69.165.83', NULL),
	(18, '42', 5, '2025-01-14', 'Forwarded to US.', NULL, '2025-01-14 08:26:48', NULL, 5, NULL, '162.158.163.234', NULL),
	(19, '41', 5, '2025-01-14', 'Forwarded to Under secretary Dt 09.01.2025', NULL, '2025-01-14 08:30:36', NULL, 5, NULL, '162.158.163.233', NULL),
	(20, '40', 5, '2025-01-14', 'Forwarded to under secretary dt 08.01.2025.', NULL, '2025-01-14 08:31:55', NULL, 5, NULL, '162.158.163.233', NULL),
	(21, '36', 5, '2025-01-14', 'Forwarded to under secretary dt 07.01.2025', NULL, '2025-01-14 08:32:55', NULL, 5, NULL, '162.158.163.233', NULL),
	(22, '34', 5, '2025-01-14', 'Forwarded to  secretary Ma\'am dt 23.12.2024.', NULL, '2025-01-14 08:33:59', NULL, 5, NULL, '162.158.163.233', NULL),
	(23, '32', 5, '2025-01-14', 'Forwarded to under secretary dt 09.01.25', NULL, '2025-01-14 08:34:33', NULL, 5, NULL, '162.158.163.233', NULL),
	(24, '30', 5, '2025-01-14', 'Forwarded to under secretary  dt 09.01.25', NULL, '2025-01-14 08:35:37', NULL, 5, NULL, '162.158.163.233', NULL),
	(25, '28', 5, '2025-01-14', 'Forwarded to under secretary dt 06.01.25', NULL, '2025-01-14 08:36:48', NULL, 5, NULL, '162.158.163.233', NULL),
	(26, '27', 5, '2025-01-14', 'Forwarded to under secretary  dt 09.01.25', NULL, '2025-01-14 08:37:26', NULL, 5, NULL, '162.158.163.233', NULL),
	(27, '25', 5, '2025-01-14', 'Forwarded to under secretary dt 09.01.25', NULL, '2025-01-14 08:38:20', NULL, 5, NULL, '162.158.163.233', NULL),
	(28, '23', 5, '2025-01-14', 'Forwarded to under secretary dt 09.01.25', NULL, '2025-01-14 08:39:02', NULL, 5, NULL, '162.158.163.233', NULL),
	(29, '9', 5, '2025-01-14', 'Forwarded to Under secretary dt 14.01.2025', NULL, '2025-01-14 08:48:28', NULL, 5, NULL, '162.158.163.234', NULL),
	(30, '5', 5, '2025-01-14', 'Forwarded to under secretary dt 09.01.2025', NULL, '2025-01-14 08:49:30', NULL, 5, NULL, '162.158.163.234', NULL),
	(31, '4', 5, '2025-01-14', 'Forwarded to Under secretary dt 10.01.2025', NULL, '2025-01-14 08:50:26', NULL, 5, NULL, '162.158.162.244', NULL),
	(32, '6', 12, '2025-01-14', 'आर 3650/2024/मबावि/50\r\nश्रीमती के स्वैच्छिक सेवानि. हेतु न मांग न जांच प्रमाण पत्र जारी करने, दिनांक 10/01/25 को ऑफिस।', NULL, '2025-01-14 09:29:07', NULL, 12, NULL, '162.158.162.179', NULL),
	(33, '48', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु दिनांक 14.01.2025 को संयुक्त सचिव को प्रस्तुत', NULL, '2025-01-14 09:30:50', NULL, 6, NULL, '162.158.163.185', NULL),
	(34, '26', 6, '2025-01-14', 'प्रकरण में कोई कार्यवाही नहीं किया जाना है।', NULL, '2025-01-14 09:33:12', NULL, 6, NULL, '162.158.163.190', NULL),
	(35, '48', 5, '2025-01-14', 'Forwarded to Secretary Ma\'am dt 14.01.25', NULL, '2025-01-14 09:34:26', NULL, 5, NULL, '172.69.165.33', NULL),
	(36, '8', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु दिनांक 14.01.2025 को संयुक्त सचिव को प्रस्तुत।', NULL, '2025-01-14 09:34:37', NULL, 6, NULL, '172.69.165.33', NULL),
	(37, '46', 5, '2025-01-14', 'forwarded to under secretary dt 07.01.25', NULL, '2025-01-14 09:36:48', NULL, 5, NULL, '172.69.165.32', NULL),
	(38, '45', 5, '2025-01-14', 'Forwarded to Under secretary Dt 07.01.25', NULL, '2025-01-14 09:37:28', NULL, 5, NULL, '172.69.165.32', NULL),
	(39, '44', 5, '2025-01-14', 'Forwarded to Under secretary Dt 07.01.25', NULL, '2025-01-14 09:38:29', NULL, 5, NULL, '172.69.165.32', NULL),
	(40, '43', 5, '2025-01-14', 'Forwarded to Under secretary Dt 14.01.2025', NULL, '2025-01-14 09:39:00', NULL, 5, NULL, '172.69.165.32', NULL),
	(41, '22', 5, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु नस्ती सचिव महोदया को प्रस्तुत दिनांक 14.01.2025।', NULL, '2025-01-14 09:42:15', NULL, 5, NULL, '162.158.162.49', NULL),
	(42, '11', 5, '2025-01-14', 'सचिव महोदया को प्रशासकीय अनुमोदन हेतु नस्ती प्रस्तुत दिनांक 14.01.2025।', NULL, '2025-01-14 09:44:57', NULL, 5, NULL, '162.158.162.48', NULL),
	(43, '10', 5, '2025-01-14', 'सचिव महोदया को प्रशासकीय अनुमोदन हेतु नस्ती प्रस्तुत दिनांक 14.01.2025।', NULL, '2025-01-14 09:45:23', NULL, 5, NULL, '162.158.162.48', NULL),
	(44, '29', 12, '2025-01-14', 'आर 1345/2019/मबावि/50\r\nसंक्षेपिका सहित, नियम सहित प्रस्तुत करने हेतु निर्देश दिया गया है, नस्ती पटल पर।', NULL, '2025-01-14 09:46:24', NULL, 12, NULL, '162.158.163.82', NULL),
	(45, '46', 6, '2025-01-14', 'राजभवन सचिवालय को दिनांक 08.01.2025 को जानकारी प्रेषित। कार्यवाही पूर्ण', NULL, '2025-01-14 09:53:05', NULL, 6, NULL, '162.158.163.247', NULL),
	(46, '27', 12, '2025-01-14', 'एफ 1-6/2024/मबावि/50\r\nउपस्थिति के संबंध में दिनांक 07.01.2025 को संयुक्त सचिव ।', NULL, '2025-01-14 09:54:23', NULL, 12, NULL, '162.158.163.81', NULL),
	(47, '47', 6, '2025-01-14', 'प्रकरण को लंबित रखने के निर्देश है दिनांक 10.01.2025 को आदेशशर्थ प्रस्तुत किया गया है।', NULL, '2025-01-14 10:02:18', NULL, 6, NULL, '162.158.162.86', NULL),
	(48, '25', 12, '2025-01-14', 'आर 25/2025/मबावि/50\r\nपरीक्षा में सम्मिलित होने हेतु संचालक से अतिरिक्त जानकारी, दिनांक 14.01.2025 को पत्र प्रेषित ।', NULL, '2025-01-14 10:02:50', NULL, 12, NULL, '162.158.163.151', NULL),
	(49, '47', 6, '2025-01-14', 'प्रकरण को लंबित रखने के निर्देश है दिनांक 10.01.2025 को आदेशार्थ प्रस्तुत किया गया है।', NULL, '2025-01-14 10:03:29', NULL, 6, NULL, '162.158.163.151', NULL),
	(50, '47', 5, '2025-01-14', 'अवलोकनार्थ/विचारार्थ नस्ती सचिव महोदया को प्रस्तुत दिनांक 14.01.2025।', NULL, '2025-01-14 10:09:56', NULL, 5, NULL, '162.158.162.118', NULL),
	(51, '29', 5, '2025-01-14', 'साप्रवि को अभिमत सहित नस्ती भेजे जाने हेतु सचिव महोदया के समक्ष प्रस्तुत दिनांक 14.01.2025।', NULL, '2025-01-14 10:12:26', NULL, 5, NULL, '162.158.162.119', NULL),
	(52, '45', 6, '2025-01-14', 'रिर्पोर्ट वर्ष 2007.2008 के प्रारूप प्रतिवेदन पर पुष्टि की जानकारी  दिनांक 07.01.2025 को विधानसभा सचिवालय को पत्र प्रेषित किया गया है कार्यवाही पूर्ण।', NULL, '2025-01-14 10:14:38', NULL, 6, NULL, '162.158.163.86', NULL),
	(53, '27', 5, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु नस्ती सचिव महोदया के समक्ष प्रस्तुत दिनांक 14.01.2025।', NULL, '2025-01-14 10:14:43', NULL, 5, NULL, '162.158.162.119', NULL),
	(54, '24', 12, '2025-01-14', 'एफ 1-53/2024/मबावि/50\r\n दिनांक 10.01.2025 को अवर सचिव ।', NULL, '2025-01-14 10:17:17', NULL, 12, NULL, '162.158.162.102', NULL),
	(55, '44', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु दिनांक 14.01.2025 को प्रस्तुत किया गया है।', NULL, '2025-01-14 10:18:32', NULL, 6, NULL, '172.69.165.62', NULL),
	(56, '24', 12, '2025-01-14', 'एफ 1-53/2024/मबावि/50\r\n दिनांक 10.01.2025 को अवर सचिव ।', NULL, '2025-01-14 10:19:43', NULL, 12, NULL, '162.158.162.103', NULL),
	(57, '37', 6, '2025-01-14', 'दिनांक 14.01.2025 को प्रशासकीय अनुमोदन हेतु प्रस्तुत किया गया है।', NULL, '2025-01-14 11:15:57', NULL, 6, NULL, '162.158.163.19', NULL),
	(58, '15', 6, '2025-01-14', 'आदेश जारी 10.01.2025', NULL, '2025-01-14 11:39:41', NULL, 6, NULL, '162.158.163.20', NULL),
	(59, '18', 6, '2025-01-14', 'संचालक से प्रस्ताव प्राप्त-10.01.2025', NULL, '2025-01-14 11:45:06', NULL, 6, NULL, '162.158.162.48', NULL),
	(60, '31', 12, '2025-01-14', 'एफ 1-6/2019/मबावि/50\r\nनस्ती प्रशासकीय अनुमो.पश्चाात दिनांक 14.01.2025 पटल पर।', NULL, '2025-01-14 11:46:56', NULL, 12, NULL, '162.158.163.175', NULL),
	(61, '39', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु प्रस्तुत सं.स.-14.01.2025', NULL, '2025-01-14 11:48:51', NULL, 6, NULL, '162.158.162.48', NULL),
	(62, '38', 6, '2025-01-14', 'प्रशासकीय अनुमोदन हेतु प्रस्तुत सं.स.-14.01.2025', NULL, '2025-01-14 11:53:10', NULL, 6, NULL, '162.158.162.49', NULL),
	(63, '18', 6, '2025-01-14', 'संयुक्त संचालक (मरावी) द्वारा दिनांक 06.01.2025 को मान.उच्च न्यायालय बिलासपुर में केवियट दायर कर दिया गया है।', NULL, '2025-01-14 11:55:59', NULL, 6, NULL, '162.158.162.48', NULL),
	(64, '6', 6, '2025-01-14', 'प्रशासकीय अनुमोदनार्थ प्रस्तुत-14.01.2025', NULL, '2025-01-14 12:10:02', NULL, 6, NULL, '162.158.163.20', NULL),
	(65, '55', 6, '2025-01-14', 'शेष कर्तव्यस्थ अधिकारी, मुख्य सचिव कार्यालय को भेजने हेतु पत्र प्रारूप अनुमोदनार्थ प्रस्तुत-14.01.2025', NULL, '2025-01-14 12:13:04', NULL, 6, NULL, '162.158.162.49', NULL),
	(66, '51', 8, '2025-01-14', 'निर्देशानुसार पत्र क्रमांक 12598 date 8.1.2025 के द्वारा प्रस्ताव प्रेषित किया गया है', NULL, '2025-01-14 19:01:23', NULL, 8, NULL, '172.69.165.51', NULL),
	(67, '51', 8, '2025-01-14', 'निर्देशानुसार पत्र क्रमांक 12598 date 8.1.2025 के द्वारा प्रस्ताव प्रेषित किया गया है', NULL, '2025-01-14 19:01:28', NULL, 8, NULL, '172.69.165.51', NULL),
	(68, '49', 8, '2025-01-14', 'मिशन शक्ति के अंतर्गत सभी NGO DARPAN portal पे पंजीकृत है', NULL, '2025-01-14 19:03:37', '2025-01-15 02:36:20', 8, NULL, '172.69.165.50', NULL),
	(69, '64', 8, '2025-01-14', '317 ही लंबित है', NULL, '2025-01-14 19:21:56', NULL, 8, NULL, '162.158.163.152', NULL),
	(75, '60', 1, '2025-01-15', 'PDF Upload', NULL, '2025-01-15 05:53:21', NULL, 1, NULL, '162.158.162.48', NULL),
	(76, '12', 1, '2025-01-15', 'प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत दिनांक 15.01.2025', NULL, '2025-01-15 12:37:32', NULL, 1, NULL, '162.158.162.48', NULL),
	(77, '88', 1, '2025-01-16', 'दिनांक 16.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती(क्र. 2481/2022)  माननीय मंत्रीजी को प्रेषित।', NULL, '2025-01-16 05:07:58', NULL, 1, NULL, '162.158.162.67', NULL),
	(78, '6', 1, '2025-01-16', 'दिनांक 16.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रेषित।', NULL, '2025-01-16 05:24:56', NULL, 1, NULL, '162.158.163.176', NULL),
	(79, '27', 1, '2025-01-16', 'दिनांक 16.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रेषित।', NULL, '2025-01-16 05:31:37', NULL, 1, NULL, '162.158.163.151', NULL),
	(80, '89', 1, '2025-01-16', 'दिनांक 16.01.2025 को नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-16 05:47:00', NULL, 1, NULL, '162.158.163.151', NULL),
	(81, '55', 6, '2025-01-16', 'विभागीय पत्र क्र.238/177/सीएस/2023/50 दिनांक 15.01.2025 द्वारा मुख्य सचिव कार्यालय को अद्यतन जानकारी प्रेषित।', NULL, '2025-01-16 05:52:54', NULL, 6, NULL, '162.158.162.48', NULL),
	(82, '55', 6, '2025-01-16', 'विभागीय पत्र क्र.238/177/सीएस/2023/50 दिनांक 15.01.2025 द्वारा मुख्य सचिव कार्यालय को अद्यतन जानकारी प्रेषित।', NULL, '2025-01-16 05:53:12', NULL, 6, NULL, '162.158.162.48', NULL),
	(83, '55', 6, '2025-01-16', 'विभागीय पत्र क्र.238/177/सीएस/2023/50 दिनांक 15.01.2025 द्वारा मुख्य सचिव कार्यालय को अद्यतन जानकारी प्रेषित।', NULL, '2025-01-16 05:53:48', NULL, 6, NULL, '162.158.163.151', NULL),
	(84, '55', 6, '2025-01-16', 'विभागीय पत्र क्र.238/177/सीएस/2023/50 दिनांक 15.01.2025 द्वारा मुख्य सचिव कार्यालय को अद्यतन जानकारी प्रेषित।', NULL, '2025-01-16 05:55:41', NULL, 6, NULL, '162.158.163.176', NULL),
	(85, '90', 1, '2025-01-16', 'दिनांक 16.01.2025 को नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-16 05:59:09', NULL, 1, NULL, '162.158.163.78', NULL),
	(86, '55', 6, '2025-01-16', 'विभाग स्तर से दिनांक 15.01.2025 को मुख्य सचिव कार्यालय को जानकारी प्रेषित। कार्यवाही पूर्ण।', NULL, '2025-01-16 07:06:55', NULL, 6, NULL, '162.158.163.19', NULL),
	(87, '55', 6, '2025-01-16', 'विभाग स्तर से दिनांक 15.01.2025 को मुख्य सचिव कार्यालय को जानकारी प्रेषित। कार्यवाही पूर्ण।', NULL, '2025-01-16 07:07:49', NULL, 6, NULL, '162.158.162.170', NULL),
	(88, '55', 6, '2025-01-16', 'विभाग स्तर से दिनांक 15.01.2025 को मुख्य सचिव कार्यालय को जानकारी प्रेषित । कार्यवाही पूर्ण।', NULL, '2025-01-16 07:09:35', NULL, 6, NULL, '162.158.163.82', NULL),
	(89, '21', 1, '2025-01-16', 'पंजी क्रमांक 3798/2022/मबावि/50\r\nदिनांक 15.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-16 08:35:15', NULL, 1, NULL, '162.158.163.152', NULL),
	(90, '22', 1, '2025-01-16', 'पंजी क्रमांक 3725/2024/मबावि/50\r\nदिनांक 15.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-16 08:39:28', NULL, 1, NULL, '162.158.163.152', NULL),
	(91, '31', 1, '2025-01-16', 'दिनांक 15.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-16 08:43:29', NULL, 1, NULL, '162.158.163.175', NULL),
	(92, '29', 1, '2025-01-16', 'दिनांक 15.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-16 10:45:17', NULL, 1, NULL, '172.69.165.51', NULL),
	(93, '48', 1, '2025-01-16', 'दिनांक 15.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-16 10:48:06', NULL, 1, NULL, '162.158.162.48', NULL),
	(94, '11', 1, '2025-01-16', 'दिनांक 15.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-16 10:52:07', NULL, 1, NULL, '162.158.163.176', NULL),
	(95, '10', 1, '2025-01-16', 'दिनांक 15.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-16 10:53:24', NULL, 1, NULL, '162.158.163.190', NULL),
	(96, '5', 6, '2025-01-17', 'दिनांक 10.01.2025 को वित्त विभाग को जानकारी प्रेषित कार्यवाही पूर्ण', NULL, '2025-01-17 04:49:22', NULL, 6, NULL, '162.158.163.175', NULL),
	(97, '100', 6, '2025-01-17', 'finnace deptt ko send karne hetu put up 16-01-2025', NULL, '2025-01-17 05:15:39', NULL, 6, NULL, '162.158.163.175', NULL),
	(100, '101', 6, '2025-01-17', 'दिनांक 17.01.2025 को प्रशासकीय अनुमोदन हेतु प्रस्तुत किया गया अनुमोदन उपरांत वित्त विभाग को प्रेषित किया जावेगा।', NULL, '2025-01-17 06:17:38', NULL, 6, NULL, '162.158.163.176', NULL),
	(101, '54', 6, '2025-01-17', 'गृह विभाग को दिनांक 15.01.2025 को जानकारी प्रेषित। कार्यवाही पूर्ण', NULL, '2025-01-17 06:31:57', NULL, 6, NULL, '162.158.162.128', NULL),
	(102, '54', 6, '2025-01-17', 'गृह विभाग को दिनांक 15.01.2025 को जानकारी प्रेषित। कार्यवाही पूर्ण', NULL, '2025-01-17 06:32:50', NULL, 6, NULL, '162.158.163.85', NULL),
	(103, '5', 6, '2025-01-17', 'वित्त विभाग को पत्र दिनांक 09.01.2025 द्वारा जानकारी प्रेषित। कार्यवाही पूर्ण', NULL, '2025-01-17 06:46:47', NULL, 6, NULL, '162.158.162.48', NULL),
	(104, '101', 6, '2025-01-17', 'पुनः प्रशासकीय अनुमोदनार्थ प्रस्तुत सं.स.-17.01.2025', NULL, '2025-01-17 07:16:05', NULL, 6, NULL, '162.158.162.86', NULL),
	(105, '9', 6, '2025-01-17', 'मा0 मंत्री जी की अध्यक्षता में आज दिनांक 17.01.2025 को बैठक नियत है।', NULL, '2025-01-17 07:21:02', NULL, 6, NULL, '162.158.162.49', NULL),
	(106, '100', 1, '2025-01-17', 'दिनांक 17.01.2025 को नस्ती(F 3-23/2024) वित्त विभाग को प्रस्तुत।', NULL, '2025-01-17 09:23:21', NULL, 1, NULL, '162.158.162.67', NULL),
	(107, '83', 6, '2025-01-17', 'संचालक मबावि को पत्र दिनांक 17.01.2025 द्वारा स्वीकृति प्रदान की गई। कार्यवाही पूर्ण', NULL, '2025-01-17 09:35:05', NULL, 6, NULL, '162.158.163.166', NULL),
	(108, '16', 6, '2025-01-18', 'प्रकरण में समस्त विभागाध्यक्ष/कलेक्टर/यथा उद्योग विभाग,खेल विभाग,नगरीय प्रशासन एवं स्वास्थ्य विभाग को सचिव महोदया की ओर से पत्र प्रारूप अनुमोदनार्थ प्रस्तुत-सं.सं.-17.01.2025', NULL, '2025-01-18 08:05:53', NULL, 6, NULL, '162.158.163.165', NULL),
	(109, '16', 6, '2025-01-18', 'प्रकरण में समस्त विभागाध्यक्ष/कलेक्टर/यथा उद्योग विभाग,खेल विभाग,नगरीय प्रशासन एवं स्वास्थ्य विभाग को भेजने हेतु सचिव महोदया की ओर से पत्र प्रारूप अनुमोदनार्थ प्रस्तुत-सं.सं.-17.01.2025', NULL, '2025-01-18 08:07:32', NULL, 6, NULL, '162.158.162.49', NULL),
	(110, '101', 1, '2025-01-19', 'दिनांक 17.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-19 05:26:37', NULL, 1, NULL, '172.69.165.51', NULL),
	(111, '11', 1, '2025-01-20', 'दिनांक 20.01.2025 को प्रशासकीय अनुमोदन पश्चात नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-20 05:03:55', NULL, 1, NULL, '162.158.162.49', NULL),
	(112, '29', 1, '2025-01-20', 'दिनांक 20.01.2025 को प्रशासकीय अनुमोदन पश्चात नस्ती सामान्य प्रशासन विभाग को प्रस्तुत।', NULL, '2025-01-20 05:08:58', NULL, 1, NULL, '162.158.163.175', NULL),
	(113, '87', 6, '2025-01-20', 'विभागीय पत्र दिनांक 17.01.2025 द्वारा उप सचिव, भारत सरकार, दिव्यांगजन सशक्तिकरण विभाग, सामाजिक न्याय और अधिकारिता मंत्रालय को जानकारी प्रेषित कर दी गई है। कार्यवाही पूर्ण।', NULL, '2025-01-20 05:14:55', NULL, 6, NULL, '162.158.163.152', NULL),
	(114, '6', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 05:19:49', NULL, 1, NULL, '162.158.162.49', NULL),
	(115, '31', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 05:22:49', NULL, 1, NULL, '162.158.163.176', NULL),
	(116, '12', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 05:27:29', NULL, 1, NULL, '162.158.163.175', NULL),
	(117, '88', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 05:30:44', NULL, 1, NULL, '162.158.163.78', NULL),
	(118, '109', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 05:43:20', NULL, 1, NULL, '162.158.162.48', NULL),
	(119, '27', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 05:56:22', NULL, 1, NULL, '162.158.162.171', NULL),
	(120, '48', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 05:59:28', NULL, 1, NULL, '162.158.162.171', NULL),
	(121, '40', 6, '2025-01-20', 'vidhan sabha ko 08-01-2025 presit kiya gaya hai.', NULL, '2025-01-20 06:04:41', NULL, 6, NULL, '172.69.165.63', NULL),
	(122, '40', 6, '2025-01-20', 'karyawahi poorn', NULL, '2025-01-20 06:05:13', NULL, 6, NULL, '162.158.163.86', NULL),
	(123, '112', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 06:07:47', NULL, 1, NULL, '162.158.162.49', NULL),
	(124, '21', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 06:13:26', NULL, 1, NULL, '162.158.162.49', NULL),
	(125, '10', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 06:15:34', NULL, 1, NULL, '162.158.163.92', NULL),
	(126, '22', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 06:17:57', NULL, 1, NULL, '162.158.163.152', NULL),
	(127, '113', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 06:31:38', NULL, 1, NULL, '162.158.162.102', NULL),
	(128, '44', 5, '2025-01-20', 'प्रशासकीय अनुमोदन हेतु नस्ती सचिव महोदया के समक्ष प्रस्तुत दिनांक 15.01.2025।', NULL, '2025-01-20 06:34:53', NULL, 5, NULL, '162.158.163.175', NULL),
	(129, '38', 5, '2025-01-20', 'प्रशासकीय अनुमोदन हेतु नस्ती प्रस्तुत सचिव महोदया दिनांक 15.01.2025।', NULL, '2025-01-20 06:41:23', NULL, 5, NULL, '162.158.163.176', NULL),
	(130, '105', 1, '2025-01-20', 'भारत सरकार को प्रषित किये जाने वाला पत्र हस्ताक्षरित। \r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 06:46:54', NULL, 1, NULL, '162.158.163.176', NULL),
	(131, '17', 6, '2025-01-20', 'प्रकरण में संचालक, महिला एवं बाल विकास से प्राप्त प्रतिवेदन, दिनांक 20.01.2025 को अवलोकनार्थ प्रस्तुत किया गया। संचालक द्वारा आवेदक को प्रकरण की स्थिति से अवगत कराया जा चुका है।', NULL, '2025-01-20 06:51:28', NULL, 6, NULL, '162.158.162.74', NULL),
	(132, '103', 6, '2025-01-20', 'विभागीय पत्र दिनांक 20.01.2025 द्वारा छत्तीसगढ़ शासन, लोक निर्माण विभाग, को जानकारी प्रेषित कर दी गई है।', NULL, '2025-01-20 08:55:25', NULL, 6, NULL, '162.158.162.108', NULL),
	(133, '31', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती-अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 09:31:21', NULL, 5, NULL, '162.158.163.175', NULL),
	(134, '27', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती-अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 09:36:33', NULL, 5, NULL, '162.158.163.175', NULL),
	(135, '23', 5, '2025-01-20', 'पुनः अभिमत सहित प्रस्ताव मंगवाने हेतु पत्र जारी दिनांक 10.01.2025।', NULL, '2025-01-20 09:41:56', NULL, 5, NULL, '162.158.163.175', NULL),
	(136, '23', 5, '2025-01-20', 'पुनः अभिमत सहित प्रस्ताव मंगवाने हेतु पत्र जारी दिनांक 10.01.2025।', NULL, '2025-01-20 09:41:56', NULL, 5, NULL, '162.158.163.175', NULL),
	(137, '22', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त  अ0स0 दिनांक 20.01.2025।', NULL, '2025-01-20 09:45:26', NULL, 5, NULL, '162.158.163.176', NULL),
	(138, '21', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त  अ0स0 दिनांक 20.01.2025।', NULL, '2025-01-20 09:46:28', NULL, 5, NULL, '162.158.162.48', NULL),
	(139, '12', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 10:03:34', NULL, 5, NULL, '162.158.162.49', NULL),
	(140, '47', 1, '2025-01-20', 'दिनांक 16.01.2025 को नस्ती सयुक्त सचिव को रिटर्न।', NULL, '2025-01-20 10:45:46', NULL, 1, NULL, '162.158.162.83', NULL),
	(141, '117', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 11:26:58', NULL, 1, NULL, '162.158.163.176', NULL),
	(142, '10', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 11:27:50', NULL, 5, NULL, '162.158.162.86', NULL),
	(143, '116', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 11:28:51', NULL, 1, NULL, '162.158.163.176', NULL),
	(144, '8', 5, '2025-01-20', 'प्रशासकीय अनुमोदन हेतु नस्ती सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 11:30:41', NULL, 5, NULL, '162.158.162.87', NULL),
	(145, '6', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 11:32:54', NULL, 5, NULL, '162.158.162.86', NULL),
	(146, '114', 5, '2025-01-20', 'नस्ती अवर सचिव के समक्ष प्रस्तुत दिनांक 20.01.2025।', NULL, '2025-01-20 11:40:16', NULL, 5, NULL, '162.158.162.86', NULL),
	(147, '113', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 11:42:00', NULL, 5, NULL, '162.158.162.87', NULL),
	(148, '112', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 11:43:08', NULL, 5, NULL, '162.158.162.87', NULL),
	(149, '101', 1, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 11:44:19', NULL, 1, NULL, '162.158.162.87', NULL),
	(150, '110', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 11:44:42', NULL, 5, NULL, '162.158.162.87', NULL),
	(151, '109', 5, '2025-01-20', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-20 11:45:56', NULL, 5, NULL, '162.158.162.87', NULL),
	(152, '17', 6, '2025-01-20', 'कार्यवाही पूर्ण', NULL, '2025-01-20 11:50:08', NULL, 6, NULL, '162.158.162.75', NULL),
	(153, '114', 1, '2025-01-20', 'पत्र हस्ताक्षरित\r\nसंयुक्त सचिव/20.01.2025', NULL, '2025-01-20 12:05:08', NULL, 1, NULL, '162.158.162.48', NULL),
	(154, '118', 5, '2025-01-21', 'forwarded to under secretary 20.01.2025.', NULL, '2025-01-21 04:26:11', NULL, 5, NULL, '162.158.163.92', NULL),
	(155, '117', 5, '2025-01-21', 'प्रशासकीय अनुमोदन प्राप्त अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-21 04:29:09', NULL, 5, NULL, '162.158.163.91', NULL),
	(156, '116', 5, '2025-01-21', 'प्रशासकीय अनुमोदन प्राप्त अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-21 04:29:43', NULL, 5, NULL, '162.158.163.91', NULL),
	(157, '114', 5, '2025-01-21', 'नस्ती सचिव महोदया के समक्ष प्रस्तुत दिनांक 20.01.2025।', NULL, '2025-01-21 04:32:54', NULL, 5, NULL, '162.158.163.91', NULL),
	(158, '102', 5, '2025-01-21', 'नस्ती अवर सचिव के समक्ष प्रस्तुत दिनांक 20.01.2025।', NULL, '2025-01-21 04:40:35', NULL, 5, NULL, '162.158.163.92', NULL),
	(159, '101', 5, '2025-01-21', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-21 04:41:54', NULL, 5, NULL, '162.158.163.92', NULL),
	(160, '88', 5, '2025-01-21', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 20.01.2025।', NULL, '2025-01-21 04:51:12', NULL, 5, NULL, '162.158.163.91', NULL),
	(161, '34', 6, '2025-01-21', 'सचिव महोदय के समक्ष चर्चा में है', NULL, '2025-01-21 04:53:33', NULL, 6, NULL, '162.158.163.176', NULL),
	(162, '84', 5, '2025-01-21', 'नस्ती अवर सचिव के समक्ष प्रस्तुत दिनांक 20.01.2025।', NULL, '2025-01-21 04:54:26', NULL, 5, NULL, '162.158.162.86', NULL),
	(163, '101', 6, '2025-01-21', 'वित्त विभाग को अंकित किये जाने हेतु आज दिनांक 21.01.2025 को प्रस्तुत किया गया है।', NULL, '2025-01-21 04:56:25', NULL, 6, NULL, '162.158.162.87', NULL),
	(164, '28', 6, '2025-01-21', 'दिनांक 23.12.2024 को निलंबन आदेश जारी व डी.पी.ओ. को कारण बताओं सूचना पत्र जारी।\r\nतत्का. डी.पी.ओ. को दिनांक 06.01.2025 को कारण बताओं सूचना पत्र का उत्तर एक सप्ताह में देने हेतु लिखा गया है।-सं.स.-21.01.2025', NULL, '2025-01-21 04:57:34', NULL, 6, NULL, '162.158.163.222', NULL),
	(165, '103', 6, '2025-01-21', 'कार्यवाही पूर्ण।', NULL, '2025-01-21 04:57:50', NULL, 6, NULL, '162.158.162.87', NULL),
	(166, '48', 5, '2025-01-21', 'प्र0 अनुमोदन प्राप्त अ0स0 दिनांक 20.01.2025।', NULL, '2025-01-21 04:59:24', NULL, 5, NULL, '162.158.162.87', NULL),
	(167, '96', 6, '2025-01-21', 'संयुक्त सचिव-20.01.2025 प्रशा.अनु.', NULL, '2025-01-21 04:59:27', NULL, 6, NULL, '162.158.162.87', NULL),
	(168, '12', 6, '2025-01-21', 'वित्त विभाग को अंकित किये जाने हेतु आज दिनांक 21.01.2025 को प्रस्तुत किया गया है।', NULL, '2025-01-21 05:01:10', NULL, 6, NULL, '162.158.162.87', NULL),
	(169, '86', 6, '2025-01-21', 'दिनांक 16.01.2025 को सा.प्र.वि-3 को जानकारी प्रेषित', NULL, '2025-01-21 05:13:47', NULL, 6, NULL, '162.158.162.109', NULL),
	(170, '104', 6, '2025-01-21', 'छत्तीसगढ़ शासन, योजना, आर्थिक एवं सांख्यिकी विभाग को जानकारी प्रेषित किए जाने हेतु दिनांक 20.01.2025 को नस्ती अनुमोदनार्थ प्रस्तुत।', NULL, '2025-01-21 05:21:38', NULL, 6, NULL, '162.158.163.85', NULL),
	(171, '121', 1, '2025-01-21', 'संयुक्त सचिव/21.01.2025', NULL, '2025-01-21 05:24:56', NULL, 1, NULL, '162.158.163.172', NULL),
	(172, '37', 6, '2025-01-21', 'वित्त विभाग को अंकित किये जाने हेतु आज दिनांक 21.01.2025 को प्रस्तुत किया गया है।', NULL, '2025-01-21 05:30:12', NULL, 6, NULL, '162.158.163.221', NULL),
	(173, '91', 6, '2025-01-21', 'विभागीय पत्र दिनांक 21.01.2025 द्वारा संचालनालय, मबावि को प्रकरण पर समय-सीमा में नियमानुसार आवश्यक कार्यवाही हेतु पत्र प्रेषित कर दिया गया है। कार्यवाही पूर्ण।', NULL, '2025-01-21 05:36:24', NULL, 6, NULL, '162.158.162.48', NULL),
	(174, '118', 12, '2025-01-21', 'विभागीय मूल नस्ती क्रमांक एफ 1-50/2024, दिनांक 29.11.2024 में आदेश जारी किया गया है।', NULL, '2025-01-21 05:42:57', NULL, 12, NULL, '162.158.162.86', NULL),
	(175, '16', 6, '2025-01-21', 'सचिव महोदया के हस्ता.प्रस्तुत-सं.सं-21.01.2025', NULL, '2025-01-21 05:43:20', NULL, 6, NULL, '162.158.163.175', NULL),
	(176, '19', 5, '2025-01-21', 'प्रारूप अनुमोदन हेतु नस्ती सचिव दिनांक 20.01.2025।', NULL, '2025-01-21 05:49:03', NULL, 5, NULL, '162.158.163.176', NULL),
	(177, '93', 10, '2025-01-21', 'संचालनालय के पत्र 13076 दिनांक 20.01.2025 के द्वारा सचिव मबावि को जानकारी प्रेषित', NULL, '2025-01-21 06:01:18', NULL, 10, NULL, '162.158.163.129', NULL),
	(178, '118', 6, '2025-01-21', 'आदेश जारी हो चुका है।कोई कार्यवाही अपेक्षित नहीं।ं', NULL, '2025-01-21 06:03:23', NULL, 6, NULL, '162.158.163.172', NULL),
	(179, '105', 6, '2025-01-21', 'भारत सरकार, महिला एवं बाल विकास मंत्रालय, नई दिल्ली को दिनांक 20.01.2025 को पत्र प्रेषित। कार्यवाही पूर्ण।', NULL, '2025-01-21 06:04:04', NULL, 6, NULL, '162.158.163.248', NULL),
	(180, '2', 10, '2025-01-21', 'संचालनालय के पत्र 12639 दिनांक 09.01.2025 के द्वारा सचिव मबावि को जानकारी प्रेषित', NULL, '2025-01-21 06:08:06', NULL, 10, NULL, '162.158.162.49', NULL),
	(181, '98', 6, '2025-01-21', 'प्रशासकीय अनुमोदनार्थ प्रस्तुत-सं.स’21.01.2025', NULL, '2025-01-21 06:08:28', NULL, 6, NULL, '162.158.162.28', NULL),
	(182, '107', 12, '2025-01-21', 'विभागीय पत्र दिनांक 07.01.2025 द्वारा संचालक,मबावि.को कृत कार्यवाही का प्रतिवेदन चाहा   गया है।', NULL, '2025-01-21 06:13:37', NULL, 12, NULL, '162.158.162.48', NULL),
	(183, '97', 6, '2025-01-21', 'बैठक हेतु समय एवं तिथि निर्धारित किये जाने बाबत्ु नस्ती प्रस्तुत-सं.स-21.01.2025', NULL, '2025-01-21 06:15:11', NULL, 6, NULL, '162.158.163.176', NULL),
	(184, '106', 6, '2025-01-21', 'संयुक्त सचिव-20.01.2025', NULL, '2025-01-21 06:17:49', NULL, 6, NULL, '162.158.163.175', NULL),
	(185, '18', 5, '2025-01-21', 'नस्ती अवर सचिव के समक्ष प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-21 06:20:19', NULL, 5, NULL, '162.158.162.48', NULL),
	(186, '104', 6, '2025-01-21', 'सचिव, योजना एवं आर्थिक एवं सांख्यिकी विभाग को जानकारी प्रेषित-21.01.2025', NULL, '2025-01-21 06:21:04', NULL, 6, NULL, '162.158.163.19', NULL),
	(187, '92', 10, '2025-01-21', 'संचालनालय के पत्र क्रमांक 12012 दिनांक 27.12.2024 के द्वारा सचिव मबावि को जानकारी प्रेषित', NULL, '2025-01-21 06:22:39', NULL, 10, NULL, '162.158.163.91', NULL),
	(188, '24', 5, '2025-01-21', 'नस्ती सचिव महोदया के समक्ष आदेशार्थ प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-21 06:23:42', NULL, 5, NULL, '162.158.163.86', NULL),
	(189, '102', 6, '2025-01-21', 'संक्षेपिका सहित प्रशासकीय अनुमोदन हेतु आ0 दिनांक 21.01.2025 को प्रस्तुत किया गया है।', NULL, '2025-01-21 06:23:51', NULL, 6, NULL, '162.158.162.29', NULL),
	(190, '84', 6, '2025-01-21', 'दोनों प्रस्ताव का उल्लेख करते हुए संक्षेपिका सहित प्रस्तुत करने हेतु -अन.अधि. 21.01.2025', NULL, '2025-01-21 06:27:04', NULL, 6, NULL, '162.158.163.20', NULL),
	(191, '58', 10, '2025-01-21', 'संचालनालय के पत्र क्रमांक 12018 दिनांक 27.12.2024 के द्वारा सचिव मबावि को जानकारी प्रेषित', NULL, '2025-01-21 06:27:47', NULL, 10, NULL, '162.158.163.92', NULL),
	(192, '81', 10, '2025-01-21', 'उक्त पत्र सरल क्रमांक 10 पर पूर्व से दर्ज है', NULL, '2025-01-21 06:30:48', NULL, 10, NULL, '162.158.163.91', NULL),
	(193, '36', 6, '2025-01-21', 'आदिम जाति कल्याण विभाग को जानकारी भेजन हेतु आ0 दिनांक 21.01.2025 को अनुमोदनार्थ प्रस्तुत किया गया है।', NULL, '2025-01-21 06:41:53', NULL, 6, NULL, '162.158.163.175', NULL),
	(194, '36', 6, '2025-01-21', 'आदिम जाति तथा अनुसूचित जाति विकास विभाग को जानकारी प्रेषित किये जाने हेतु पत्र प्रारूप अनुमोदनार्थ प्रस्तुत-सं.स-21.01.2025', NULL, '2025-01-21 06:42:41', NULL, 6, NULL, '172.69.165.50', NULL),
	(195, '43', 6, '2025-01-21', 'दिनांक 15.01.2025 द्वारा आदेश जारी ।', NULL, '2025-01-21 06:46:35', NULL, 6, NULL, '162.158.162.87', NULL),
	(196, '57', 18, '2025-01-21', '1. संचालनालय के पत्र क्रमांक 10662 दिनांक 02.12.2024 के माध्यम से लोक आयोग विविध जांच प्रकरण क्रमांक 107/2022 को नस्तीबद्ध करने हेतु प्रेषित किया गया है।\r\n2. लोक आयोग विविध जांच प्रकरण क्रमांक 89/2018 के संबंध में नस्ती प्रचलन में है।', NULL, '2025-01-21 06:46:57', NULL, 18, NULL, '162.158.162.75', NULL),
	(197, '117', 12, '2025-01-21', 'आर 292/व्हीआईपी/2024/50, दिनांक 20.01.2025 संयुक्त सचिव।', NULL, '2025-01-21 07:19:24', NULL, 12, NULL, '162.158.163.151', NULL),
	(198, '39', 6, '2025-01-21', 'सेवा विववरण प्राप्त किये जाने हेतु संचालक को स्मरण पत्र-7 जारी-21.01.2025', NULL, '2025-01-21 07:21:09', NULL, 6, NULL, '162.158.163.175', NULL),
	(199, '35', 12, '2025-01-21', 'एफ 1-12/2021/50, दिनांक 21.01.2025 संयुक्त सचिव।', NULL, '2025-01-21 07:25:32', NULL, 12, NULL, '162.158.162.86', NULL),
	(200, '33', 12, '2025-01-21', 'एफ 1-52/2024/50/पार्ट, दिनांक 20.01.2025 द्वारा शुद्धि पत्र जारी किया गया।', NULL, '2025-01-21 07:32:59', NULL, 12, NULL, '162.158.163.165', NULL),
	(201, '31', 12, '2025-01-21', 'एफ 1-6/2019/50/पार्ट, दिनांक 21.01.2025 अवर सचिव।', NULL, '2025-01-21 07:40:47', NULL, 12, NULL, '162.158.163.166', NULL),
	(202, '109', 6, '2025-01-21', 'राशि स्वीकृति  का प्रारूप संयुक्त सचिव के अनुमोदन हेतु आ0 दिनांक 21.01.2025 को  प्रस्तुत किया गया है।', NULL, '2025-01-21 07:46:14', NULL, 6, NULL, '172.69.165.10', NULL),
	(203, '30', 12, '2025-01-21', 'एफ 11-2/2024/50/ दिनांक 21.01.2025 संयुक्त सचिव।', NULL, '2025-01-21 07:46:53', NULL, 12, NULL, '162.158.163.166', NULL),
	(204, '112', 6, '2025-01-21', '156 आंगनवाडी केन्द्रों का प्रशासकीय नियंत्रण जिला कोरिया की परियोजना बैकुण्ठपुर को दिये जाने की  अनुमति दिये जाने हेतु प्रारूप संयुक्त सचिव के अनुमोदन हेतु आ0 दिनांक 21.01.2025 को  प्रस्तुत किया गया है।', NULL, '2025-01-21 07:49:25', NULL, 6, NULL, '172.69.165.10', NULL),
	(205, '120', 5, '2025-01-21', 'प्र0 अनुमोदन हेतु नस्ती सचिव दिनांक 20.01.25।', NULL, '2025-01-21 07:56:12', NULL, 5, NULL, '162.158.162.49', NULL),
	(206, '121', 5, '2025-01-21', 'मंत्री स्तरीय बजट चर्चा में शामिल करने हेतु अवर सचिव दिनांक 21.01.2025।', NULL, '2025-01-21 07:58:07', NULL, 5, NULL, '162.158.162.48', NULL),
	(207, '27', 12, '2025-01-21', 'एफ 1-6/2024/50/ दिनांक 21.01.2025 प्रशासकीय अनुमो. उपरांत पटल पर।', NULL, '2025-01-21 07:59:53', NULL, 12, NULL, '162.158.162.87', NULL),
	(208, '24', 12, '2025-01-21', 'एफ 1-53/2024/50/ दिनांक 217.01.2025 द्वारा संयुक्त सचिव।', NULL, '2025-01-21 08:02:37', NULL, 12, NULL, '162.158.162.86', NULL),
	(209, '104', 6, '2025-01-21', 'सचिव, योजना एवं आर्थिक एवं सांख्यिकी विभाग को जानकारी प्रेषित-21.01.2025', NULL, '2025-01-21 08:03:26', NULL, 6, NULL, '162.158.163.176', NULL),
	(210, '88', 6, '2025-01-21', 'वित्त विभाग को अंकित किये जाने हेतु आज दि0 21.01.2025 को नस्ती प्रस्तुत किया गया है।', NULL, '2025-01-21 08:10:05', NULL, 6, NULL, '162.158.162.49', NULL),
	(211, '114', 6, '2025-01-21', 'आज दिनांक 21.01.2025 को सचिव, छत्तीसगढ़ विधानसभा सचिवालय, जानकारी प्रेषित। कार्यवाही पूर्ण।', NULL, '2025-01-21 08:11:25', NULL, 6, NULL, '162.158.163.221', NULL),
	(212, '113', 6, '2025-01-21', 'विभागीय पत्र दिनांक 21.01.2025 द्वारा  संचालक, मबावि, संचालनालय, को स्वीकृति पत्र जारी। कार्यवाही पूर्ण।', NULL, '2025-01-21 08:14:43', NULL, 6, NULL, '162.158.162.86', NULL),
	(213, '48', 6, '2025-01-21', 'वित्त विभाग को अंकित किये जाने हेतु आज दि0 21.01.2025 को नस्ती प्रस्तुत किया गया है।', NULL, '2025-01-21 08:17:35', NULL, 6, NULL, '162.158.162.48', NULL),
	(214, '10', 6, '2025-01-21', 'आज दि0 21.01.2025 को प्रारूप अनुमोदन हेतु नस्ती प्रस्तुत किया गया है।', NULL, '2025-01-21 08:22:07', NULL, 6, NULL, '162.158.162.49', NULL),
	(215, '85', 6, '2025-01-21', 'छत्तीसगढ़ शासन, वित्त विभाग, को विभागीय पत्र दिनांक 21.01.2025 द्वारा जानकारी प्रेषित। कार्यवाही पूर्ण', NULL, '2025-01-21 08:23:41', NULL, 6, NULL, '162.158.163.176', NULL),
	(216, '109', 6, '2025-01-21', 'नस्ती दिनांक 21.01.2025 को सहमति हेतु आदिम जाति कल्याण की अंकित करने प्रस्तुत', NULL, '2025-01-21 08:30:22', NULL, 6, NULL, '162.158.162.48', NULL),
	(217, '30', 5, '2025-01-21', 'सचिव महोदया के समक्ष हस्ताक्षरार्थ प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-21 08:43:00', NULL, 5, NULL, '172.69.165.10', NULL),
	(218, '12', 5, '2025-01-21', 'वित्त विभाग को अंकित किये जाने हेतु नस्ती सचिव महोदय के समक्ष प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-21 08:44:29', NULL, 5, NULL, '172.69.165.10', NULL),
	(219, '106', 17, '2025-01-21', 'नस्ती प्रचलन में है।', NULL, '2025-01-21 09:35:43', NULL, 17, NULL, '162.158.162.103', NULL),
	(220, '94', 17, '2025-01-21', 'नस्ती प्रचलन में है।', NULL, '2025-01-21 09:35:58', NULL, 17, NULL, '162.158.162.103', NULL),
	(221, '74', 17, '2025-01-21', 'नस्ती प्रचलन में है।', NULL, '2025-01-21 09:38:47', NULL, 17, NULL, '162.158.162.103', NULL),
	(222, '55', 6, '2025-01-21', 'कार्यवाही पूर्ण।', NULL, '2025-01-21 09:39:29', NULL, 6, NULL, '162.158.162.74', NULL),
	(223, '68', 17, '2025-01-21', 'मिशन वात्सल्य पोर्टल पर जिलों द्वारा जानकारी अद्यतन (अप्रैल से जून) की गई है।', NULL, '2025-01-21 09:40:10', NULL, 17, NULL, '162.158.162.102', NULL),
	(224, '50', 17, '2025-01-21', 'दिनांक 17.01.2025 को रायपुर एवं बिलासपुर डीपीओ एवं डीसीपीयू की समक्ष में बैठक कर वात्सल्य सदन हेतु संशोधित प्रस्ताव प्रेषित करने हेतु कहां गया है।', NULL, '2025-01-21 09:41:17', NULL, 17, NULL, '162.158.162.102', NULL),
	(225, '106', 6, '2025-01-21', 'नई दिल्ली/गृह विभाग,मंत्रालय एवं इस विभाग को अगवत कराने हेतु संचालक को पत्र प्रेषित-21.01.2025', NULL, '2025-01-21 09:41:29', NULL, 6, NULL, '162.158.162.170', NULL),
	(226, '49', 17, '2025-01-21', 'दर्पण पोर्टल पर 28 एनजीओ के पंजीकरण की कार्यवाही पूर्ण कर ली गई है।', NULL, '2025-01-21 09:42:21', NULL, 17, NULL, '162.158.162.102', NULL),
	(227, '106', 18, '2025-01-21', 'नस्ती प्रचलन में है।', NULL, '2025-01-21 09:45:08', NULL, 18, NULL, '162.158.162.102', NULL),
	(228, '94', 18, '2025-01-21', 'नस्ती प्रचलन में है।', NULL, '2025-01-21 09:45:17', NULL, 18, NULL, '162.158.162.102', NULL),
	(229, '94', 18, '2025-01-21', 'नस्ती प्रचलन में है।', NULL, '2025-01-21 09:49:20', NULL, 18, NULL, '162.158.162.86', NULL),
	(230, '105', 6, '2025-01-21', 'कार्यवाही पूर्ण।', NULL, '2025-01-21 09:49:33', NULL, 6, NULL, '162.158.162.86', NULL),
	(231, '50', 18, '2025-01-21', 'दिनांक 17.01.2025 को रायपुर एवं बिलासपु डीपीओ की समक्ष में बैठक कर संशोधित प्रस्ताव शीघ्र प्रेेषित करने हेतु कहां गया है।', NULL, '2025-01-21 09:50:35', NULL, 18, NULL, '162.158.162.86', NULL),
	(232, '96', 18, '2025-01-21', 'पत्र अप्राप्त', NULL, '2025-01-21 09:53:14', NULL, 18, NULL, '162.158.163.86', NULL),
	(233, '79', 18, '2025-01-21', 'पत्र अप्राप्त', NULL, '2025-01-21 09:54:20', NULL, 18, NULL, '162.158.163.86', NULL),
	(234, '68', 17, '2025-01-21', 'मिशन वात्सल्य पोर्टल पर जिलों द्वारा जानकारी अद्यतन (अप्रैल से जून) की गई है।', NULL, '2025-01-21 10:01:41', NULL, 17, NULL, '162.158.163.165', NULL),
	(235, '49', 17, '2025-01-21', 'दर्पण पोर्टल पर 28 एनजीओ के पंजीकरण की कार्यवाही पूर्ण कर ली गई है।', NULL, '2025-01-21 10:02:45', NULL, 17, NULL, '162.158.163.165', NULL),
	(236, '2', 17, '2025-01-21', 'छत्तीसगढ़ नक्सलवाद उन्मूलन संशोधन नीति के संबंध में समन्वय शाखा को जानकारी दी जा चुकी है।', NULL, '2025-01-21 10:05:42', NULL, 17, NULL, '162.158.163.165', NULL),
	(237, '1', 17, '2025-01-21', 'पत्र सरल क्रमांक 03 पर पूर्व से दर्ज है।', NULL, '2025-01-21 10:06:13', NULL, 17, NULL, '162.158.163.165', NULL),
	(238, '81', 17, '2025-01-21', 'कार्यवाही प्रचलन में है।', NULL, '2025-01-21 10:06:55', NULL, 17, NULL, '162.158.163.165', NULL),
	(239, '120', 1, '2025-01-21', 'दिनांक 21.01.2025 को प्रशासकीय अनुमोदन हेतु नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-21 10:16:15', NULL, 1, NULL, '162.158.162.82', NULL),
	(240, '23', 12, '2025-01-21', 'आर 277/2024/50/ दिनांक 09.01.2025 अवर सचिव।', NULL, '2025-01-21 10:27:58', NULL, 12, NULL, '162.158.163.19', NULL),
	(241, '36', 5, '2025-01-21', 'पत्र प्रारूप अनुमोदनार्थ अवर सचिव दिनांक 21.01.2025।', NULL, '2025-01-21 11:46:07', NULL, 5, NULL, '162.158.163.151', NULL),
	(242, '28', 5, '2025-01-21', 'नस्ती अवर सचिव के समक्ष प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-21 11:49:55', NULL, 5, NULL, '162.158.163.152', NULL),
	(243, '16', 5, '2025-01-21', 'सचिव महोदया के हस्ताक्षरार्थ प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-21 11:53:48', NULL, 5, NULL, '162.158.163.152', NULL),
	(244, '10', 5, '2025-01-21', 'प्रारूप अनुमोदनार्थ अ0स0 दिनांक 21.01.2025।', NULL, '2025-01-21 11:55:39', NULL, 5, NULL, '162.158.163.152', NULL),
	(245, '12', 1, '2025-01-21', 'दिनांक 21.01.2025 को नस्ती वित्त विभाग में प्रस्तुत।', NULL, '2025-01-21 11:58:14', NULL, 1, NULL, '162.158.162.86', NULL),
	(246, '28', 12, '2025-01-21', '(1) एफ 07-12/2024/50/आदेश दिनांक 23.12.2025 द्वारा  श्रीमती ज्योति मथरानी को निलंबित किया गया है एवं श्री अरूण कुमार पाण्डेय को कारण बताओं सूचना पत्र जारी किया गया। दिनांक 06/01/2025 को स्तरण पत्र प्रेषित किया गया है। जानकारी अप्राप्त।\r\n(2) श्रीमती मथरानी से प्राप्त आवेदन पर दिनांक 21.01.2025 को संचालक से जानकारी प्राप्त करने हेतु अनुमोदन होकर नस्ती पटल पर है।', NULL, '2025-01-21 12:29:04', NULL, 12, NULL, '162.158.162.86', NULL),
	(247, '123', 6, '2025-01-21', 'आज प्राप्त-21.01.2025', NULL, '2025-01-21 12:33:45', NULL, 6, NULL, '162.158.162.119', NULL),
	(248, '122', 6, '2025-01-21', 'आज प्राप्त-21.01.2025', NULL, '2025-01-21 12:34:05', NULL, 6, NULL, '162.158.162.119', NULL),
	(249, '108', 6, '2025-01-21', 'आज प्राप्त-21.01.2025', NULL, '2025-01-21 12:35:18', NULL, 6, NULL, '162.158.163.91', NULL),
	(250, '107', 6, '2025-01-21', 'संचालक से जानकारी प्राप्त -21.01.2025', NULL, '2025-01-21 12:37:00', NULL, 6, NULL, '162.158.162.86', NULL),
	(251, '111', 6, '2025-01-21', 'विभागीय पत्र 20454/202, दिनांक 22.01.2025 द्वारा अनुमति आदेश/पत्र जारी', NULL, '2025-01-21 12:44:11', NULL, 6, NULL, '162.158.162.86', NULL),
	(252, '6', 6, '2025-01-21', 'न मांग न जांच न घटना प्रमाण पत्र जारी-2101.2025', NULL, '2025-01-21 12:51:36', NULL, 6, NULL, '162.158.162.49', NULL),
	(253, '11', 6, '2025-01-21', 'विभागीय पत्र 2336/2024, दिनांक 22.01.2025 द्वारा सैद्यांतिक सहमति पत्र जारी', NULL, '2025-01-21 12:56:28', NULL, 6, NULL, '162.158.163.151', NULL),
	(254, '6', 12, '2025-01-21', 'आर 3650/2024/मबावि/50, दिनांक 21/01/2025 द्वारा संचालक,मबावि.को स्वीकूति पत्र जारी किया गया।', NULL, '2025-01-21 12:57:40', NULL, 12, NULL, '162.158.163.151', NULL),
	(255, '21', 12, '2025-01-21', 'आर 3798/2024/मबावि/50, दिनांक 21/01/2025 द्वारा संचालक,मबावि.को स्वीकूति पत्र जारी किया गया।', NULL, '2025-01-21 13:04:40', NULL, 12, NULL, '162.158.162.48', NULL),
	(256, '21', 6, '2025-01-21', 'विभागीय पत्र 3798/2024, दिनांक 21.01.2025 द्वारा न मांग न जांच न घटना प्रमाण पत्र जारी-2101.2025', NULL, '2025-01-21 13:06:12', NULL, 6, NULL, '162.158.163.176', NULL),
	(257, '22', 12, '2025-01-21', 'आर 3725/2024/मबावि/50, दिनांक 21/01/2025 द्वारा संचालक,मबावि.को स्वीकूति पत्र जारी किया गया।', NULL, '2025-01-21 13:14:34', NULL, 12, NULL, '162.158.163.166', NULL),
	(258, '31', 12, '2025-01-21', 'एफ 1-6/2019/मबावि/50, दिनांक 21/01/2025 द्वारा संचालक,मबावि.को स्वीकूति पत्र जारी किया गया।', NULL, '2025-01-21 13:25:39', NULL, 12, NULL, '162.158.163.166', NULL),
	(259, '109', 5, '2025-01-22', 'नस्ती आदिम जाति कल्याण विभाग को अंकित करने हेतु सचिव महोदया के समक्ष प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-22 04:49:12', NULL, 5, NULL, '162.158.162.100', NULL),
	(260, '48', 5, '2025-01-22', 'नस्ती वित्त विभाग को अंकित करने हेतु सचिव महोदया के समक्ष प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-22 04:52:57', NULL, 5, NULL, '162.158.162.101', NULL),
	(261, '120', 6, '2025-01-22', 'प्रशासकीय अनुमोदन से प्राप्त नस्ती वित्त विभाग को अंकित किये जाने हेतु प्रस्तुत-22.01.2025', NULL, '2025-01-22 05:22:26', NULL, 6, NULL, '172.69.165.11', NULL),
	(262, '10', 6, '2025-01-22', 'विभागीय पत्र दिनांक 21.01.2025 द्वारा कार्ययोजना की स्वीकृति जारी की गई।', NULL, '2025-01-22 06:17:50', NULL, 6, NULL, '162.158.163.71', NULL),
	(263, '10', 6, '2025-01-22', 'कार्यवाही पूर्ण', NULL, '2025-01-22 06:18:27', NULL, 6, NULL, '162.158.162.48', NULL),
	(264, '111', 6, '2025-01-22', 'विभागीय पत्र क्रमांक 382/2044/2022/मबावि/50 ,दिनांक 22.01.2025 द्वारा संचालक, संचालनालय, मबावि को अनुमति दी गई।', NULL, '2025-01-22 06:18:29', NULL, 6, NULL, '162.158.163.89', NULL),
	(265, '10', 6, '2025-01-22', 'विभागीय पत्र दिनांक 21.01.2025 द्वारा कार्ययोजना की स्वीकृति जारी की गई।\r\nकार्यवाही पूर्ण', NULL, '2025-01-22 06:19:04', NULL, 6, NULL, '162.158.162.121', NULL),
	(266, '36', 6, '2025-01-22', 'विभागीय पत्र क्रमांक 357/77/सा./2025/50 ,दिनांक 21.01.2025 द्वारा विभागीय ज्ञापन की जानकारी आदिम जाति तथा अनुसूचित जाति विकास विभाग को प्रेषित कर दी गई है। कार्यवाही पूर्ण।', NULL, '2025-01-22 06:24:48', NULL, 6, NULL, '162.158.163.72', NULL),
	(267, '111', 6, '2025-01-22', 'कार्यवाही पूर्ण।', NULL, '2025-01-22 06:25:58', NULL, 6, NULL, '162.158.162.185', NULL),
	(268, '15', 1, '2025-01-22', 'विभागीय समसंख्यक आदेश दिनांक 10.01.2025 अवलोकित। \r\nसंयुक्त सचिव/22.01.2025', NULL, '2025-01-22 06:32:14', NULL, 1, NULL, '162.158.163.149', NULL),
	(269, '93', 3, '2025-01-22', 'संचालनालय के पत्र 13076 दिनांक 20.01.2025 के द्वारा सचिव मबावि को जानकारी प्रेषित', NULL, '2025-01-22 07:30:19', NULL, 3, NULL, '162.158.163.151', NULL),
	(270, '92', 3, '2025-01-22', 'संचालनालय के पत्र क्रमांक 12012 दिनांक 27.12.2024 के द्वारा सचिव मबावि को जानकारी प्रेषित', NULL, '2025-01-22 07:31:51', NULL, 3, NULL, '162.158.163.151', NULL),
	(271, '22', 12, '2025-01-22', 'संचालक, मबावि को स्वीकृति पत्र जारी/21.01.2025', NULL, '2025-01-22 07:38:14', NULL, 12, NULL, '162.158.163.81', NULL),
	(272, '2', 3, '2025-01-22', 'छत्तीसगढ़ नक्सलवाद उन्मूलन संशोधन नीति के संबंध में समन्वय शाखा को जानकारी दी जा चुकी है।', NULL, '2025-01-22 07:40:08', NULL, 3, NULL, '162.158.163.247', NULL),
	(273, '21', 12, '2025-01-22', 'संचालक, मबावि को न मांग न जांच न घटना प्रमाण पत्र जारी/21.01.2025', NULL, '2025-01-22 07:42:47', NULL, 12, NULL, '162.158.163.221', NULL),
	(274, '6', 12, '2025-01-22', 'संचालक, मबावि को न मांग न जांच न घटना प्रमाण पत्र जारी/21.01.2025', NULL, '2025-01-22 07:44:30', NULL, 12, NULL, '162.158.162.122', NULL),
	(275, '84', 12, '2025-01-22', 'दिनांक 21.01.2025 को नस्ती पटल पर।', NULL, '2025-01-22 07:48:42', NULL, 12, NULL, '162.158.163.90', NULL),
	(276, '62', 15, '2025-01-22', 'संचालनालय के पत्र क्र. 9070 दिनांक 22.12.2023 द्वारा SNP 2nd  quarter  एवं पत्र क्र. 12612 दिनांक 9.01.2025 द्वारा SAG 2023-24 का UC भारत शासन को भेजा गया।', NULL, '2025-01-22 07:56:55', NULL, 15, NULL, '162.158.162.61', NULL),
	(277, '67', 9, '2025-01-22', '2875 आंगनबाड़ी कार्यकर्ताओं का ई-केवायसी आयुष्मान पोर्टल पर वेरिफाई नहीं हुआ है। सूची स्वास्थ्य विभाग के पास होना चाहिए। उनसे सूची प्राप्त करते हुए अपडेट कराने की कार्यवाही प्रक्रियाधीन है।', NULL, '2025-01-22 08:03:54', NULL, 9, NULL, '162.158.163.221', NULL),
	(278, '65', 9, '2025-01-22', '158 बाल विकास परियोजनाओं की सूची प्राप्त है जिनके लंबित देयक के भुगतान के लिये आबंटन दिया जा रहा है। 62 बाल विकास परियोजनाओं से अब तक विवरण अप्राप्त है। निरंतर निर्देश के पश्चात् भी बाल विकास परियेाजना अधिकारियों द्वारा जानकारी अपडेट नहीं किया जा रहा है।', NULL, '2025-01-22 08:06:18', NULL, 9, NULL, '162.158.163.71', NULL),
	(279, '62', 9, '2025-01-22', 'वर्ष 2022-23 एवं 2023-24 का उपयोगिता प्रमाण-पत्र प्रेषित कर दिया गया है।', NULL, '2025-01-22 08:07:32', NULL, 9, NULL, '162.158.163.72', NULL),
	(280, '61', 9, '2025-01-22', 'सभी मोबाईल से एमडीएम हटा दिया गया है। जानकारी हेेतु औपचारिक पत्र शासन को प्रेषित किया जा रहा है।', NULL, '2025-01-22 08:08:44', NULL, 9, NULL, '162.158.163.72', NULL),
	(281, '120', 1, '2025-01-22', 'दिनांक 22.01.2025 को नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-22 08:17:10', NULL, 1, NULL, '162.158.162.107', NULL),
	(282, '60', 9, '2025-01-22', 'प्रकरण जिला कलेक्टर कोरबा के समक्ष अपील प्रकरण के रूप में दर्ज करने हेतु पत्र भेजा गया है तथा आवेदक को अवगत करा दिया गया है।', NULL, '2025-01-22 08:22:16', NULL, 9, NULL, '162.158.163.222', NULL),
	(283, '102', 1, '2025-01-22', 'पृच्छा। संयुक्त सचिव/22.01.2025', NULL, '2025-01-22 10:56:39', NULL, 1, NULL, '162.158.162.28', NULL),
	(284, '31', 12, '2025-01-22', 'एफ 1-6/2019/मबावि/50, दिनांक 21/01/2025 द्वारा संचालक,मबावि.को स्वीकूति पत्र जारी किया गया।\r\nकार्यवाही पूर्ण', NULL, '2025-01-22 11:10:10', NULL, 12, NULL, '162.158.162.207', NULL),
	(285, '28', 12, '2025-01-22', 'विभागीय आदेश दिनांक 23.12.2024 द्वारा निलबंन आदेश व कारण बताओं सूचना पत्र जारी किया गया। इस संबंध में श्रीमती ज्योति मथरानी, परि.अधिकारी के आवेदन पर संचालक, मबावि. से विभागीय पत्र दिनांक 22/01/2025 द्वारा अभिमत चाहा गया है।', NULL, '2025-01-22 11:24:09', NULL, 12, NULL, '162.158.163.102', NULL),
	(286, '37', 1, '2025-01-22', 'यह प्रस्ताव पोर्टल में दो बार प्रविष्ट( 240037 एवं 240088) होने के कारण कार्य क्रमांक 240037 को समाप्त किया जा रहा है।', NULL, '2025-01-22 11:47:06', NULL, 1, NULL, '172.69.165.11', NULL),
	(287, '88', 1, '2025-01-22', 'दिनांक 22.01.2025 को नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-22 11:52:26', NULL, 1, NULL, '162.158.163.71', NULL),
	(289, '109', 1, '2025-01-23', 'दिनांक 23.01.2025 को नस्ती आदिम जाति कल्याण विभाग को प्रस्तुत।', NULL, '2025-01-23 05:10:37', NULL, 1, NULL, '162.158.162.86', NULL),
	(290, '98', 1, '2025-01-23', 'दिनांक 23.01.2025 को नस्ती प्रशासकीय अनुमोदन हेतु माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-23 05:20:45', NULL, 1, NULL, '162.158.162.103', NULL),
	(291, '48', 1, '2025-01-23', 'दिनांक 23.01.2025 को नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-23 05:47:29', NULL, 1, NULL, '162.158.163.248', NULL),
	(292, '16', 1, '2025-01-23', 'पत्र हस्ताक्षरित। संयुक्त सचिव/23.01.2025', NULL, '2025-01-23 06:15:59', NULL, 1, NULL, '162.158.163.91', NULL),
	(293, '19', 1, '2025-01-23', 'प्रारूप अनुमोदित। संयुक्त सचिव/23.01.2025', NULL, '2025-01-23 06:38:44', NULL, 1, NULL, '162.158.163.189', NULL),
	(294, '97', 1, '2025-01-23', 'नस्ती आदर्श आचार संहिता के बाद प्रस्तुत करें। संयुक्त सचिव/23.01.2025', NULL, '2025-01-23 06:42:39', NULL, 1, NULL, '162.158.162.87', NULL),
	(295, '24', 1, '2025-01-23', 'नस्ती आदर्श आचार संहिता के बाद प्रस्तुत करें। संयुक्त सचिव/23.01.2025', NULL, '2025-01-23 06:43:59', NULL, 1, NULL, '162.158.163.151', NULL),
	(296, '16', 5, '2025-01-23', 'पत्र हस्ताक्षरित अवर सचिव दिनांक 23.01.2025।', NULL, '2025-01-23 09:56:36', NULL, 5, NULL, '162.158.163.152', NULL),
	(297, '19', 5, '2025-01-23', 'पत्र प्रारूप अनुमोदनार्थ अवर सचिव दिनांक 23.01.2025।', NULL, '2025-01-23 09:59:00', NULL, 5, NULL, '162.158.163.151', NULL),
	(298, '24', 5, '2025-01-23', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 23.01.2025।', NULL, '2025-01-23 10:11:51', NULL, 5, NULL, '162.158.162.87', NULL),
	(299, '27', 5, '2025-01-23', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 23.01.2025।', NULL, '2025-01-23 10:14:24', NULL, 5, NULL, '162.158.162.87', NULL),
	(300, '35', 5, '2025-01-23', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 21.01.2025।', NULL, '2025-01-23 10:24:05', NULL, 5, NULL, '162.158.163.77', NULL),
	(301, '81', 16, '2025-01-23', 'वित्त शाखा से संबंधित नहीं है।', NULL, '2025-01-23 10:34:17', NULL, 16, NULL, '162.158.163.221', NULL),
	(302, '1', 16, '2025-01-23', 'वित्त शाखा से संबंधित नहीं है।', NULL, '2025-01-23 10:35:02', NULL, 16, NULL, '162.158.163.221', NULL),
	(303, '1', 16, '2025-01-23', 'वित्त शाखा से संबंधित नहीं है।', NULL, '2025-01-23 10:35:51', NULL, 16, NULL, '162.158.163.221', NULL),
	(304, '78', 16, '2025-01-23', 'दिनांक 20.01.2025 कों सचिव स्तरीय चर्चा की जा चुकी है।', NULL, '2025-01-23 10:38:10', NULL, 16, NULL, '162.158.163.221', NULL),
	(305, '97', 5, '2025-01-23', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 23.01.2025।', NULL, '2025-01-23 10:40:21', NULL, 5, NULL, '162.158.162.102', NULL),
	(306, '78', 16, '2025-01-23', 'सचिव स्तरीय चर्चा के नवीन मद की सुची', NULL, '2025-01-23 10:46:23', NULL, 16, NULL, '162.158.162.48', NULL),
	(307, '102', 5, '2025-01-23', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 23.01.2025।', NULL, '2025-01-23 11:12:13', NULL, 5, NULL, '162.158.162.118', NULL),
	(308, '63', 16, '2025-01-23', 'निराकरण किया जा चुका है।', NULL, '2025-01-23 11:17:17', NULL, 16, NULL, '162.158.162.86', NULL),
	(309, '108', 5, '2025-01-23', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 23.01.2025।', NULL, '2025-01-23 11:35:37', NULL, 5, NULL, '162.158.163.171', NULL),
	(310, '94', 17, '2025-01-24', 'विभिन्न प्रकरणों में न्यायालयों द्वारा अधिरोपित जुर्माने की राशि संबंधित बाल संप्रेक्षण गृह को प्रदान करने एवं राशि के उपयोग के सम्बंध में जिलो को आवश्यक दिशा निर्देश जारी किये गये है।', NULL, '2025-01-24 05:22:58', NULL, 17, NULL, '162.158.163.206', NULL),
	(311, '74', 17, '2025-01-24', 'भारत सरकार के निर्देशनुसार वीर बाल दिवस 2024 का आयोजन किया गया एवं प्रतिवेदन फोटोग्राफ्स सहित भारत सरकार को प्रेषित किया गया।', NULL, '2025-01-24 05:40:59', NULL, 17, NULL, '162.158.163.127', NULL),
	(312, '116', 1, '2025-01-24', 'आदर्श आचार संहिता लागू। संयुक्त सचिव/24.01.2025', NULL, '2025-01-24 05:41:12', NULL, 1, NULL, '162.158.162.254', NULL),
	(313, '27', 1, '2025-01-24', 'आदर्श आचार संहिता लागू। संयुक्त सचिव/24.01.2025', NULL, '2025-01-24 05:42:40', NULL, 1, NULL, '162.158.162.182', NULL),
	(314, '123', 5, '2025-01-24', 'प्रशासकीय अनुमोदन हेतु नस्ती सचिव महोदया के समक्ष प्रस्तुत दिनांक 24.01.2025।', NULL, '2025-01-24 06:44:10', NULL, 5, NULL, '162.158.162.174', NULL),
	(315, '117', 5, '2025-01-24', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 20.01.2025।', NULL, '2025-01-24 06:47:05', NULL, 5, NULL, '162.158.162.174', NULL),
	(316, '116', 5, '2025-01-24', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 24.01.2025।', NULL, '2025-01-24 06:50:16', NULL, 5, NULL, '162.158.162.175', NULL),
	(317, '34', 12, '2025-01-24', 'एफ 02-01/2005/मबावि/50, दिनांक 24.12.2024 सचिव (चर्चा में)।', NULL, '2025-01-24 07:23:13', NULL, 12, NULL, '162.158.163.147', NULL),
	(318, '110', 5, '2025-01-24', 'नस्ती अवलोकनार्थ- अवर सचिव दिनांक 23.01.2025।', NULL, '2025-01-24 08:23:04', NULL, 5, NULL, '162.158.162.174', NULL),
	(319, '122', 5, '2025-01-24', 'नस्ती प्रशासकीय अनुमोदन हेतु सचिव महोदया के समक्ष प्रस्तुत दिनांक 24.01.2025।', NULL, '2025-01-24 11:37:45', NULL, 5, NULL, '162.158.162.55', NULL),
	(320, '123', 1, '2025-01-24', 'दिनांक 24.01.2025 को नस्ती प्रशासकीय अनुमोदन हेतु माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-24 11:46:04', NULL, 1, NULL, '162.158.162.175', NULL),
	(321, '34', 12, '2025-01-24', 'एफ 02-01/2005/मबावि/50, दिनांक 24.12.2024 सचिव (चर्चा में)।', NULL, '2025-01-24 12:12:33', NULL, 12, NULL, '172.69.165.62', NULL),
	(322, '34', 12, '2025-01-24', 'एफ 02-01/2005/मबावि/50, दिनांक 24.12.2024 सचिव (चर्चा में)।', NULL, '2025-01-24 12:23:33', NULL, 12, NULL, '162.158.162.182', NULL),
	(323, '27', 12, '2025-01-24', 'एफ 01-06/2024/मबावि/50, दिनांक 24.01.2024 द्वारा प्रकरण आचार संहिता समाप्ति उपरांत प्रस्तुत करने हेतु अनुमोदित।', NULL, '2025-01-24 12:47:02', NULL, 12, NULL, '162.158.162.111', NULL),
	(324, '126', 6, '2025-01-27', 'संचा0मबावि द्वारा अवगत कराया है कि जिला जशपुर में प्रति आंगनवाडी भवन निर्माण राशि 1,69 ,000/- के मान से 985 भवन निर्माण हेतु 16,64,65,000/- का अतिरिक्त आवंटन प्रदाय किया जा चुका है।\r\nनस्ती अवलोकन हेतु संयुक्त सचिव को दि0 27.01.2025 को अंकित है।', NULL, '2025-01-27 04:42:27', NULL, 6, NULL, '162.158.162.111', NULL),
	(325, '124', 6, '2025-01-27', 'प्रशासकीय अनुमोदन हेतु दिनांक 27.01.2025 को नस्ती संयुक्त सचिव को अंकित है।', NULL, '2025-01-27 04:44:54', NULL, 6, NULL, '162.158.163.147', NULL),
	(326, '102', 6, '2025-01-27', 'क्रय की गई सामग्री प्रदाय हो गयी है ? यदि हां तो उसकी रिपोर्ट एवं गुणवत्ता की रिपोर्ट मंगाये जाने हेतु संचालक को पत्र दिनांक 27.01.2025 प्रेषित किया गया है।', NULL, '2025-01-27 04:54:18', NULL, 6, NULL, '162.158.162.111', NULL),
	(327, '119', 6, '2025-01-27', 'पुलिस वेरीफिकेशन हेतु भेजे जाने हेतु अनुमोदार्थ प्रस्तुत सं.सं.-24.01.2025', NULL, '2025-01-27 05:14:33', NULL, 6, NULL, '162.158.163.138', NULL),
	(328, '125', 6, '2025-01-27', 'विभागीय पत्र दिनांक 24.01.2025 द्वारा अभिभाषण संबंधी जानकारी श्री उमेश मिश्रा, अपर संचालक, जनसंपर्क संचालनालय को प्रेषित कर दी गई है।', NULL, '2025-01-27 05:15:00', NULL, 6, NULL, '162.158.162.175', NULL),
	(329, '115', 6, '2025-01-27', 'पुलिस वेरीफिकेशन हेतु भेजे जाने हेतु अनुमोदार्थ प्रस्तुत सं.सं.-24.01.2025', NULL, '2025-01-27 05:16:24', NULL, 6, NULL, '162.158.162.179', NULL),
	(330, '106', 17, '2025-01-27', 'संबंधित जिला के कलेक्टर को जॉच एवं कार्यवाही के लिए पत्र प्रेषित किया गया है।', NULL, '2025-01-27 06:42:02', NULL, 17, NULL, '162.158.162.182', NULL),
	(331, '4', 12, '2025-01-27', 'आर 267/व्हीआईपी/2024/50, दिनांक 15.01.2025 द्वारा न्यायालय के आदेश पश्चात प्रस्तुत करने का लेख है।', NULL, '2025-01-27 06:56:48', NULL, 12, NULL, '162.158.162.28', NULL),
	(332, '107', 12, '2025-01-27', 'आर 1712/2024/मबावि/50, दिनांक 27.01.2025 संयुक्त सचिव।', NULL, '2025-01-27 07:07:39', NULL, 12, NULL, '162.158.162.175', NULL),
	(333, '59', 16, '2025-01-27', 'जानकारी प्रेषित की जा चुकी हैै।', NULL, '2025-01-27 07:25:43', NULL, 16, NULL, '162.158.162.111', NULL),
	(334, '130', 12, '2025-01-27', 'एफ 6-6/2025/मबावि/50, दिनांक 27.01.2025 संयुक्त सचिव।', NULL, '2025-01-27 10:24:36', NULL, 12, NULL, '162.158.162.128', NULL),
	(335, '129', 12, '2025-01-27', 'आर 3799/2024/मबावि/50, दिनांक 27.01.2025 संयुक्त सचिव।', NULL, '2025-01-27 10:34:47', NULL, 12, NULL, '162.158.163.157', NULL),
	(336, '128', 12, '2025-01-27', 'एफ 6-176/2024/मबावि/50/पार्ट, दिनांक 27.01.2025 श्री पटेल।', NULL, '2025-01-27 10:48:32', NULL, 12, NULL, '162.158.163.148', NULL),
	(337, '127', 12, '2025-01-27', '11/व्हीआईपी/2025/मबावि/50/ दिनांक 27.01.2025 संयुक्त सचिव।', NULL, '2025-01-27 10:51:27', NULL, 12, NULL, '162.158.162.182', NULL),
	(338, '128', 6, '2025-01-27', 'मा0 उच्च न्यायालय द्वारा पारित आदेश के परिप्रेक्ष्य में संचालनालय, मबावि को नियमानुसार कार्यवाही करने हेतु लेख किये जाने हेतु नस्ती अनुमोदनार्थ संयुक्त सचिव को दिनांक 27.01.2025 को अंकित किया गया है।', NULL, '2025-01-27 11:10:45', NULL, 6, NULL, '162.158.162.175', NULL),
	(339, '116', 12, '2025-01-27', 'आर 2255/2024/मबावि/50/आचार संहिता के पश्चात् नस्ती प्रस्तुत करने का निर्देश दिया गया है।', NULL, '2025-01-27 11:12:39', NULL, 12, NULL, '162.158.162.182', NULL),
	(340, '110', 12, '2025-01-27', 'एफ 1-30/2024/मबावि/50/आचार संहिता के पश्चात् नस्ती प्रस्तुत करने का निर्देश दिया गया है।', NULL, '2025-01-27 11:15:51', NULL, 12, NULL, '162.158.162.182', NULL),
	(341, '108', 12, '2025-01-27', 'आर 22/टीएल/2025/मबावि/50/संयुक्त सचिव 27/01/2025', NULL, '2025-01-27 11:18:30', NULL, 12, NULL, '162.158.162.183', NULL),
	(342, '96', 12, '2025-01-27', 'एफ 1-25/2011/मबावि/50/संयुक्त सचिव 24/01/2025', NULL, '2025-01-27 11:20:23', NULL, 12, NULL, '162.158.162.244', NULL),
	(343, '84', 12, '2025-01-27', 'आर 292/व्हीआईपी/2024/मबावि/50/दिनांक 27/01/2025 को संक्षेपिका सहित नस्ती संयुक्त सचिव।', NULL, '2025-01-27 11:22:32', NULL, 12, NULL, '162.158.162.244', NULL),
	(344, '117', 12, '2025-01-27', 'एफ 1-29/2022/मबावि/50/पार्ट, दिनांक 07/01/2025 द्वारा आदेश जारी किया गया है।', NULL, '2025-01-27 11:36:57', NULL, 12, NULL, '162.158.163.192', NULL),
	(345, '35', 12, '2025-01-27', 'दिनांक 21/01/2025 को नस्ती उच्च स्तर पर प्रस्तुत।', NULL, '2025-01-27 11:42:42', NULL, 12, NULL, '162.158.162.111', NULL),
	(346, '32', 12, '2025-01-27', 'एफ 12-2/2020/मबावि/50, दिनांक 10/01/2025 एवं स्मरण पत्र दिनांकं 24/01/2025 द्वारा संचालाक से स्पष्ट प्रस्ताव उपलब्ध कराने हेतु पत्र प्रेषित किया गया है। जानकारी अपेक्षित है।', NULL, '2025-01-27 12:14:26', NULL, 12, NULL, '162.158.163.4', NULL),
	(347, '24', 12, '2025-01-27', 'एफ 01-53/2024/मबावि/50, दिनांक 23/01/2025 से नस्ती आचार संहिता समाप्ति उपरांत प्रस्तुत करने का निर्देश है।', NULL, '2025-01-27 12:25:58', NULL, 12, NULL, '162.158.162.183', NULL),
	(348, '23', 12, '2025-01-27', 'आर 277/व्हीआईपी/2024/मबावि/50, दिनांक 10/01/2025 से संयुक्त सचिव।', NULL, '2025-01-27 12:30:07', NULL, 12, NULL, '162.158.162.182', NULL),
	(349, '13', 12, '2025-01-27', 'आर 292/व्हीआईपी/2024/मबावि/50, दिनांक 27/01/2025 को संयुक्त सचिव।', NULL, '2025-01-27 12:32:11', NULL, 12, NULL, '162.158.162.183', NULL),
	(350, '3', 12, '2025-01-27', 'एफ 1-12/2021/मबावि/50/पार्ट, दिनांक 21/01/2025 द्वारा संयुक्त सचिव को प्रेषित उपरांत नस्ती वापिस (कांति मैडम के पास) पटल पर।', NULL, '2025-01-27 12:39:16', NULL, 12, NULL, '162.158.162.183', NULL),
	(351, '125', 6, '2025-01-28', 'दिनांक 27.01.2025 को जानकारी प्रेषित। संशोधित पत्र। कार्यवाही पूर्ण।', NULL, '2025-01-28 04:55:05', NULL, 6, NULL, '162.158.163.129', NULL),
	(352, '131', 6, '2025-01-28', 'विषयान्तर्गत प्रस्ताव में अनुदान मद में राशि 478.26 लाख  प्रावधान हेतु नस्ती दिनांक 28.01.2025 को प्रशासकीय अनुमोदन हेतु प्रस्तुत किया गया है।', NULL, '2025-01-28 05:06:23', NULL, 6, NULL, '162.158.163.81', NULL),
	(353, '133', 5, '2025-01-28', 'नस्ती अवलोकनार्थ प्रस्तुत- अवर सचिव दिनांक 28.01.25', NULL, '2025-01-28 05:07:03', NULL, 5, NULL, '162.158.162.170', NULL),
	(354, '134', 6, '2025-01-28', 'सामाजिक विकास शाखा अंतर्गत संचालित एन.जी.ओ.का दर्पण र्पोटल के पंजीयन की संकलित जानकारी अवलोकनार्थ प्रस्तुत-सं.स-27.01.2025', NULL, '2025-01-28 05:19:55', NULL, 6, NULL, '162.158.163.176', NULL),
	(355, '133', 6, '2025-01-28', 'किसी धाराओं में परिवर्तन की आवश्यकता नहीं।नस्ती अवलोकनार्थ प्रस्तुत-सं.सं.-27.1.2025', NULL, '2025-01-28 05:23:03', NULL, 6, NULL, '162.158.162.49', NULL),
	(356, '132', 6, '2025-01-28', 'बस्तर संभाग में एनिमिया तत्यात्मक जानकारी सं.सं-27.01.2025', NULL, '2025-01-28 05:25:10', NULL, 6, NULL, '162.158.163.222', NULL),
	(357, '129', 6, '2025-01-28', 'सेवानिवृत्ति एवं न मांग न जांच न घटना प्रमाण पत्र-प्रशासकीय अनुमोदनार्थ सं.स-27.01.2025', NULL, '2025-01-28 05:29:01', NULL, 6, NULL, '162.158.163.82', NULL),
	(358, '84', 12, '2025-01-28', 'आर 292/टीएल/2024/मबावि/50, दिनांक 27/01/2025 को संयुक्त सचिव द्वारा आदर्श आचार संहिता समाप्ति उपरांत नस्ती प्रस्तुत करने का निर्देश अनुमोदित है।', NULL, '2025-01-28 05:29:27', NULL, 12, NULL, '162.158.163.130', NULL),
	(359, '127', 6, '2025-01-28', 'आदर्श आचार संहिता के पश्चात् स्थानांतरण पर विचार किये जाने हेतु नस्ती अनु.प्रस्तुत-सं.स-27.01.2025', NULL, '2025-01-28 05:32:05', NULL, 6, NULL, '162.158.163.82', NULL),
	(360, '127', 12, '2025-01-28', 'दिनांक 27/01/2025 को संयुक्त सचिव द्वारा आदर्श आचार संहिता समाप्ति उपरांत नस्ती प्रस्तुत करने का निर्देश अनुमोदित है।', NULL, '2025-01-28 05:38:56', NULL, 12, NULL, '162.158.163.91', NULL),
	(361, '128', 6, '2025-01-28', 'माननीय न्यायालय से प्राप्त आदेश आवश्यक कार्यवाही हेतु संचालक, महिला एवं बाल विकास को विभागीय पत्र दिनांक 28.01.2025 को प्रेषित किया गया।', NULL, '2025-01-28 05:50:37', NULL, 6, NULL, '172.69.165.50', NULL),
	(362, '130', 6, '2025-01-28', '1.महाधिवक्ता,बिलासपुर को अपील दायर किये जाने हेतु अभिमत पत्र प्रेषित -24.01.2025 \r\n2. 4 सप्ताह में निराकरण करने हेतु संचालक को पत्र प्रेषित-24.01.2025', NULL, '2025-01-28 06:01:14', NULL, 6, NULL, '172.69.165.11', NULL),
	(363, '130', 6, '2025-01-28', '1.महाधिवक्ता,बिलासपुर को अपील दायर किये जाने हेतु अभिमत पत्र प्रेषित -24.01.2025 \r\n2. 4 सप्ताह में निराकरण करने हेतु समन्वय समिति का प्रस्ताव 07 दिवस में उपलब्ध कराने संचालक को पत्र प्रेषित-24.01.2025', NULL, '2025-01-28 06:03:35', NULL, 6, NULL, '162.158.163.77', NULL),
	(364, '132', 5, '2025-01-28', 'पत्र प्रारूप अनुमोदनार्थ नस्ती अवर सचिव को- 28.01.2025।', NULL, '2025-01-28 06:08:57', NULL, 5, NULL, '162.158.162.67', NULL),
	(365, '119', 12, '2025-01-28', 'एफ 1-43/2023/मबावि/50, दिनांक 27/01/2025 को संयुक्त सचिव द्वारा पूर्व में क्या प्रक्रिया अपनायी गई ? अनुमोदित उपरांत नस्ती पटल पर।', NULL, '2025-01-28 06:10:13', NULL, 12, NULL, '162.158.163.176', NULL),
	(366, '129', 5, '2025-01-28', 'प्रशासकीय अनुमोदन हेतु नस्ती उच्च स्तर पर प्रस्तुत 28.01.2025।', NULL, '2025-01-28 06:14:57', NULL, 5, NULL, '162.158.162.67', NULL),
	(367, '128', 5, '2025-01-28', 'आवश्यक कार्यवाही हेतु संचा. को पत्र जारी दिनांक 28.01.2025', NULL, '2025-01-28 06:18:04', NULL, 5, NULL, '162.158.162.67', NULL),
	(368, '30', 12, '2025-01-28', 'एफ 11-02/2024/मबावि/50, दिनांक 23/01/2025  द्वारा समस्त कलेक्टर, सर्व आयुक्त/संचालक को पत्र प्रेषित किया गया है।', NULL, '2025-01-28 06:21:31', NULL, 12, NULL, '162.158.162.48', NULL),
	(369, '16', 6, '2025-01-28', 'दिनांक 24.01.2025 द्वारा संचालक, उद्योग,स्वास्थ्य सेवायें,खेल एवं युवा कल्याण,नगरीय प्रशासन एवं विकास विभाग,सर्व आयुक्त/संचालक एवं समस्त कलेक्टरों को पत्र जारी-24.01.2025', NULL, '2025-01-28 06:26:00', NULL, 6, NULL, '172.69.165.10', NULL),
	(370, '33', 12, '2025-01-28', 'एफ 1-52/2024/मबावि/50/पार्ट, दिनांक 20/01/2025  द्वारा श्रीमती सुरूचि श्याम को शुद्धि पत्र जारी किया गया है।', NULL, '2025-01-28 06:38:39', NULL, 12, NULL, '162.158.163.82', NULL),
	(371, '134', 5, '2025-01-28', 'नस्ती अवलोकनार्थ प्रस्तुत सचिव - 28.01.2025।', NULL, '2025-01-28 06:46:21', NULL, 5, NULL, '162.158.163.91', NULL),
	(372, '126', 5, '2025-01-28', 'नस्ती अवर सचिव के समक्ष प्रस्तुत - 28.01.2025।', NULL, '2025-01-28 06:49:50', NULL, 5, NULL, '162.158.163.91', NULL),
	(373, '79', 18, '2025-01-28', 'लोक आयोग प्रकरण क्रमांक 107 की जानकारी प्रेषित की जा चुकी है एवं प्रकरण क्रमांक 89/2018 की नस्ती प्रचलन में है।', NULL, '2025-01-28 06:50:35', NULL, 18, NULL, '162.158.162.49', NULL),
	(374, '124', 5, '2025-01-28', 'प्रशासकीय अनुमोदन हेतु नस्ती सचिव महोदया के समक्ष प्रस्तुत 27.01.2025।', NULL, '2025-01-28 06:52:08', NULL, 5, NULL, '162.158.163.92', NULL),
	(375, '106', 17, '2025-01-28', 'कलेक्टर जिला कोरबा को जांच हेतु पत्र प्रेषित किया गया है।', NULL, '2025-01-28 06:53:28', NULL, 17, NULL, '162.158.163.152', NULL),
	(376, '118', 5, '2025-01-28', 'आदेश जारी दिनांक  27.01.2025।', NULL, '2025-01-28 06:59:55', NULL, 5, NULL, '162.158.163.91', NULL),
	(377, '132', 6, '2025-01-28', 'दिनांक 28.01.2025 को जानकारी छ.ग. शासन, खाद्य नागरिक एवं उपभोक्ता संरक्षण विभाग को प्रेषित।', NULL, '2025-01-28 07:04:04', NULL, 6, NULL, '162.158.163.130', NULL),
	(378, '115', 5, '2025-01-28', 'पत्र प्रारूप अनुमोदनार्थ अवर सचिव दिनांक 27.01.2025', NULL, '2025-01-28 07:05:23', NULL, 5, NULL, '162.158.163.247', NULL),
	(379, '132', 6, '2025-01-28', 'कार्यवाही पूर्ण।', NULL, '2025-01-28 07:06:14', NULL, 6, NULL, '162.158.163.130', NULL),
	(380, '107', 5, '2025-01-28', 'file अनुमोदनार्थ अवर सचिव दिनांक 27.01.2025', NULL, '2025-01-28 07:15:24', NULL, 5, NULL, '162.158.162.87', NULL),
	(381, '3', 6, '2025-01-28', 'उक्त प्रकरण से संबंधित मूल नस्ती उच्च स्तर पर प्रस्तुत होने के कारण  प्रकरण समय-सीमा में अंकित होने के कारण  पार्ट नस्ती में किया गया है। मूल नस्ती वापस होने के पश्चात् इस प्रस्ताव में कार्यवाही किया जावेगा।', NULL, '2025-01-28 07:31:44', NULL, 6, NULL, '162.158.162.49', NULL),
	(382, '43', 5, '2025-01-28', 'वित्त विभाग से स्वीकृति प्राप्त आदेश जारी दिनांक 16.01.2025।', NULL, '2025-01-28 07:36:51', NULL, 5, NULL, '162.158.163.92', NULL),
	(383, '14', 5, '2025-01-28', 'स्वच्छ प्रति अनुमोदनार्थ एवं हस्ताक्षरार्थ प्रस्तुत अवर सचिव दिनांक 24.01.2025।', NULL, '2025-01-28 07:59:41', NULL, 5, NULL, '162.158.163.91', NULL),
	(384, '13', 5, '2025-01-28', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 27.01.2025।', NULL, '2025-01-28 08:01:46', NULL, 5, NULL, '162.158.163.92', NULL),
	(385, '118', 12, '2025-01-28', 'एफ 1-50/2024/मबावि/50 दिनांक 29.11.2024 द्वारा स्थानांतरण आदेश जारी। \r\nनस्ती दिनांक 24.01.2025 को स्थापना पटल पर।', NULL, '2025-01-28 08:04:10', NULL, 12, NULL, '162.158.163.221', NULL),
	(386, '130', 6, '2025-01-28', 'संचालक को स्मरण पत्र-28.01.2025', NULL, '2025-01-28 08:17:54', NULL, 6, NULL, '162.158.162.82', NULL),
	(387, '98', 1, '2025-01-28', 'प्रशासकीय अनुमोदन प्राप्त संयुक्त सचिव/28.01.2025', NULL, '2025-01-28 08:20:34', NULL, 1, NULL, '172.69.165.10', NULL),
	(388, '80', 7, '2025-01-28', 'संचालनालय द्वारा पत्र क्रमांक 13257 दिनांक 23.01.2025 द्वारा जानकारी प्रेषित की गई है।', NULL, '2025-01-28 08:21:00', NULL, 7, NULL, '162.158.163.176', NULL),
	(389, '123', 1, '2025-01-28', 'प्रशासकीय अनुमोदन प्राप्त संयुक्त सचिव/28.01.2025', NULL, '2025-01-28 08:22:16', NULL, 1, NULL, '162.158.163.77', NULL),
	(390, '80', 7, '2025-01-28', 'संचालनालय द्वारा पत्र क्रमांक 13257 दिनांक 23.01.2025 द्वारा जानकारी प्रेषित की गई है।', NULL, '2025-01-28 08:22:52', NULL, 7, NULL, '162.158.163.175', NULL),
	(391, '51', 7, '2025-01-28', 'निर्देशानुसार पत्र क्रमांक 12598 date 8.1.2025 के द्वारा प्रस्ताव प्रेषित किया गया है', NULL, '2025-01-28 08:32:07', NULL, 7, NULL, '162.158.163.175', NULL),
	(392, '51', 7, '2025-01-28', 'प्रस्ताव प्रेषित किया गया है', NULL, '2025-01-28 08:35:31', NULL, 7, NULL, '162.158.163.175', NULL),
	(393, '131', 5, '2025-01-28', 'नस्ती प्रशासकीय अनुमोदन हेतु सचिव महोदया के समक्ष प्रस्तुत दिनांक 28.01.2025।', NULL, '2025-01-28 08:39:53', NULL, 5, NULL, '162.158.162.87', NULL),
	(394, '118', 6, '2025-01-28', 'कार्यवाही पूर्ण', NULL, '2025-01-28 08:52:08', NULL, 6, NULL, '162.158.163.91', NULL),
	(395, '123', 5, '2025-01-28', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 28.01.2025।', NULL, '2025-01-28 09:03:11', NULL, 5, NULL, '162.158.163.78', NULL),
	(396, '98', 5, '2025-01-28', 'प्रशासकीय अनुमोदन प्राप्त नस्ती अवर सचिव दिनांक 28.01.2025।', NULL, '2025-01-28 09:03:35', NULL, 5, NULL, '162.158.163.78', NULL),
	(397, '73', 10, '2025-01-28', 'संचालनालय के पत्र क्रमांक 13324 दिनांक 24.01.2025 के द्वारा जिला कार्यक्रम अधिकारी रायपुर को स्मरण पत्र लेख किया गया है', NULL, '2025-01-28 09:05:45', NULL, 10, NULL, '162.158.162.67', NULL),
	(398, '56', 10, '2025-01-28', 'संचालनालय के पत्र क्रमांक 13146 दिनांक 22.01.2025 के द्वारा सचिव मबावि को जानकारी प्रेषित', NULL, '2025-01-28 09:11:54', NULL, 10, NULL, '162.158.163.81', NULL),
	(399, '107', 6, '2025-01-28', 'विभागीय सेवा भर्ती नियम में डाटा एंन्ट्री आपरेटर से सहायक ग्रेड-1 के पद पर पदोन्नति का प्रावधान है, जो त्रुटिपूर्ण होने के कारण संशोधित प्रस्ताव प्राप्त किये जाने हेतु पत्र जारी-28.01.2025', NULL, '2025-01-28 09:17:18', NULL, 6, NULL, '162.158.163.91', NULL),
	(400, '95', 7, '2025-01-28', 'संचालनालय द्वारा पत्र क्रमांक 13419 दिनांक 28.01.2025 द्वारा जानकारी प्रेषित की गई है।', NULL, '2025-01-28 09:20:27', NULL, 7, NULL, '162.158.163.151', NULL),
	(401, '62', 15, '2025-01-28', 'संचालनालय के पत्र क्र. 9070 दिनांक 22.12.2023 द्वारा SNP 2nd quarter एवं पत्र क्र. 12612 दिनांक 9.01.2025 द्वारा SAG 2023-24 का UC भारत शासन को भेजा गया।', NULL, '2025-01-28 09:53:49', NULL, 15, NULL, '162.158.163.129', NULL),
	(402, '126', 1, '2025-01-28', 'नस्ती अवलोकित। संयुक्त सचिव/28.01.2025', NULL, '2025-01-28 10:01:13', NULL, 1, NULL, '162.158.163.221', NULL),
	(403, '110', 1, '2025-01-28', 'आचार संहिता लागू। \r\nसंयुक्त सचिव/28.01.2025', NULL, '2025-01-28 10:06:56', NULL, 1, NULL, '162.158.162.66', NULL),
	(404, '101', 1, '2025-01-28', 'दिनांक 28.01.2025 को नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-28 10:13:20', NULL, 1, NULL, '162.158.162.83', NULL),
	(405, '94', 17, '2025-01-28', 'रजिस्ट्रार जनरल, माननीय उच्च न्यायालय छत्तीसगढ़, बिलासपुर बाल सम्प्रेक्षण गृह में प्रकरण की राषि स्थानांतरण की प्रक्रिया निर्धारित किये जाने के संबंध में प्रत्र प्रेषित किया गया है।', NULL, '2025-01-28 10:15:15', NULL, 17, NULL, '162.158.163.81', NULL),
	(406, '64', 8, '2025-01-28', 'Status till date', NULL, '2025-01-28 10:16:24', NULL, 8, NULL, '162.158.162.170', NULL),
	(407, '64', 8, '2025-01-28', 'Status till date', NULL, '2025-01-28 10:16:25', NULL, 8, NULL, '162.158.162.170', NULL),
	(408, '64', 8, '2025-01-28', '192 hi pending hai', NULL, '2025-01-28 10:19:18', NULL, 8, NULL, '162.158.162.171', NULL),
	(409, '44', 6, '2025-01-28', 'नवीन मद के रूप में 1000 रूपये शामिल करने हेतु वित्त विभाग को नस्ती को दिनांक 09.12.2024 को प्रेषित किया गया है।', NULL, '2025-01-28 10:55:34', NULL, 6, NULL, '162.158.162.87', NULL),
	(410, '38', 1, '2025-01-28', 'दिनांक 28.01.2025 को नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-28 11:21:10', NULL, 1, NULL, '162.158.163.248', NULL),
	(411, '8', 1, '2025-01-28', 'दिनांक 28.01.2025 को नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-28 11:24:43', NULL, 1, NULL, '162.158.162.171', NULL),
	(412, '124', 1, '2025-01-28', 'दिनांक 28.01.2025 को नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-28 11:29:02', NULL, 1, NULL, '162.158.163.91', NULL),
	(413, '137', 1, '2025-01-28', 'दिनांक 28.01.2025 को नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-28 11:31:25', NULL, 1, NULL, '162.158.163.247', NULL),
	(414, '129', 1, '2025-01-28', 'दिनांक 28.01.2025 को नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-28 11:32:56', NULL, 1, NULL, '172.69.165.50', NULL),
	(415, '122', 1, '2025-01-28', 'प्रशासकीय अनुमोदन हेतु दिनांक 28.01.2025 को नस्ती माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-28 11:35:27', NULL, 1, NULL, '162.158.162.87', NULL),
	(416, '99', 1, '2025-01-28', 'दिनांक 28.01.2025 को नस्ती वित्त विभाग को प्रस्तुत।', NULL, '2025-01-28 11:43:41', NULL, 1, NULL, '162.158.163.152', NULL),
	(417, '134', 1, '2025-01-28', 'नस्ती अवलोकित। संयुक्त सचिव/28.01.2025', NULL, '2025-01-28 11:47:05', NULL, 1, NULL, '162.158.162.86', NULL),
	(418, '44', 6, '2025-01-29', 'कार्य क्रमांक 240044 में उल्लेखित विषय को वित्त विभाग द्वारा असहमति किया जा चुका है विभाग द्वारा संचालनालय को दिनांक 08.01.2025 द्वारा अवगत कराया जा चुका है। उक्त संबंध में संचालक से पुनः प्रस्ताव प्राप्त हुआ है, जो टीएल कार्य क्रमांक 240088 में दर्ज है। जो नस्ती  दिनांक 22.01.20245 को वित्त विभाग अंकित की गई है। कार्य क्रमांक 240044 निराकृत किया जाये।', NULL, '2025-01-29 06:46:01', NULL, 6, NULL, '162.158.163.91', NULL),
	(419, '134', 5, '2025-01-29', 'नस्ती अवलोकन पश्चात अवर सचिव को प्रस्तुत दिनांक - 29.01.2025।', NULL, '2025-01-29 09:44:23', NULL, 5, NULL, '162.158.163.82', NULL),
	(420, '98', 5, '2025-01-29', 'नस्ती वित्त विभाग को अंकित किए जाने हेतु सचिव महोदया के समक्ष प्रस्तुत दिनांक- 29.01.2025।', NULL, '2025-01-29 10:27:27', NULL, 5, NULL, '172.69.165.10', NULL),
	(421, '131', 1, '2025-01-29', 'दिनांक 29.01.2025 को नस्ती प्रशासकीय अनुमोदन हेतु माननीय मंत्रीजी को प्रस्तुत।', NULL, '2025-01-29 11:33:01', NULL, 1, NULL, '162.158.162.83', NULL),
	(422, '151', 1, '2025-01-29', 'आ.जा. तथा अनु.जा.वि. विभाग से सहमति प्राप्त संयुक्त सचिव/29.01.2025', NULL, '2025-01-29 11:54:08', NULL, 1, NULL, '162.158.162.86', NULL),
	(423, '119', 6, '2025-01-29', 'संचालक को राज्य सेवा परीक्षा-2023 के माध्यम से बाल विकास परियोजना अधिकारी के सीधी भर्ती के रिक्त पदों की पूर्ति हेतु र्पकाशित विज्ञापन/भर्ती नियम में पुलिस सत्यापन के संबंघ में कक्या नियम है।?. की जानकारी हेतु पत्र प्रेषित-30.01.2025', NULL, '2025-01-29 12:28:59', NULL, 6, NULL, '162.158.163.152', NULL),
	(424, '134', 6, '2025-01-30', 'सचिव, भारत सरकार  नई दिल्ली को भेजने हेतु पत्र प्रारूप अनु.सं.सं-30.01.2025', NULL, '2025-01-30 05:25:00', NULL, 6, NULL, '162.158.162.128', NULL),
	(425, '98', 1, '2025-01-30', 'प्रशासकीय अनुमोदन पश्चात दिनांक 30.01.2025 को नस्ती वित्त विभाग प्रस्तुत।', NULL, '2025-01-30 05:46:41', NULL, 1, NULL, '172.69.165.10', NULL),
	(426, '126', 6, '2025-01-30', 'कार्यवाही पूर्ण। लंबित सूची से विलोपित किया जावें।', NULL, '2025-01-30 05:52:03', NULL, 6, NULL, '172.69.165.11', NULL),
	(427, '3', 12, '2025-01-30', 'विभाागीय पत्र दिनांक 24/12/2024 एवं स्मरण पत्र दिनांक 30/01/2025 द्वारा समयमान वेतनमान का लाभ प्रदान करने हेतु कितने सहायक संाख्यिकी अधिकारी सीधी भर्ती से पदस्थ हैं ? जो सहायक संचालक/बाल विकास परियोजना अधिकारी से सेवानिवृृत्त/कार्यरत हैं की जानकारी चाही गई है।', NULL, '2025-01-30 06:48:32', NULL, 12, NULL, '162.158.162.48', NULL),
	(428, '107', 12, '2025-01-30', 'विभाागीय सेवा भर्ती नियम में डाटा एन्ट्री आपरेटर से सहायक ग्रेड-1 के पद पर पदोन्नति का प्रावधान है, जो त्रृटिपूर्ण होने के कारण विभागीय पत्र दिनांक 30/01/2025 द्वारा  संचालक, मबावि से संशोधित अधिसूचना का हिन्दी एवं अंग्रेजी प्रारूप चाहा गया है, जो अपेक्षित है।', NULL, '2025-01-30 07:12:02', NULL, 12, NULL, '162.158.163.77', NULL),
	(429, '151', 5, '2025-01-30', 'नस्ती अवर सचिव को प्रस्तुत दिनांक 30.01.2025।', NULL, '2025-01-30 07:49:38', NULL, 5, NULL, '162.158.163.77', NULL),
	(430, '134', 5, '2025-01-30', 'सचिव, भारत सरकार, नई दिल्ली को भेजे जाने वाला पत्र प्रारूप अनुमोदनार्थ एवं हस्ता. सचिव महोदया के समक्ष प्रस्तुत दिनांक 30.01.25।', NULL, '2025-01-30 07:56:06', NULL, 5, NULL, '162.158.162.82', NULL),
	(431, '123', 5, '2025-01-30', 'आदेश प्रारूप अनुमोदनार्थ नस्ती अवर सचिव को प्रस्तुत दिनांक 30.01.2025।', NULL, '2025-01-30 07:59:50', NULL, 5, NULL, '162.158.162.83', NULL),
	(432, '119', 5, '2025-01-30', 'स्वच्छ प्रति अनुमोदित एवं हस्ताक्षरित दिनांक 30.01.2025।', NULL, '2025-01-30 08:40:20', NULL, 5, NULL, '162.158.163.82', NULL),
	(433, '14', 5, '2025-01-30', 'प्रशासकीय अनुमोदन हेतु नस्ती सचिव महोदया के समक्ष प्रस्तुत दिनांक 30.01.2025।', NULL, '2025-01-30 08:46:13', NULL, 5, NULL, '162.158.163.81', NULL),
	(434, '110', 5, '2025-01-30', 'आदर्श आचार संहिता पश्चात् नस्ती पुट-अप करने के निर्देश- अवर सचिव दिनांक 29.01.2025।', NULL, '2025-01-30 09:08:17', NULL, 5, NULL, '162.158.162.86', NULL),
	(435, '156', 1, '2025-01-30', 'आदिम जाति, अनुसूचित जाति, पि.वर्ग एवं अल्पसंख्यक वि. विभाग से सहमति प्रस्ताव।संयुक्त सचिव/30.01.2025', NULL, '2025-01-30 10:39:06', NULL, 1, NULL, '162.158.162.170', NULL),
	(436, '156', 1, '2025-01-30', 'आदिम जाति, अनुसूचित जाति, पि.वर्ग एवं अल्पसंख्यक वि. विभाग से सहमति प्राप्त।संयुक्त सचिव/30.01.2025', NULL, '2025-01-30 10:40:41', NULL, 1, NULL, '162.158.162.49', NULL),
	(437, '14', 1, '2025-01-30', 'दिनांक 30.01.2025 को नस्ती प्रशासकीय अनुमोदन हेतु माननीय मंत्रीजी के समक्ष प्रस्तुत।', NULL, '2025-01-30 10:46:20', NULL, 1, NULL, '162.158.163.91', NULL),
	(438, '119', 12, '2025-01-30', 'विभाग में बाल विकास परियोजना अधिकारी के पद पर चयनित 07 अभ्यर्थियों के संबंध में- राज्य सेवा परीक्षा 2023 के सीधी भर्ती के रिक्त पदों की पूर्ति हेतु प्रकाशित विज्ञापन/भर्ती नियम में पुलिस सत्यापन के संबंध में क्या नियम है ? की जानकारी विभागीय पत्र दिनांक 30/01/2025 द्वारा संचालक, मबावि से चाही गई है, जो अपेक्षित है।', NULL, '2025-01-30 12:20:36', NULL, 12, NULL, '162.158.162.83', NULL),
	(439, '156', 6, '2025-01-31', 'आ.जा.,अनु.जाति,पि.वर्ग एवं अल्पसंख्यक वि. से सहमति उपरांत विभाग में वापस प्राप्त-अनु.अधि.-2.31.01.2025', NULL, '2025-01-31 05:00:27', NULL, 6, NULL, '162.158.163.152', NULL),
	(440, '149', 12, '2025-01-31', 'आर 238/व्हीआईपी/2024/मबावि/50, प्रकरण परीक्षण उपरांत नस्तीबद्ध किया जाना प्रस्तावित है। दिनांक 31/01/2025 को नस्ती अवर सचिव।', NULL, '2025-01-31 06:16:35', NULL, 12, NULL, '162.158.162.67', NULL),
	(441, '135', 6, '2025-01-31', 'ई-ऑफिस के माध्यम से दिनांक 30.01.2025 को वित्त विभाग को भेजने हेतु हेतु प्रशासकीय अनुमोदन के लिए प्रस्तुत किया गया है।', NULL, '2025-01-31 06:18:03', NULL, 6, NULL, '162.158.163.91', NULL),
	(442, '123', 12, '2025-01-31', 'विभागीय आदेश दिनांक 31/01/2025 द्वारा सेवानिवृत्त आदेश जारी। कार्यवाही पूर्ण।', NULL, '2025-01-31 07:19:49', NULL, 12, NULL, '162.158.162.48', NULL),
	(443, '134', 1, '2025-01-31', 'संयुक्त सचिव/31.01.2025', NULL, '2025-01-31 08:20:54', NULL, 1, NULL, '162.158.163.152', NULL),
	(444, '143', 1, '2025-01-31', 'अवलोकन किया। संयुक्त सचिव/31.01.2025', NULL, '2025-01-31 10:24:00', NULL, 1, NULL, '172.69.165.10', NULL),
	(445, '150', 6, '2025-01-31', 'विभागीय समसंख्यक पत्र  दिनांक 16.01.2025 द्वारा 04 मिनिटस की छायाप्रति संचालनालय, मबावि को भेजकर जानकारी चाही गई थी । संचालनालय, मबावि द्वारा केवल श्रीमती पुनम श्रीवास्तव, पर्यवेक्षक की जानकारी प्राप्त हुई है । शेष जानकारी संचालनालय से अप्राप्त ।', NULL, '2025-01-31 10:41:29', NULL, 6, NULL, '162.158.162.82', NULL),
	(446, '137', 1, '2025-01-31', 'प्रशासकीय अनुमोदन प्राप्त। अवर सचिव/31.01.2025', NULL, '2025-01-31 10:50:21', NULL, 1, NULL, '162.158.162.49', NULL),
	(447, '156', 6, '2025-01-31', 'विभागीय पत्र दिनांक 31.01.2025 द्वारा स्वीकृति प्रदान की गई। कार्यवाही पूर्ण', NULL, '2025-01-31 11:41:49', NULL, 6, NULL, '162.158.162.128', NULL),
	(448, '137', 12, '2025-01-31', 'विभागीय आदेश दिनांक 31/01/2025 स्वैच्छिक सेवा निवृत्त आदेश जारी किया गया। कार्यवाही पूर्ण।', NULL, '2025-01-31 12:00:53', NULL, 12, NULL, '162.158.162.82', NULL),
	(449, '152', 12, '2025-01-31', 'प्रकरण में शासन की ओर से अपील दायर करने हेतु विभागीय अनुमोदन उपरांत नस्ती विधि विभाग को अंकित करने हेतु प्रस्तुत। दिनाकं 31/01/2025 अवर सिचव।', NULL, '2025-01-31 12:17:57', NULL, 12, NULL, '162.158.163.152', NULL),
	(450, '150', 12, '2025-01-31', 'विभागीय  स्मरण पत्र दिनाकं 31/01/2025 द्वारा संचालक, मबावि. से एकजाई जानकारी प्राप्त करने हेतु पत्र प्रेषित।', NULL, '2025-01-31 12:52:41', NULL, 12, NULL, '162.158.163.151', NULL),
	(451, '8', 1, '2025-02-03', 'प्रशासकीय अनुमोदन प्राप्त। अवर सचिव/03.02.2025', NULL, '2025-02-03 05:03:15', NULL, 1, NULL, '162.158.163.247', NULL),
	(452, '38', 1, '2025-02-03', 'प्रशासकीय अनुमोदन प्राप्त। अवर सचिव/03.02.2025', NULL, '2025-02-03 05:05:44', NULL, 1, NULL, '162.158.162.86', NULL),
	(453, '146', 5, '2025-02-03', 'आवश्यक कार्यवाही कर जांच प्रतिवेदन उपलब्ध कराने हेतु पत्र जारी किया गया था दिनांक 20.01.2025।', NULL, '2025-02-03 05:05:48', NULL, 5, NULL, '162.158.162.66', NULL),
	(454, '122', 1, '2025-02-03', 'प्रशासकीय अनुमोदन प्राप्त। अवर सचिव/03.02.2025', NULL, '2025-02-03 05:07:54', NULL, 1, NULL, '162.158.163.152', NULL),
	(455, '129', 1, '2025-02-03', 'प्रशासकीय अनुमोदन प्राप्त। अवर सचिव/03.02.2025', NULL, '2025-02-03 05:10:13', NULL, 1, NULL, '162.158.162.48', NULL),
	(456, '141', 6, '2025-02-03', 'दिनांक 30.01.2025 को मा0मंत्रीजी को प्रशासकीय अनुमोदन हेतु नस्ती अंकित है।', NULL, '2025-02-03 05:52:59', NULL, 6, NULL, '162.158.162.66', NULL),
	(457, '135', 6, '2025-02-03', 'दिनांक 30.01.2025 को मा0मंत्रीजी को प्रशासकीय अनुमोदन हेतु नस्ती अंकित है।', NULL, '2025-02-03 05:53:29', NULL, 6, NULL, '172.69.165.10', NULL),
	(458, '142', 6, '2025-02-03', 'लंबित राशि के भुगतान के लिए प्रशासकीय अनुमोदन हेतु दिनांक 31.01.2025 को  संयुक्त सचिव को  नस्ती अंकित है।', NULL, '2025-02-03 05:58:26', NULL, 6, NULL, '162.158.163.130', NULL),
	(459, '140', 6, '2025-02-03', 'ई-आफिस के माध्यम से प्रशासकीय अनुमोदन हेतु दिनांक 31.01.2025 को  संयुक्त सचिव को  नस्ती अंकित है।', NULL, '2025-02-03 06:01:04', NULL, 6, NULL, '162.158.163.176', NULL),
	(460, '134', 6, '2025-02-03', 'भारत सरकार महिला एवं बाल विकास मंत्रालय को पत्र हस्ता0 प्रेषित करने हेतु  दिनांक 03.02.2025 को  संयुक्त सचिव को  नस्ती अंकित है।', NULL, '2025-02-03 06:17:22', NULL, 6, NULL, '162.158.162.171', NULL),
	(461, '71', 4, '2025-02-03', 'Website updated', NULL, '2025-02-03 06:26:17', NULL, 4, NULL, '172.69.165.51', NULL),
	(462, '72', 4, '2025-02-03', 'does not belong to me', NULL, '2025-02-03 06:27:00', NULL, 4, NULL, '172.69.165.51', NULL),
	(463, '8', 6, '2025-02-03', 'प्रशासकीय अनुमोदन उपरांत वित्त विभाग को अंकित किये जाने हेतु दिनांक 03.02.2025 को प्रस्तुत किया गया है।', NULL, '2025-02-03 06:31:01', NULL, 6, NULL, '162.158.162.128', NULL),
	(464, '133', 6, '2025-02-03', 'प्रकरण में जानकारी मंगाये जाने हेतु संचालक, महिला एवं बाल विकास को विभागीय पत्र दिनांक 29.01.2025 प्रेषित किया गया है।', NULL, '2025-02-03 06:34:29', NULL, 6, NULL, '162.158.163.152', NULL),
	(465, '147', 12, '2025-02-03', 'प्रकरण में विभागीय जांच/लोाकायुक्त/न्यायालयीन प्रकरण संबंधी जानकारी उपलब्ध कराने हेतु संबंधित सहायक श्री अग्रवाल, स.अ.अ., को दिनांक 03/02/2025 को नस्ती अंकित की गई है।', NULL, '2025-02-03 07:15:40', NULL, 12, NULL, '162.158.163.151', NULL);

-- Dumping structure for table tlmis_testing.tbl_task_reply_trs
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_task_reply_trs: ~26 rows (approximately)
INSERT INTO `tbl_task_reply_trs` (`reply_id`, `fk_task_id`, `reply`, `reply_file`, `file_size`, `file_name`, `created_by`, `created_ipaddress`, `created_datetime`, `update_by`, `update_ipaddress`, `update_datetime`) VALUES
	(1, 3, 'This task need to be work Immidietly', NULL, NULL, NULL, 1, '162.158.163.179', '2025-02-04 07:46:47', NULL, NULL, NULL),
	(2, 2, 'jsdfhk', NULL, NULL, NULL, 1, '162.158.162.78', '2025-02-04 07:48:27', NULL, NULL, NULL),
	(3, 7, 'test', NULL, NULL, NULL, 1, '162.158.162.45', '2025-02-04 12:03:34', NULL, NULL, NULL),
	(4, 3, 'cmt', NULL, NULL, NULL, 1, '162.158.162.162', '2025-02-10 08:18:49', NULL, NULL, NULL),
	(5, 5, 'CMT', NULL, NULL, NULL, 5, '162.158.162.171', '2025-02-10 09:08:21', NULL, NULL, NULL),
	(6, 9, 'Task Done by karan', NULL, NULL, NULL, 8, '172.69.165.13', '2025-02-10 09:42:49', NULL, NULL, NULL),
	(7, 9, 'task incomplete do more work', NULL, NULL, NULL, 1, '172.69.165.12', '2025-02-10 09:45:14', NULL, NULL, NULL),
	(8, 5, 'CMT2', NULL, NULL, NULL, 5, '162.158.163.134', '2025-02-10 09:52:14', NULL, NULL, NULL),
	(9, 9, 'complete', NULL, NULL, NULL, 8, '162.158.163.133', '2025-02-10 09:55:31', NULL, NULL, NULL),
	(10, 5, 'complate', NULL, NULL, NULL, 6, '162.158.163.23', '2025-02-10 09:59:37', NULL, NULL, NULL),
	(11, 7, 'view task', NULL, NULL, NULL, 4, '162.158.162.163', '2025-02-10 10:14:25', NULL, NULL, NULL),
	(12, 11, 'Completed', NULL, NULL, NULL, 1, '162.158.163.24', '2025-02-10 10:24:18', NULL, NULL, NULL),
	(13, 13, 'done', NULL, NULL, NULL, 3, '162.158.162.162', '2025-02-11 10:05:49', NULL, NULL, NULL),
	(14, 15, 'comp', NULL, NULL, NULL, 7, '162.158.162.91', '2025-02-15 09:31:29', NULL, NULL, NULL),
	(15, 14, 'abc', NULL, NULL, NULL, 1, '162.158.163.133', '2025-02-15 09:42:13', NULL, NULL, NULL),
	(16, 18, 'comment', NULL, NULL, NULL, 3, '162.158.162.163', '2025-02-15 10:38:49', NULL, NULL, NULL),
	(17, 15, 'Reopened task', NULL, NULL, NULL, 1, '172.69.165.12', '2025-02-15 12:11:54', NULL, NULL, NULL),
	(18, 15, 'reopened now completed', NULL, NULL, NULL, 7, '162.158.162.171', '2025-02-15 12:12:27', NULL, NULL, NULL),
	(19, 19, 'TASK COMPLETED', NULL, NULL, NULL, 3, '162.158.162.163', '2025-02-18 05:04:49', NULL, NULL, NULL),
	(20, 16, 'DONE !!', NULL, NULL, NULL, 5, '162.158.163.235', '2025-02-18 05:53:20', NULL, NULL, NULL),
	(21, 20, 'IN PROGRESS', NULL, NULL, NULL, 16, '162.158.162.4', '2025-02-18 06:05:20', NULL, NULL, NULL),
	(22, 14, 'open task again', NULL, NULL, NULL, 1, '172.69.165.75', '2025-02-18 06:23:21', NULL, NULL, NULL),
	(23, 20, 'Done', NULL, NULL, NULL, 9, '162.158.162.170', '2025-02-18 06:34:01', NULL, NULL, NULL),
	(24, 20, 'OK', NULL, NULL, NULL, 16, '162.158.162.90', '2025-02-18 06:34:41', NULL, NULL, NULL),
	(25, 20, 'GREAT JOB !!', NULL, NULL, NULL, 1, '162.158.162.170', '2025-02-18 06:36:52', NULL, NULL, NULL),
	(26, 17, 'ok', NULL, NULL, NULL, 1, '172.69.165.13', '2025-02-18 06:43:28', NULL, NULL, NULL);

-- Dumping structure for table tlmis_testing.tbl_task_send_back_trs
DROP TABLE IF EXISTS `tbl_task_send_back_trs`;
CREATE TABLE IF NOT EXISTS `tbl_task_send_back_trs` (
  `td_sb_id` int NOT NULL AUTO_INCREMENT,
  `fk_map_id` int NOT NULL,
  `fk_task_id` int NOT NULL DEFAULT '0',
  `fk_dept_id` int NOT NULL DEFAULT '0',
  `is_send_back` tinyint DEFAULT '0',
  `send_back_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `send_back_status` enum('A','R','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A-Approved,R-Rejected,P-Pending',
  `send_back_by` int DEFAULT '0',
  `send_back_date` datetime DEFAULT NULL,
  `send_back_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sb_action_by` int DEFAULT '0',
  `sb_action_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sb_action_date` datetime DEFAULT NULL,
  `sb_action_ipddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`td_sb_id`) USING BTREE,
  KEY `fk_task_id` (`fk_task_id`) USING BTREE,
  KEY `fk_dept_id` (`fk_dept_id`) USING BTREE,
  KEY `td_map_id` (`fk_map_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_task_send_back_trs: ~7 rows (approximately)
INSERT INTO `tbl_task_send_back_trs` (`td_sb_id`, `fk_map_id`, `fk_task_id`, `fk_dept_id`, `is_send_back`, `send_back_remark`, `send_back_status`, `send_back_by`, `send_back_date`, `send_back_ipaddress`, `sb_action_by`, `sb_action_remark`, `sb_action_date`, `sb_action_ipddress`) VALUES
	(1, 9, 9, 11, 1, 'done', 'A', 5, '2025-02-10 15:14:10', '162.158.163.134', 1, 'great', '2025-02-11 12:34:37', '162.158.162.90'),
	(2, 15, 11, 5, 1, 'Done task', 'A', 3, '2025-02-10 15:52:37', '172.69.165.13', 1, NULL, '2025-02-18 13:17:30', '162.158.163.236'),
	(3, 19, 14, 2, 1, 'Send back', 'A', 10, '2025-02-12 11:38:25', '172.69.165.12', 1, 'do', '2025-02-18 13:17:15', '162.158.163.236'),
	(4, 22, 16, 1, 1, NULL, 'A', 7, '2025-02-15 15:12:45', '162.158.162.90', 1, 'ok', '2025-02-18 13:16:49', '162.158.163.235'),
	(5, 24, 16, 14, 1, 'jjjjj', 'P', 11, '2025-02-15 15:47:48', '162.158.162.171', 0, NULL, NULL, NULL),
	(6, 28, 17, 14, 1, 'ooooooooooooo', 'P', 11, '2025-02-15 15:53:29', '172.69.165.24', 0, NULL, NULL, NULL),
	(7, 26, 17, 12, 1, 'DONE!', 'P', 3, '2025-02-18 10:35:36', '172.69.165.13', 0, NULL, NULL, NULL);

-- Dumping structure for table tlmis_testing.tbl_task_user_map
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.tbl_task_user_map: ~33 rows (approximately)
INSERT INTO `tbl_task_user_map` (`map_id`, `fk_task_id`, `fk_dept_id`, `fk_user_id`, `created_by`, `created_at`, `created_ip`, `is_send_back`, `send_back_remark`, `send_back_status`, `send_back_by`, `send_back_date`, `send_back_ipaddress`, `sb_action_by`, `sb_action_remark`, `sb_action_date`, `sb_action_ipddress`, `is_viewed`) VALUES
	(1, 1, 5, 3, 1, '2025-02-04 07:38:16', '162.158.163.206', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(2, 2, 5, 3, 1, '2025-02-04 07:40:20', '162.158.163.205', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(3, 3, 5, 3, 1, '2025-02-04 07:42:57', '172.69.165.75', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(4, 4, 7, 6, 1, '2025-02-04 11:47:16', '162.158.162.50', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(5, 5, 11, 5, 1, '2025-02-04 11:50:14', '162.158.162.44', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(6, 6, 5, 3, 1, '2025-02-04 11:52:15', '162.158.162.45', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(7, 7, 14, 4, 1, '2025-02-04 11:53:39', '162.158.163.179', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(8, 8, 1, 7, 1, '2025-02-05 05:19:30', '162.158.162.79', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(9, 9, 11, 5, 1, '2025-02-05 05:24:04', '162.158.162.78', 1, 'done', 'A', 5, '2025-02-10 15:14:10', '162.158.163.134', 1, 'great', '2025-02-11 12:34:37', '162.158.162.90', 1),
	(10, 10, 1, 7, 1, '2025-02-05 05:29:57', '162.158.162.45', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(11, 10, 5, 3, 1, '2025-02-07 07:36:19', '172.69.165.75', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(13, 9, 10, 8, 5, '2025-02-10 09:39:17', '162.158.162.162', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(14, 5, 7, 6, 5, '2025-02-10 09:53:10', '162.158.163.23', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(15, 11, 5, 3, 1, '2025-02-10 10:20:37', '162.158.162.163', 1, 'Done task', 'A', 3, '2025-02-10 15:52:37', '172.69.165.13', 1, NULL, '2025-02-18 13:17:30', '162.158.163.236', 1),
	(16, 12, 1, 7, 1, '2025-02-11 09:35:18', '162.158.163.134', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(17, 12, 2, 10, 1, '2025-02-11 09:35:18', '162.158.163.134', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(18, 13, 12, 3, 1, '2025-02-11 10:04:21', '162.158.163.134', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(19, 14, 2, 10, 1, '2025-02-12 06:06:27', '162.158.163.24', 1, 'Send back', 'A', 10, '2025-02-12 11:38:25', '172.69.165.12', 1, 'do', '2025-02-18 13:17:15', '162.158.163.236', 1),
	(20, 12, 2, 9, 10, '2025-02-12 07:07:38', '162.158.163.134', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(21, 15, 1, 7, 1, '2025-02-15 09:25:49', '172.69.165.25', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(22, 16, 1, 7, 1, '2025-02-15 09:38:17', '162.158.162.163', 1, NULL, 'A', 7, '2025-02-15 15:12:45', '162.158.162.90', 1, 'ok', '2025-02-18 13:16:49', '162.158.163.235', 1),
	(24, 16, 14, 11, 7, '2025-02-15 10:05:29', '162.158.163.155', 1, 'jjjjj', 'P', 11, '2025-02-15 15:47:48', '162.158.162.171', 0, NULL, NULL, NULL, 1),
	(25, 16, 11, 5, 7, '2025-02-15 10:14:02', '162.158.162.170', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(26, 17, 12, 3, 1, '2025-02-15 10:19:42', '172.69.165.13', 1, 'DONE!', 'P', 3, '2025-02-18 10:35:36', '172.69.165.13', 0, NULL, NULL, NULL, 1),
	(27, 17, 2, 9, 3, '2025-02-15 10:21:41', '172.69.165.24', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(28, 17, 14, 11, 3, '2025-02-15 10:21:41', '172.69.165.24', 1, 'ooooooooooooo', 'P', 11, '2025-02-15 15:53:29', '172.69.165.24', 0, NULL, NULL, NULL, 1),
	(29, 18, 1, 7, 1, '2025-02-15 10:36:10', '162.158.162.91', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(30, 18, 2, 10, 1, '2025-02-15 10:36:10', '162.158.162.91', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(31, 18, 12, 3, 1, '2025-02-15 10:37:15', '162.158.163.23', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(32, 19, 12, 3, 1, '2025-02-18 04:58:55', '162.158.163.133', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(33, 19, 14, 11, 3, '2025-02-18 05:03:47', '162.158.162.162', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0),
	(34, 20, 4, 16, 1, '2025-02-18 05:31:55', '162.158.162.118', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(43, 20, 2, 9, 16, '2025-02-18 06:30:47', '162.158.162.162', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1);

-- Dumping structure for table tlmis_testing.tbl_tl_creation
DROP TABLE IF EXISTS `tbl_tl_creation`;
CREATE TABLE IF NOT EXISTS `tbl_tl_creation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int DEFAULT NULL,
  `tl_date` date DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `create_ip` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table tlmis_testing.tbl_tl_creation: ~39 rows (approximately)
INSERT INTO `tbl_tl_creation` (`id`, `fk_task_id`, `tl_date`, `create_date`, `create_by`, `create_ip`) VALUES
	(1, 106, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(2, 96, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(3, 95, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(4, 94, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(5, 93, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(6, 92, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(7, 91, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(8, 81, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(9, 80, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(10, 79, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(11, 78, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(12, 77, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(13, 76, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(14, 75, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(15, 74, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(16, 73, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(17, 72, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(18, 71, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(19, 70, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(20, 69, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(21, 68, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(22, 67, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(23, 66, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(24, 65, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(25, 64, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(26, 63, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(27, 62, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(28, 61, '2025-01-22', '2025-01-22 00:21:31', 1, '162.158.162.48'),
	(29, 60, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(30, 59, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(31, 58, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(32, 57, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(33, 56, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(34, 52, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(35, 51, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(36, 50, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(37, 49, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(38, 2, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48'),
	(39, 1, '2025-01-22', '2025-01-22 00:21:32', 1, '162.158.162.48');

-- Dumping structure for table tlmis_testing.tbl_users
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;

-- Dumping data for table tlmis_testing.tbl_users: ~16 rows (approximately)
INSERT INTO `tbl_users` (`user_id`, `full_name`, `mobile`, `email`, `username`, `password`, `salt`, `district_lgd_code`, `is_active`, `preferences`, `remember_token`, `is_password_changed`, `fk_role_id`) VALUES
	(1, 'Demo L1', '8888888888', NULL, 'test_L1', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, '0oBA4ZxlQdmFRc9u6soSpSH9Edu0xXsaLeRj5rkBTPEUz3ryNwaaP2aaOKdy', 1, 0),
	(2, 'Operator', '', NULL, 'test_operator', 'b449ee3a415f6f45d9bd0b3a090bed02aad26270da7102e9f1bdc84033215e3d5e4b7620d5aa8314a61890c517b6fc9556f226d0a438334b8a887e33f0147782', 'S7BAGGT', NULL, 1, NULL, NULL, 1, 3),
	(3, 'Sakshi Verma', '9698554713', 'sakshiverma123@gmail.com', 'TL-test-00003', '70910296921e24a9f990f6344d9b8b1f0dbfbb3bbe202f93b178cf0f023d987046297326e69b72add3a69908c2be2cac65d2868b0621259358ef94d36e7361e8', 'LX2Tdit', NULL, 1, NULL, NULL, 1, 0),
	(4, 'Aniket Dubey', '9698471586', 'aniketdubey2450@gmail.com', 'TL-test-00004', 'cc1ebbc8044e7220b4d21f98deafa88661aeb9237033e523673460c2ec9347c04ee70efa26364ac27bfa9a8d74e4ee74194cc92b78adcf1c1b45540d7795b1a7', 'Bn6KJZP', NULL, 1, NULL, NULL, 1, 0),
	(5, 'Anurag Mishra', '9738447743', 'mishraanu97@gmail.com', 'TL-test-00005', 'eeb5d9ce68dbd41755cb0618a85afe3a620126c8f852679aa34b59defb9c2830818ff12aec06e4d528a0eb9a93ef1528e6847378811f70ed609b81b74763b65c', '5Yw6dO5', NULL, 1, NULL, NULL, 1, 0),
	(6, 'Manoj Kumar Sharma', '6261888753', 'manojsharma23@gmail.com', 'TL-test-00006', 'e25b64da880abd5abfce5053038c03fb6aa8a1ed2b6baf5b1cff202f123fa177dae397610eb62a938242086fa17d07741a329e41b561591734351ca95f9a5a5f', 'DjdXL3C', NULL, 1, NULL, 'UJnt3fs5zkMyfr3mQcvGe9BIChZ2e8x6aRp3oCus7gO4dAwsIFgCStZDId3e', 1, 0),
	(7, 'Mrinalika Singh', '7998998998', NULL, 'TL-test-00007', 'e1f8c566fa994e59cd6b6c2da368aa61ab03e3463f25f813f2946b0fd32568cbc29d8621f9a00b7d54dc8d9a81184cd00c091ee5cae833eb5f3ab704b3eb1dcd', 'nWXKjZX', NULL, 1, NULL, NULL, 1, 0),
	(8, 'karan singh', '8822992273', 'karan@gmail.com', 'TL-test-00008', '0cf247c866a79031071cadc7a1b0dce266a6f915484c4cf8c0b6f6740f77499fb3e141a00f95c7537b2cbbfbb4d15aeb352de2a1ac4beaad74e5f0a4d9289fad', '3v8J8Gz', NULL, 1, NULL, NULL, 1, 0),
	(9, 'Nidhi Dubey', '6268947830', 'nidhi@gmail.com', 'TL-test-00009', 'f4923e500c045730e1b63ae4f0dc7fabb87ef3cb084d9aeab4a723ad52ffe1a8d40b14900b8a1870b6b9604b8f43c1302d96da9e986f5c3454742181579ce8c5', 'IsZKS3T', NULL, 1, NULL, NULL, 1, 0),
	(10, 'Deepesh', '6261920444', 'deepesh@gmail.com', 'TL-test-00010', '7d352cc206c490f3b91fde23b95a91c6f37c970b3b1b3d710e57d319dba1e159a165bcf993a2aca793b295e8429ca0ff95794e8a7dfebe807ba6d4bedbfa08df', 'dGozRYL', NULL, 1, NULL, 'wcklTWVdNLg413Xey4QM45Isyjr2RZh3c2KK3LJJJ9Jvsda3085pGobIaiMZ', 1, 0),
	(11, 'sonu', '8893729472', 'sonu88937@gmail.com', 'TL-test-00011', '4be9556bbb44d553769bd102279e871a853510520d3497a9516b51c4c49084c45a60edd52df1ccbe865b029bce24136784b207809f8ec7c789d3a0ecf7166c90', '50ZvugT', NULL, 1, NULL, NULL, 1, 0),
	(12, 'Ritik babu', '9273927484', 'ritik9273@gmal.com', 'TL-test-00012', '94cd69220dd59273ed6307a5537b572aeea31ecbbd324a542f81c07b2916227e8c55263b6603295098c093003373930677012f6674f77cae23b0831aaf15efb1', 'YYjZ3xB', NULL, 1, NULL, NULL, 0, 0),
	(13, 'Sohan manikpuri', '6238374478', 'sohan6238@g.com', 'TL-test-00013', '48df8f21ca44e51afc88911f3ee4e532de4acb0648a8737f2fb2b1b86014c391d8c636a621f837808ca88a1bdd4bea0e0b417391f355dcdcaf88049f19bb5c96', 'zvD4m5V', NULL, 1, NULL, NULL, 0, 0),
	(14, 'Mohit Kurre', '8923847430', 'mohit8923@gmail.com', 'TL-test-00014', '4c2b3cad3e243efb23c229e524ca18a4705bc3a7a562b75e3d42e2413d9c1b6c76ebdbf9bb2da712d3432c7528f355fb70e686893f9e507fcec00d4919761c26', 'A4u7Tai', NULL, 1, NULL, NULL, 0, 0),
	(15, 'Rajiv mahant', '8743923794', 'rajiv8743@gmail.com', 'TL-test-00015', '1bdad3ea757ecc4a07f467b00782a16f808bd0be7bb243ceea05c15344d71b17de6611becb11188ecabe33a953a1b4e5e0abafcc4d3c36f03ff2ade8e9299dcb', '221Emfd', NULL, 1, NULL, NULL, 0, 0),
	(16, 'Manoj Sahu', '9876543210', 'sahu23@gmail.com', 'TL-test-00016', 'ca17188bf95aa3edbe20202565dbffc91b262fb4e4182ad46ec0773bf0223f955a9205ac01d34164912c2a6ec0e147d44eccbdfd0f7f99dff4a000ff6689ce83', 'n8XwQ5w', NULL, 1, NULL, NULL, 1, 0);

-- Dumping structure for table tlmis_testing.tbl_user_map
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tbl_user_map: 28 rows
/*!40000 ALTER TABLE `tbl_user_map` DISABLE KEYS */;
INSERT INTO `tbl_user_map` (`user_map_id`, `fk_user_id`, `fk_level_id`, `fk_department_id`, `fk_designation_id`, `remark`, `is_active`, `create_by`, `update_by`, `create_datetime`, `update_datetime`, `create_ipaddress`, `update_ipaddress`) VALUES
	(1, 1, 1, NULL, 1, NULL, 1, NULL, NULL, '2024-12-18 12:20:19', '2025-01-18 15:37:14', '::1', NULL),
	(2, 2, NULL, NULL, 8, NULL, 1, NULL, NULL, '2025-01-16 16:45:27', '2025-02-03 06:46:03', '127.0.0.1', NULL),
	(3, 3, 2, 5, 21, NULL, 0, 1, 1, '2025-02-04 07:23:13', '2025-02-11 08:03:52', '162.158.16', '172.69.165'),
	(4, 4, 3, 1, 1, NULL, 0, 1, 1, '2025-02-04 07:43:41', '2025-02-04 11:35:30', '162.158.16', '162.158.16'),
	(6, 4, 3, 13, 1, NULL, 0, 1, 1, '2025-02-04 09:41:24', '2025-02-04 11:35:30', '162.158.16', '162.158.16'),
	(7, 4, 3, 14, 1, NULL, 1, 1, 1, '2025-02-04 09:42:17', '2025-02-04 11:35:30', '162.158.16', '162.158.16'),
	(8, 5, 3, 11, 22, NULL, 1, 1, NULL, '2025-02-04 11:36:35', NULL, '162.158.16', NULL),
	(9, 6, 5, 7, 23, NULL, 0, 1, 5, '2025-02-04 11:40:30', '2025-02-11 07:59:55', '162.158.16', '162.158.16'),
	(10, 7, 2, 1, 24, NULL, 1, 1, NULL, '2025-02-04 17:53:15', NULL, '162.158.16', NULL),
	(11, 8, 5, 10, 25, NULL, 1, 5, NULL, '2025-02-10 09:31:03', NULL, '172.69.165', NULL),
	(12, 9, 4, 2, 26, NULL, 1, 3, NULL, '2025-02-10 10:33:50', NULL, '162.158.16', NULL),
	(13, 6, 5, 9, 23, NULL, 1, 1, NULL, '2025-02-11 07:59:55', NULL, '162.158.16', NULL),
	(14, 3, 2, 12, 21, NULL, 1, 1, NULL, '2025-02-11 08:03:52', NULL, '162.158.16', NULL),
	(15, 10, 2, 1, 21, NULL, 0, 1, 1, '2025-02-11 08:25:10', '2025-02-11 10:56:15', '162.158.16', '172.69.165'),
	(16, 10, 2, 2, 21, NULL, 1, 1, 1, '2025-02-11 08:25:10', '2025-02-11 08:37:36', '162.158.16', '172.69.165'),
	(17, 5, 3, 12, 22, NULL, 1, 1, NULL, '2025-02-11 09:52:41', NULL, '172.69.165', NULL),
	(18, 11, 3, 14, 21, NULL, 1, 1, NULL, '2025-02-11 10:10:35', NULL, '162.158.16', NULL),
	(19, 12, 4, 14, 25, NULL, 1, 1, NULL, '2025-02-11 10:11:52', NULL, '162.158.16', NULL),
	(20, 13, 2, 14, 25, NULL, 1, 1, NULL, '2025-02-11 10:14:25', NULL, '172.69.165', NULL),
	(21, 14, 2, 4, 21, NULL, 1, 1, NULL, '2025-02-11 10:16:48', NULL, '162.158.16', NULL),
	(22, 15, 2, 2, 1, NULL, 1, 1, NULL, '2025-02-11 10:19:28', NULL, '162.158.16', NULL),
	(23, 15, 2, 4, 1, NULL, 1, 1, NULL, '2025-02-11 10:19:28', NULL, '162.158.16', NULL),
	(24, 15, 2, 5, 1, NULL, 1, 1, NULL, '2025-02-11 10:19:28', NULL, '162.158.16', NULL),
	(25, 15, 2, 10, 1, NULL, 1, 1, NULL, '2025-02-11 10:19:28', NULL, '162.158.16', NULL),
	(26, 15, 2, 11, 1, NULL, 1, 1, NULL, '2025-02-11 10:19:28', NULL, '162.158.16', NULL),
	(27, 16, 2, 4, 21, NULL, 1, 1, 1, '2025-02-18 05:16:01', '2025-02-18 05:16:56', '162.158.16', '162.158.16'),
	(28, 16, 2, 6, 21, NULL, 1, 1, 1, '2025-02-18 05:21:45', '2025-02-18 06:57:49', '162.158.16', '162.158.16'),
	(29, 16, 2, 13, 21, NULL, 1, 1, 1, '2025-02-18 06:57:49', '2025-02-18 06:57:49', '162.158.16', '162.158.16');
/*!40000 ALTER TABLE `tbl_user_map` ENABLE KEYS */;

-- Dumping structure for table tlmis_testing.tbl_user_maps
DROP TABLE IF EXISTS `tbl_user_maps`;
CREATE TABLE IF NOT EXISTS `tbl_user_maps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `current_user_id` int NOT NULL,
  `previous_user_id` int DEFAULT NULL,
  `district_lgd_code` smallint DEFAULT NULL,
  `block_ulb_lgd_code` mediumint DEFAULT NULL,
  `rural_urban` enum('R','U') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_district_lgd_code` (`district_lgd_code`) USING BTREE,
  KEY `idx_block_ulb_lgd_code` (`block_ulb_lgd_code`) USING BTREE,
  KEY `idx_rural_urban` (`rural_urban`) USING BTREE,
  KEY `idx_is_active` (`is_active`) USING BTREE,
  KEY `tbl_user_maps_current_user_id_index` (`current_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table tlmis_testing.tbl_user_maps: ~2 rows (approximately)
INSERT INTO `tbl_user_maps` (`id`, `current_user_id`, `previous_user_id`, `district_lgd_code`, `block_ulb_lgd_code`, `rural_urban`, `is_active`) VALUES
	(1, 1, 0, 387, NULL, NULL, 1),
	(2, 2, 0, 387, NULL, NULL, 1);

-- Dumping structure for table tlmis_testing.tbl_work_type_log
DROP TABLE IF EXISTS `tbl_work_type_log`;
CREATE TABLE IF NOT EXISTS `tbl_work_type_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_id` int DEFAULT NULL,
  `work_type` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT (now()),
  `create_by` int DEFAULT NULL,
  `create_ip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table tlmis_testing.tbl_work_type_log: ~0 rows (approximately)

-- Dumping structure for table tlmis_testing.tl_reviews
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tl_reviews: ~6 rows (approximately)
INSERT INTO `tl_reviews` (`id`, `tl_date`, `tl_time`, `tl_title`, `tl_desc`, `tl_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`, `postponed_date`, `postponed_time`) VALUES
	(1, '2025-02-04', '13:25:00', 'Review Task1', 'Reporting Review Task1', 'CMP', '2025-02-04 13:24:49', '2025-02-04 13:27:15', 1, 1, '162.158.162.45', '162.158.163.205', NULL, NULL),
	(2, '2025-02-04', '14:26:00', 'Review Done of Middleware', 'All good.', 'CMP', '2025-02-04 14:27:40', '2025-02-04 14:31:33', 1, 1, '162.158.162.50', '162.158.162.51', NULL, NULL),
	(3, '2025-02-04', '14:35:00', 'Task 2 Review', 'Need to make correction.', 'SCH', '2025-02-04 14:36:25', '2025-02-11 15:27:37', 1, 1, '162.158.162.122', '162.158.162.162', '2025-02-04', '14:40:00'),
	(4, '2025-02-12', '15:26:00', 'review task', 'none', 'SCH', '2025-02-11 15:26:50', '2025-02-11 15:26:50', 1, NULL, '162.158.163.133', '', NULL, NULL),
	(5, '2025-02-11', '17:43:00', 'fyf', 'tufkuj', 'SCH', '2025-02-11 17:47:48', '2025-02-11 17:47:48', 1, NULL, '162.158.162.171', '', NULL, NULL),
	(6, '2025-02-18', '12:17:00', NULL, NULL, 'SCH', '2025-02-18 12:18:39', '2025-02-18 12:18:39', 1, NULL, '162.158.162.90', '', NULL, NULL);

-- Dumping structure for table tlmis_testing.tl_review_task_map
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_testing.tl_review_task_map: ~6 rows (approximately)
INSERT INTO `tl_review_task_map` (`id`, `fk_tl_review_id`, `fk_task_id`, `status`, `remarks`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(1, 1, 2, 'NOT-REVIEWED', NULL, '2025-02-04 13:24:49', '2025-02-04 13:24:49', 1, NULL, '162.158.162.45', ''),
	(2, 2, 1, 'REVIEWED', 'All the functions are perfactly working', '2025-02-04 14:27:40', '2025-02-04 14:28:25', 1, 1, '162.158.162.50', '162.158.163.179'),
	(3, 3, 3, 'NOT-REVIEWED', NULL, '2025-02-04 14:36:25', '2025-02-04 14:36:48', 1, 1, '162.158.162.122', '162.158.162.123'),
	(4, 4, 8, 'REVIEWED', 'done', '2025-02-11 15:26:50', '2025-02-11 17:48:28', 1, 1, '162.158.163.133', '162.158.162.171'),
	(5, 5, 12, 'NOT-REVIEWED', NULL, '2025-02-11 17:47:48', '2025-02-11 17:47:48', 1, NULL, '162.158.162.171', ''),
	(6, 6, 12, 'REVIEWED', NULL, '2025-02-18 12:18:39', '2025-02-18 13:20:20', 1, 1, '162.158.162.90', '162.158.163.235');

-- Dumping structure for table tlmis_testing.users
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

-- Dumping data for table tlmis_testing.users: ~0 rows (approximately)

-- Dumping structure for trigger tlmis_testing.generate_work_no
DROP TRIGGER IF EXISTS `generate_work_no`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `generate_work_no` BEFORE INSERT ON `tbl_task_details` FOR EACH ROW BEGIN
DECLARE next_id INT;
SELECT IFNULL(MAX(id), 0) + 1 INTO next_id FROM tbl_task_details;
    SET NEW.work_no = CONCAT(24,LPAD(next_id, 4, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_testing.trg_before_delete_tbl_user_map
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

-- Dumping structure for trigger tlmis_testing.trg_before_update_master_designation
DROP TRIGGER IF EXISTS `trg_before_update_master_designation`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_before_update_master_designation` BEFORE UPDATE ON `master_designation` FOR EACH ROW INSERT into log_master_designation(designation_id, designation, is_active)
            values (old.designation_id, old.designation, old.is_active)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_testing.trg_before_update_master_issuer_types
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

-- Dumping structure for trigger tlmis_testing.trg_before_update_tbl_users
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

-- Dumping structure for trigger tlmis_testing.trg_task_user_map_before_delete
DROP TRIGGER IF EXISTS `trg_task_user_map_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_task_user_map_before_delete` BEFORE DELETE ON `tbl_task_user_map` FOR EACH ROW INSERT INTO log_task_user_map_before_delete
	(map_id, fk_task_id, fk_dept_id,fk_user_id, created_by, created_at, created_ip)
	VALUES (OLD.map_id, OLD.fk_task_id, OLD.fk_dept_id, OLD.fk_user_id, OLD.created_by, 
	OLD.created_at, OLD.created_ip)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_testing.trg_tbl_task_before_update
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

-- Dumping structure for trigger tlmis_testing.trg_tbl_task_files_before_delete
DROP TRIGGER IF EXISTS `trg_tbl_task_files_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_tbl_task_files_before_delete` BEFORE DELETE ON `tbl_task_files` FOR EACH ROW INSERT INTO log_tbl_task_files_before_delete
	(file_id, fk_task_id, file, file_name, file_size)
	VALUES (OLD.file_id, OLD.fk_task_id, OLD.file, OLD.file_name, OLD.file_size)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_testing.work_type_log
DROP TRIGGER IF EXISTS `work_type_log`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `work_type_log` BEFORE UPDATE ON `master_worktype` FOR EACH ROW BEGIN
 IF NEW.work_type <> OLD.work_type THEN
        INSERT INTO `tbl_work_type_log` 
        (
            `work_id`,
            `work_type`,
            `create_date`,
            `create_by`,
            `create_ip`
        )
        VALUES
        (
            OLD.id,
            NEW.work_type,
            NOW(),
            OLD.create_by,
            OLD.create_ip
        );
    END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
