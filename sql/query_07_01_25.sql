ALTER TABLE tbl_task_dept_map
	ADD COLUMN sb_action_remark TEXT NULL DEFAULT NULL AFTER sb_action_by;

CREATE TABLE `log_tbl_task_dept_map_before_delete` (
	`log_td_map_id` INT NOT NULL AUTO_INCREMENT,
	`td_map_id` INT NOT NULL,
	`fk_task_id` INT NOT NULL DEFAULT '0',
	`fk_dept_id` INT NOT NULL DEFAULT '0',
	`is_send_back` TINYINT NULL DEFAULT '0',
	`send_back_remark` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`send_back_status` ENUM('A','R','P') NULL DEFAULT NULL COMMENT 'A-Approved,R-Rejected,P-Pending' COLLATE 'utf8mb4_unicode_ci',
	`send_back_by` INT NOT NULL DEFAULT '0',
	`send_back_date` DATETIME NULL DEFAULT NULL,
	`send_back_ipaddress` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`sb_action_by` TINYINT NULL DEFAULT NULL,
	`sb_action_date` DATETIME NULL DEFAULT NULL,
	`sb_action_ipddress` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`log_create_datetime` DATETIME NULL DEFAULT (now()),
	PRIMARY KEY (`log_td_map_id`) USING BTREE,
	INDEX `td_map_id` (`td_map_id`) USING BTREE,
	INDEX `fk_task_id` (`fk_task_id`) USING BTREE,
	INDEX `fk_dept_id` (`fk_dept_id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;


CREATE TABLE `tbl_task_send_back_trs` (
	`td_sb_id` INT NOT NULL AUTO_INCREMENT,
	`td_map_id` INT NOT NULL,
	`fk_task_id` INT NOT NULL DEFAULT '0',
	`fk_dept_id` INT NOT NULL DEFAULT '0',
	`is_send_back` TINYINT NULL DEFAULT '0',
	`send_back_remark` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`send_back_status` ENUM('A','R','P') NULL DEFAULT NULL COMMENT 'A-Approved,R-Rejected,P-Pending' COLLATE 'utf8mb4_unicode_ci',
	`send_back_by` INT NOT NULL DEFAULT '0',
	`send_back_date` DATETIME NULL DEFAULT NULL,
	`send_back_ipaddress` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`sb_action_by` TINYINT NULL DEFAULT NULL,
	`sb_action_remark` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`sb_action_date` DATETIME NULL DEFAULT NULL,
	`sb_action_ipddress` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`td_sb_id`) USING BTREE,
	INDEX `td_map_id` (`td_map_id`) USING BTREE,
	INDEX `fk_task_id` (`fk_task_id`) USING BTREE,
	INDEX `fk_dept_id` (`fk_dept_id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=8
;
