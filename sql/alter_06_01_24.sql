ALTER TABLE `tbl_task_dept_map`
	CHANGE COLUMN `update_by` `send_back_by` INT NOT NULL DEFAULT '0' AFTER `send_back_status`,
	CHANGE COLUMN `updated_date` `send_back_date` DATETIME NULL DEFAULT NULL AFTER `send_back_by`,
	CHANGE COLUMN `updated_ipaddress` `send_back_ipaddress` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci' AFTER `send_back_date`,
	ADD COLUMN `sb_action_by` TINYINT NULL DEFAULT NULL AFTER `send_back_ipaddress`,
	ADD COLUMN `sb_action_date` DATETIME NULL DEFAULT NULL AFTER `sb_action_by`,
	ADD COLUMN `sb_action_ipddress` VARCHAR(50) NULL DEFAULT NULL AFTER `sb_action_date`;


-- Dumping structure for table tlmis_main_db.log_tbl_task_dept_map_before_delete
DROP TABLE IF EXISTS `log_tbl_task_dept_map_before_delete`;
CREATE TABLE IF NOT EXISTS `log_tbl_task_dept_map_before_delete` (
  `log_td_map_id` int NOT NULL AUTO_INCREMENT,
  `td_map_id` int NOT NULL,
  `fk_task_id` int NOT NULL DEFAULT '0',
  `fk_dept_id` int NOT NULL DEFAULT '0',
  `is_send_back` tinyint DEFAULT '0',
  `send_back_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `send_back_status` enum('A','R','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A-Approved,R-Rejected,P-Pending',
  `send_back_by` int NOT NULL DEFAULT '0',
  `send_back_date` datetime DEFAULT NULL,
  `send_back_ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sb_action_by` tinyint DEFAULT NULL,
  `sb_action_date` datetime DEFAULT NULL,
  `sb_action_ipddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_create_datetime` datetime DEFAULT (now()),
  PRIMARY KEY (`log_td_map_id`) USING BTREE,
  KEY `td_map_id` (`td_map_id`) USING BTREE,
  KEY `fk_task_id` (`fk_task_id`) USING BTREE,
  KEY `fk_dept_id` (`fk_dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tlmis_main_db.log_tbl_task_dept_map_before_delete: ~0 rows (approximately)

-- Dumping structure for trigger tlmis_main_db.trg_tbl_task_dept_map_before_delete
DROP TRIGGER IF EXISTS `trg_tbl_task_dept_map_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_tbl_task_dept_map_before_delete` BEFORE DELETE ON `tbl_task_dept_map` FOR EACH ROW INSERT into log_tbl_task_dept_map_before_delete(td_map_id,
      td_map_id, fk_task_id, fk_dept_id, is_send_back, send_back_remark, send_back_status, send_back_by, send_back_date, send_back_ipaddress, sb_action_by, sb_action_date, sb_action_ipddress)
       VALUES(OLD.td_map_id, OLD.fk_task_id, OLD.fk_dept_id, OLD.is_send_back, OLD.send_back_remark, OLD.send_back_status, OLD.send_back_by, OLD.send_back_date, OLD.send_back_ipaddress, OLD.sb_action_by, OLD.sb_action_date, OLD.sb_action_ipddress)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
