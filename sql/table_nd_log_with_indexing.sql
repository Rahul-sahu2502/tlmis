-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table tlmis_main_db.log_master_department
DROP TABLE IF EXISTS `log_master_department`;
CREATE TABLE IF NOT EXISTS `log_master_department` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `dept_id` int DEFAULT NULL,
  `department_hin` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_eng` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  `log_create_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `dept_id` (`dept_id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_master_department: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.log_master_designation
DROP TABLE IF EXISTS `log_master_designation`;
CREATE TABLE IF NOT EXISTS `log_master_designation` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `designation_id` int NOT NULL,
  `designation` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `log_create_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `designation_id` (`designation_id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_master_designation: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.log_master_doc_types
DROP TABLE IF EXISTS `log_master_doc_types`;
CREATE TABLE IF NOT EXISTS `log_master_doc_types` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `name_hi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_master_doc_types: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.log_master_issuer_types
DROP TABLE IF EXISTS `log_master_issuer_types`;
CREATE TABLE IF NOT EXISTS `log_master_issuer_types` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `name_hi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_master_issuer_types: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.log_tbl_task
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
  `status` enum('P','C','I') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'I' COMMENT 'P=Pending, C=Completed, I= Inprogress',
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_tbl_task: ~4 rows (approximately)
INSERT INTO `log_tbl_task` (`log_task_id`, `task_id`, `title`, `fk_task_priority_id`, `fk_task_category_id`, `entry_date`, `due_date`, `description`, `status`, `remark`, `ref_docs`, `has_file`, `created_by`, `created_date`, `created_ipaddress`, `updated_by`, `updated_date`, `updated_ipaddress`, `is_replied`, `log_created_date`) VALUES
	(1, 1, 'Testing', 1, 3, '2025-01-02', '2025-01-02', 'ok', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:10:29', '127.0.0.1', NULL, NULL, NULL, 'N', '2025-01-04 22:37:41'),
	(2, 6, 'OKerter', 1, 1, '2025-01-04', '2025-01-16', 'NA', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:47:53', '127.0.0.1', NULL, NULL, NULL, 'N', '2025-01-04 22:49:58'),
	(3, 6, 'OKerter', 1, 1, '2025-01-04', '2025-01-16', 'NA NA', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:47:53', '127.0.0.1', 2, '2025-01-04 22:49:58', '127.0.0.1', 'N', '2025-01-04 23:47:13'),
	(4, 6, 'OKerter', 1, 1, '2025-01-04', '2025-01-16', 'NA NA', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:47:53', '127.0.0.1', 2, '2025-01-04 23:47:13', '127.0.0.1', 'N', '2025-01-04 23:47:21');

-- Dumping structure for table tlmis_main_db.log_tbl_task_dept_map_before_delete
DROP TABLE IF EXISTS `log_tbl_task_dept_map_before_delete`;
CREATE TABLE IF NOT EXISTS `log_tbl_task_dept_map_before_delete` (
  `log_td_map_id` int NOT NULL AUTO_INCREMENT,
  `td_map_id` int DEFAULT NULL,
  `fk_task_id` int NOT NULL DEFAULT '0',
  `fk_dept_id` int NOT NULL DEFAULT '0',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_size` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_by` int NOT NULL DEFAULT '0',
  `updated_date` datetime DEFAULT NULL,
  `updated_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_create_datetime` datetime DEFAULT (now()),
  PRIMARY KEY (`log_td_map_id`) USING BTREE,
  KEY `td_map_id` (`td_map_id`),
  KEY `fk_task_id` (`fk_task_id`),
  KEY `fk_dept_id` (`fk_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_tbl_task_dept_map_before_delete: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.log_tbl_task_files_before_delete
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_tbl_task_files_before_delete: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.log_tbl_users
DROP TABLE IF EXISTS `log_tbl_users`;
CREATE TABLE IF NOT EXISTS `log_tbl_users` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_lgd_code` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `tbl_users_pk` (`username`),
  UNIQUE KEY `tbl_users_pk_2` (`mobile`),
  UNIQUE KEY `tbl_users_pk_3` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_tbl_users: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.master_department
DROP TABLE IF EXISTS `master_department`;
CREATE TABLE IF NOT EXISTS `master_department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `department_hin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_eng` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `tbl_departments_is_active_IDX` (`is_active`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_department: ~41 rows (approximately)
INSERT INTO `master_department` (`dept_id`, `department_hin`, `department_eng`, `is_active`) VALUES
	(1, 'गृह विभाग', 'Home Department', 1),
	(2, 'वित्त विभाग', 'Finance Department', 1),
	(3, 'श्रम विभाग', 'Labour Department', 1),
	(4, 'कृषि एवं किसान कल्याण विभाग', 'Agriculture Department', 1),
	(5, 'स्वास्थ्य एवं परिवार कल्याण विभाग', 'Health and Family Welfare Department', 1),
	(6, 'उद्योग विभाग', 'Industry Department', 1),
	(7, 'नगरीय प्रशासन विभाग', 'Urban Administration and Development', 1),
	(8, 'लोक निर्माण विभाग', 'Public Welfare Department', 1),
	(9, 'उर्जा विभाग', 'Energy Department', 1),
	(10, 'स्कूल शिक्षा / सर्व शिक्षा अभियान', 'School Education Department', 1),
	(11, 'उच्च शिक्षा विभाग', 'Higher Education Department', 1),
	(12, 'तकनीकी शिक्षा विभाग', 'Technical Education Department', 1),
	(13, 'वन विभाग', 'Forest Department', 1),
	(14, 'पशुधन विकास विभाग', 'Animal Husbandry Department', 1),
	(15, 'खाद्य एवं नागरिक आपूर्ति निगम', 'Food,Civil Supplies & Consumer Protection Department', 1),
	(16, 'महिला एवं बाल विकास विभाग', 'Department of Women and Child Development', 1),
	(17, 'खनिज', 'Mining Department', 1),
	(18, 'राजस्व विभाग', 'Revenue Department', 1),
	(19, 'आदिम जाति कल्याण', 'Tribal Department', 1),
	(20, 'पंचायत एवं ग्रामीण विकास विभाग', 'Panchayat and Rural Development Department', 1),
	(21, 'इलेक्ट्रॉनिक्स एवं सूचना प्रौद्योगिकी', 'Department of Electronics and IT', 1),
	(22, 'समाज कल्याण विभाग', 'Social Welfare Department', 1),
	(23, 'परिवहन विभाग', 'Transport Department', 1),
	(24, 'लोक स्वास्थ्य यांत्रिकी विभाग', 'Public Health Engineering Department', 1),
	(25, 'खेल एवं युवा कल्याण विभाग', 'Sports and Youth Welfare Department', 1),
	(26, 'जनसंपर्क', 'Department of Public Relations', 1),
	(27, 'आवास एवं पर्यावरण विभाग', 'Housing and Environment Department', 1),
	(28, 'जल संसाधन विभाग', 'Water Resource Department', 1),
	(29, 'ग्रामोद्योग', 'Rural Industries', 1),
	(30, 'पर्यटन एवं संस्कृति विभाग', 'Tourism and Cultural Department', 1),
	(31, 'वाणिज्यिक कर', 'Commercial Tax Department', 1),
	(32, 'सामान्य प्रशासन विभाग', 'General Administration Department', 1),
	(33, 'जन शक्ति नियोजन (रोजगार) विभाग', 'Employment Department', 1),
	(34, 'सहकारिता विभाग', 'Cooperative Department', 1),
	(35, 'धार्मिक न्याय एवं धर्मस्व', 'Religious Trusts and Endowment', 1),
	(36, 'मछली पालन', 'Fisheries Department', 1),
	(37, 'छ. ग. राज्य निर्वाचन आयोग', 'CG State Election Commission', 1),
	(38, 'आपदा प्रबंधन', 'Disaster Management', 1),
	(39, 'आबकारी विभाग', 'Excise Department', 1),
	(40, 'विधि एवं विधायी कार्य', 'Law and Legislative Department', 1),
	(41, 'संसदीय कार्य', 'Parliamentary Affairs', 1);

-- Dumping structure for table tlmis_main_db.master_designation
DROP TABLE IF EXISTS `master_designation`;
CREATE TABLE IF NOT EXISTS `master_designation` (
  `designation_id` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`designation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_designation: ~10 rows (approximately)
INSERT INTO `master_designation` (`designation_id`, `designation`, `is_active`) VALUES
	(1, 'District Collector', 1),
	(2, 'Department Secretariat', 1),
	(3, 'Joint Director', 1),
	(4, 'Deputy Director', 1),
	(5, 'Asst Director', 1),
	(6, 'Asst Grade', 1),
	(7, 'Section officer', 1),
	(8, 'Date Entry Operator', 1),
	(9, 'Designation', 1),
	(10, 'Test Designation', 1);

-- Dumping structure for table tlmis_main_db.master_district
DROP TABLE IF EXISTS `master_district`;
CREATE TABLE IF NOT EXISTS `master_district` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `fk_sambhag_id` int NOT NULL,
  `district_lgd_code` int NOT NULL,
  `district_name_eng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_name_hin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  KEY `fk_sambhag_id` (`fk_sambhag_id`),
  KEY `district_lgd_code` (`district_lgd_code`),
  CONSTRAINT `master_district_ibfk_1` FOREIGN KEY (`fk_sambhag_id`) REFERENCES `master_sambhag` (`sambhag_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_district: ~33 rows (approximately)
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

-- Dumping structure for table tlmis_main_db.master_doc_types
DROP TABLE IF EXISTS `master_doc_types`;
CREATE TABLE IF NOT EXISTS `master_doc_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_hi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_doc_types: ~11 rows (approximately)
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
	(14, 'विधानसभा प्रश्न - ध्यानाकर्षण', 'Vidhansabha - Attention', 1, 2, NULL, '2025-01-04 12:40:05', NULL, '127.0.0.1', NULL);

-- Dumping structure for table tlmis_main_db.master_issuers
DROP TABLE IF EXISTS `master_issuers`;
CREATE TABLE IF NOT EXISTS `master_issuers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuer_type_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issuer_type_id` (`issuer_type_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_issuers: ~9 rows (approximately)
INSERT INTO `master_issuers` (`id`, `name`, `issuer_type_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(1, 'Electronics and Information Technology', 8, 1, 0, 0, '2024-12-30 04:48:42', '2025-01-01 09:26:10', '', ''),
	(2, 'Health Department', 8, 1, 2, 0, '2024-12-30 05:48:17', '2025-01-01 09:26:11', '127.0.0.1', ''),
	(3, 'PWD', 9, 1, 2, 0, '2024-12-30 06:21:46', '2025-01-01 09:26:14', '127.0.0.1', ''),
	(4, 'District Raipur', 10, 1, 2, 0, '2024-12-30 06:57:44', '2025-01-01 09:26:27', '127.0.0.1', ''),
	(5, 'Issuer', 8, 1, 2, 0, '2024-12-30 10:10:11', '2025-01-01 09:26:12', '127.0.0.1', ''),
	(6, 'A State Issuer', 9, 1, 2, 0, '2024-12-30 10:47:49', '2025-01-01 09:26:21', '127.0.0.1', ''),
	(7, 'District Raipur', 10, 1, 2, 0, '2025-01-01 03:14:42', '2025-01-01 03:14:42', '127.0.0.1', ''),
	(8, 'PWD', 8, 1, 2, 0, '2025-01-04 02:09:34', '2025-01-04 02:09:34', '127.0.0.1', ''),
	(9, 'A State Issuer', 8, 1, 2, 0, '2025-01-04 07:07:03', '2025-01-04 07:07:03', '127.0.0.1', ''),
	(10, 'Central', 8, 1, 2, 0, '2025-01-04 10:58:58', '2025-01-04 10:58:58', '127.0.0.1', '');

-- Dumping structure for table tlmis_main_db.master_issuer_types
DROP TABLE IF EXISTS `master_issuer_types`;
CREATE TABLE IF NOT EXISTS `master_issuer_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_hi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_issuer_types: ~4 rows (approximately)
INSERT INTO `master_issuer_types` (`id`, `name_hi`, `name_en`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
	(8, 'केंद्र शासन', 'Central Minsitry', 1, 2, NULL, '2024-12-31 03:22:44', '2024-12-31 03:22:44', '127.0.0.1', NULL),
	(9, 'राज्य सरकार', 'State Department', 1, 2, NULL, '2024-12-31 03:23:02', '2024-12-31 03:23:02', '127.0.0.1', NULL),
	(10, 'जिला निकाय', 'District Office', 1, 2, NULL, '2024-12-31 03:23:45', '2024-12-31 03:23:45', '127.0.0.1', NULL);

-- Dumping structure for table tlmis_main_db.master_level
DROP TABLE IF EXISTS `master_level`;
CREATE TABLE IF NOT EXISTS `master_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_level: ~5 rows (approximately)
INSERT INTO `master_level` (`level_id`, `level`, `remark`, `is_active`) VALUES
	(1, 'Level 1', NULL, 1),
	(2, 'Level 2', NULL, 1),
	(3, 'Level 3', NULL, 1),
	(4, 'Level 4', NULL, 1),
	(5, 'Level 5', NULL, 1);

-- Dumping structure for table tlmis_main_db.master_sambhag
DROP TABLE IF EXISTS `master_sambhag`;
CREATE TABLE IF NOT EXISTS `master_sambhag` (
  `sambhag_id` int NOT NULL AUTO_INCREMENT,
  `sambhag_name_eng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sambhag_name_hin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sambhag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_sambhag: ~5 rows (approximately)
INSERT INTO `master_sambhag` (`sambhag_id`, `sambhag_name_eng`, `sambhag_name_hin`) VALUES
	(1, 'Raipur', 'रायपुर'),
	(2, 'Durg', 'दुर्ग'),
	(3, 'Bilaspur', 'बिलासपुर'),
	(4, 'Sarguja', 'सरगुजा'),
	(5, 'Bastar', 'बस्तर');

-- Dumping structure for table tlmis_main_db.master_task_category
DROP TABLE IF EXISTS `master_task_category`;
CREATE TABLE IF NOT EXISTS `master_task_category` (
  `task_category_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL DEFAULT '0',
  `updated_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_category_id`),
  KEY `is_active` (`is_active`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.master_task_category: ~10 rows (approximately)
INSERT INTO `master_task_category` (`task_category_id`, `category`, `remark`, `is_active`, `created_by`, `created_ipaddress`, `created_datetime`, `updated_by`, `updated_ipaddress`, `updated_datetime`) VALUES
	(1, 'सामान्य पत्र', NULL, 1, NULL, NULL, '2024-12-16 16:46:39', 0, NULL, '2025-01-04 14:44:00'),
	(2, 'शिकायत', NULL, 1, NULL, NULL, '2024-12-16 16:46:49', 0, NULL, '2025-01-04 14:44:06'),
	(3, 'भारत सरकार से आया हुआ पत्र', NULL, 1, NULL, NULL, '2024-12-16 16:47:06', 0, NULL, '2025-01-04 14:44:07'),
	(4, 'मुख्यमंत्री सचिवालय से आया हुआ पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:44:33', 0, NULL, NULL),
	(5, 'मुख्यमंत्री सचिवालय से आया हुआ पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL),
	(6, 'माननीय मंत्री से आया हुआ पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL),
	(7, 'सांसद से आया पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL),
	(8, 'विधायक से आया पत्र', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL),
	(9, 'अन्य', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL),
	(10, 'महत्वपूर्ण पूर्ण', NULL, 1, NULL, NULL, '2025-01-04 14:46:06', 0, NULL, NULL);

-- Dumping structure for table tlmis_main_db.master_task_priority
DROP TABLE IF EXISTS `master_task_priority`;
CREATE TABLE IF NOT EXISTS `master_task_priority` (
  `task_priority_id` int NOT NULL AUTO_INCREMENT,
  `priority` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL DEFAULT '0',
  `updated_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_priority_id`) USING BTREE,
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table tlmis_main_db.master_task_priority: ~2 rows (approximately)
INSERT INTO `master_task_priority` (`task_priority_id`, `priority`, `remark`, `is_active`, `created_by`, `created_ipaddress`, `created_datetime`, `updated_by`, `updated_ipaddress`, `updated_datetime`) VALUES
	(1, 'Normal', NULL, 1, NULL, NULL, '2024-12-16 16:52:40', 0, NULL, NULL),
	(2, 'High', NULL, 1, NULL, NULL, '2024-12-16 16:52:49', 0, NULL, NULL);

-- Dumping structure for table tlmis_main_db.tbl_file_mgmt
DROP TABLE IF EXISTS `tbl_file_mgmt`;
CREATE TABLE IF NOT EXISTS `tbl_file_mgmt` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_type_id` int NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `issuer` bigint NOT NULL,
  `receiving_date` date NOT NULL,
  `unique_file_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_nature` enum('NL','TL') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NL',
  `doc_priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_file_mgmt: ~2 rows (approximately)
INSERT INTO `tbl_file_mgmt` (`id`, `file_type_id`, `reference_no`, `issue_date`, `issuer`, `receiving_date`, `unique_file_id`, `doc_nature`, `doc_priority`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(1, 2, 'Demo/12/45', '2025-01-03', 6, '2025-01-03', '67795f3469b77', 'TL', 'Immediate', 1, '2025-01-04 10:47:56', '2025-01-04 10:47:56', 2, NULL, '127.0.0.1', NULL),
	(2, 3, 'Demo34', '2025-01-03', 10, '2025-01-16', '677961cb04b5e', 'TL', 'Immediate', 1, '2025-01-04 10:58:59', '2025-01-04 10:58:59', 2, NULL, '127.0.0.1', NULL);

-- Dumping structure for table tlmis_main_db.tbl_file_mgmt_uploads
DROP TABLE IF EXISTS `tbl_file_mgmt_uploads`;
CREATE TABLE IF NOT EXISTS `tbl_file_mgmt_uploads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_file_mgmt_id` bigint unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_mgmt_id` (`fk_file_mgmt_id`),
  CONSTRAINT `tbl_file_mgmt_uploads_ibfk_1` FOREIGN KEY (`fk_file_mgmt_id`) REFERENCES `tbl_file_mgmt` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_file_mgmt_uploads: ~2 rows (approximately)
INSERT INTO `tbl_file_mgmt_uploads` (`id`, `fk_file_mgmt_id`, `filename`, `extension`, `path`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(1, 1, 'demo.pdf', 'pdf', 'documents/demo_1736007476.pdf', '2025-01-04 10:47:56', '2025-01-04 10:47:56', 2, NULL, '127.0.0.1', NULL),
	(2, 2, 'demo.pdf', 'pdf', 'documents/demo_1736008139.pdf', '2025-01-04 10:58:59', '2025-01-04 10:58:59', 2, NULL, '127.0.0.1', NULL);

-- Dumping structure for table tlmis_main_db.tbl_nodal
DROP TABLE IF EXISTS `tbl_nodal`;
CREATE TABLE IF NOT EXISTS `tbl_nodal` (
  `nodal_id` int NOT NULL AUTO_INCREMENT,
  `fk_dept_id` int NOT NULL,
  `fk_designation_id` tinyint NOT NULL DEFAULT '0',
  `nodal_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nodal_id`),
  KEY `fk_dept_id` (`fk_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_nodal: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.tbl_task
DROP TABLE IF EXISTS `tbl_task`;
CREATE TABLE IF NOT EXISTS `tbl_task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_task_priority_id` int NOT NULL DEFAULT '0',
  `fk_task_category_id` int NOT NULL DEFAULT '0',
  `entry_date` date NOT NULL,
  `due_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('P','C','I') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'I' COMMENT 'P=Pending, C=Completed, I= Inprogress',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `ref_docs` json DEFAULT NULL COMMENT 'Stores selected reference document IDs',
  `has_file` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_replied` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`task_id`),
  KEY `title` (`title`),
  KEY `fk_task_priority_id` (`fk_task_priority_id`),
  KEY `fk_task_category_id` (`fk_task_category_id`),
  KEY `entry_date` (`entry_date`),
  KEY `due_date` (`due_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_task: ~7 rows (approximately)
INSERT INTO `tbl_task` (`task_id`, `title`, `fk_task_priority_id`, `fk_task_category_id`, `entry_date`, `due_date`, `description`, `status`, `remark`, `ref_docs`, `has_file`, `created_by`, `created_date`, `created_ipaddress`, `updated_by`, `updated_date`, `updated_ipaddress`, `closed_by`, `closed_date`, `closed_ipaddress`, `is_replied`) VALUES
	(1, 'Testing', 1, 3, '2025-01-02', '2025-01-02', 'oktest', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:10:29', '127.0.0.1', 2, '2025-01-04 22:37:41', '127.0.0.1', NULL, NULL, NULL, 'N'),
	(2, 'Testing 234', 2, 1, '2025-01-01', '2025-01-01', 'NA', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:32:10', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(3, 'Testing124', 1, 9, '2025-01-03', '2025-01-08', 'NA', 'I', NULL, '["2"]', 'N', 2, '2025-01-04 22:35:38', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(4, 'Testing90', 1, 2, '2025-01-02', '2025-01-09', 'NA', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:43:36', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(5, 'OK', 1, 3, '2025-01-03', '2025-01-09', 'NA', 'I', NULL, '["2", "1"]', 'N', 2, '2025-01-04 22:45:15', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(6, 'OKerter', 1, 1, '2025-01-04', '2025-01-16', 'NA NA', 'C', 'ok', '["2", "1"]', 'N', 2, '2025-01-04 22:47:53', '127.0.0.1', 2, '2025-01-04 23:47:21', '127.0.0.1', 2, '2025-01-04 18:17:21', '127.0.0.1', 'Y'),
	(7, 'OK', 1, 1, '2025-01-03', '2025-01-09', 'OK', 'I', NULL, NULL, 'N', 2, '2025-01-04 22:49:21', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, 'N');

-- Dumping structure for table tlmis_main_db.tbl_task_dept_map
DROP TABLE IF EXISTS `tbl_task_dept_map`;
CREATE TABLE IF NOT EXISTS `tbl_task_dept_map` (
  `td_map_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int NOT NULL DEFAULT '0',
  `fk_dept_id` int NOT NULL DEFAULT '0',
  `is_send_back` tinyint DEFAULT '0',
  `send_back_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `send_back_status` enum('A','R','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A-Approved,R-Rejected,P-Pending',
  `update_by` int NOT NULL DEFAULT '0',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`td_map_id`),
  KEY `fk_task_id` (`fk_task_id`),
  KEY `fk_dept_id` (`fk_dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_task_dept_map: ~7 rows (approximately)
INSERT INTO `tbl_task_dept_map` (`td_map_id`, `fk_task_id`, `fk_dept_id`, `is_send_back`, `send_back_remark`, `send_back_status`, `update_by`, `updated_date`, `updated_ipaddress`) VALUES
	(1, 1, 1, NULL, NULL, NULL, 0, NULL, NULL),
	(2, 2, 3, NULL, NULL, NULL, 0, NULL, NULL),
	(3, 2, 4, NULL, NULL, NULL, 0, NULL, NULL),
	(4, 3, 5, NULL, NULL, NULL, 0, NULL, NULL),
	(5, 4, 4, NULL, NULL, NULL, 0, NULL, NULL),
	(6, 5, 5, NULL, NULL, NULL, 0, NULL, NULL),
	(7, 6, 3, NULL, NULL, NULL, 0, NULL, NULL),
	(8, 7, 3, NULL, NULL, NULL, 0, NULL, NULL);

-- Dumping structure for table tlmis_main_db.tbl_task_files
DROP TABLE IF EXISTS `tbl_task_files`;
CREATE TABLE IF NOT EXISTS `tbl_task_files` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci,
  `file_name` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `fk_task_id` (`fk_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_task_files: ~0 rows (approximately)

-- Dumping structure for table tlmis_main_db.tbl_task_reply_trs
DROP TABLE IF EXISTS `tbl_task_reply_trs`;
CREATE TABLE IF NOT EXISTS `tbl_task_reply_trs` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `fk_task_id` int NOT NULL DEFAULT '0',
  `reply` text COLLATE utf8mb4_unicode_ci,
  `reply_file` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_id`),
  KEY `fk_task_id` (`fk_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_task_reply_trs: ~0 rows (approximately)
INSERT INTO `tbl_task_reply_trs` (`reply_id`, `fk_task_id`, `reply`, `reply_file`, `file_size`, `file_name`, `created_by`, `created_ipaddress`, `created_datetime`, `update_by`, `update_ipaddress`, `update_datetime`) VALUES
	(1, 6, 'ok', NULL, NULL, NULL, 2, '127.0.0.1', '2025-01-04 23:47:13', NULL, NULL, NULL);

-- Dumping structure for table tlmis_main_db.tbl_users
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
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `mobile` (`mobile`),
  KEY `username` (`username`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_users: ~5 rows (approximately)
INSERT INTO `tbl_users` (`user_id`, `full_name`, `mobile`, `email`, `username`, `password`, `salt`, `district_lgd_code`, `is_active`, `preferences`, `remember_token`) VALUES
	(2, 'Demo User', '', 'demo@info.com', 'demouser', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, '{"permissions": {"task": {"view": true, "delete": true, "insert": true, "update": true}, "user": {"view": true, "delete": true, "insert": true, "update": true}}}', NULL),
	(20, 'Test User', '8109188304', 'test@info.com', '8109188304', '3dfd01337d30c7d82684f085097a6b4537f5e35ff38b50af3485bb41717b59572df93dc1074839e9dd15f62c7db90e8ab1703cf58e22e56aac53f6b9965d4507', 'ByOLMBU', NULL, 1, NULL, NULL),
	(21, 'Test Dept User', '9876543210', 'dept.test@info.ocm', '9876543210', 'ccf6fcfcd69a41aaf4d225e6c731908b1920cc7bebd6a93775b8725a0e9555d9ec133ce21eeed13cd0bf99edc7cd6b00329e6209808ce5a033d5de380e98d18f', 'RWwp249', NULL, 1, NULL, NULL),
	(22, 'Test AG', '8765434567', 'testag@info.com', '8765434567', '5690727db198ce2439eb6d18f1bdc740e3afddb8f768fb97062a5a0c9535d9e3c86a0e88f5fe3c5464978723145a360444a9571fefec814eb20efaed39b230e8', 'BKBQNEg', NULL, 1, NULL, NULL),
	(23, 'ABC', '9926515457', 'test@mail.com', '9926515457', 'ece3f4414e1abf1026453515a587cf9165fb126f7d157f124a5740d7de699edfc8f4e3358421c671763d9829611eb142361e9e08a7017134c183e22797702525', 'GTzphZI', NULL, 1, NULL, NULL);

-- Dumping structure for table tlmis_main_db.tbl_user_map
DROP TABLE IF EXISTS `tbl_user_map`;
CREATE TABLE IF NOT EXISTS `tbl_user_map` (
  `user_map_id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `fk_level_id` int NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tbl_user_map: 5 rows
/*!40000 ALTER TABLE `tbl_user_map` DISABLE KEYS */;
INSERT INTO `tbl_user_map` (`user_map_id`, `fk_user_id`, `fk_level_id`, `fk_department_id`, `fk_designation_id`, `remark`, `is_active`, `create_by`, `update_by`, `create_datetime`, `update_datetime`, `create_ipaddress`, `update_ipaddress`) VALUES
	(1, 2, 1, NULL, 1, NULL, 1, 1, NULL, '2024-12-18 12:20:19', '2024-12-23 14:32:41', '::1', NULL),
	(18, 20, 2, 1, 2, NULL, 1, 2, NULL, '2024-12-20 15:11:11', '2024-12-23 14:50:43', '127.0.0.1', NULL),
	(19, 21, 1, 4, 2, NULL, 1, 1, NULL, '2024-12-23 14:20:32', '2024-12-23 14:20:59', '', NULL),
	(20, 22, 2, 4, 6, NULL, 1, 21, NULL, '2024-12-23 14:57:31', NULL, '127.0.0.1', NULL),
	(21, 23, 2, 4, 10, NULL, 1, 2, 2, '2025-01-01 20:06:49', '2025-01-01 20:34:14', '127.0.0.1', '127.0.0.1');
/*!40000 ALTER TABLE `tbl_user_map` ENABLE KEYS */;

-- Dumping structure for table tlmis_main_db.tl_reviews
DROP TABLE IF EXISTS `tl_reviews`;
CREATE TABLE IF NOT EXISTS `tl_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tl_date` date NOT NULL,
  `tl_time` time NOT NULL,
  `tl_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tl_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tl_status` enum('SCH','CMP','PST','CNC') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SCH',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tl_date` (`tl_date`),
  KEY `tl_title` (`tl_title`),
  KEY `tl_status` (`tl_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tl_reviews: ~0 rows (approximately)
INSERT INTO `tl_reviews` (`id`, `tl_date`, `tl_time`, `tl_title`, `tl_desc`, `tl_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(1, '2025-01-04', '22:50:00', 'Agriculture-Labiur Department', 'Tasks To Included in This Review', 'SCH', '2025-01-04 11:51:05', '2025-01-04 11:51:05', 2, NULL, '127.0.0.1', '');

-- Dumping structure for table tlmis_main_db.tl_review_task_map
DROP TABLE IF EXISTS `tl_review_task_map`;
CREATE TABLE IF NOT EXISTS `tl_review_task_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_tl_review_id` int NOT NULL,
  `fk_task_id` int NOT NULL,
  `status` enum('REVIEWED','NOT-REVIEWED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'REVIEWED',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tl_review_id` (`fk_tl_review_id`),
  KEY `fk_task_id` (`fk_task_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.tl_review_task_map: ~6 rows (approximately)
INSERT INTO `tl_review_task_map` (`id`, `fk_tl_review_id`, `fk_task_id`, `status`, `remarks`, `created_at`, `updated_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
	(1, 1, 6, 'REVIEWED', NULL, '2025-01-04 11:51:05', '2025-01-04 11:51:05', 2, NULL, '127.0.0.1', ''),
	(2, 1, 7, 'REVIEWED', NULL, '2025-01-04 11:51:05', '2025-01-04 11:51:05', 2, NULL, '127.0.0.1', ''),
	(3, 1, 4, 'REVIEWED', NULL, '2025-01-04 11:51:05', '2025-01-04 11:51:05', 2, NULL, '127.0.0.1', ''),
	(4, 1, 1, 'REVIEWED', NULL, '2025-01-04 11:51:05', '2025-01-04 11:51:05', 2, NULL, '127.0.0.1', ''),
	(5, 1, 5, 'REVIEWED', NULL, '2025-01-04 11:51:05', '2025-01-04 11:51:05', 2, NULL, '127.0.0.1', ''),
	(6, 1, 3, 'REVIEWED', NULL, '2025-01-04 11:51:05', '2025-01-04 11:51:05', 2, NULL, '127.0.0.1', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
