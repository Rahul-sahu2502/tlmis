ALTER TABLE `tbl_task`
	ADD COLUMN `closed_remark` TEXT NULL AFTER `updated_ipaddress`;


CREATE TABLE `tbl_task_closed_trs` (
	`closed_id` INT NOT NULL AUTO_INCREMENT,
	`fk_task_id` INT NOT NULL,
	`closed_remark` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`closed_by` INT NULL DEFAULT NULL,
	`closed_date` DATETIME NULL DEFAULT NULL,
	`closed_ipaddress` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`closed_id`) USING BTREE,
	INDEX `fk_task_id` (`fk_task_id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;

CREATE TABLE `tbl_task_reopen_trs` (
	`reopen_id` INT NOT NULL AUTO_INCREMENT,
	`fk_task_id` INT NOT NULL,
	`reopen_remark` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`reopen_by` INT NULL DEFAULT NULL,
	`reopen_date` DATETIME NULL DEFAULT NULL,
	`reopen_ipaddress` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`reopen_id`) USING BTREE,
	INDEX `fk_task_id` (`fk_task_id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;


ALTER TABLE `tbl_task`
	CHANGE COLUMN `status` `status` ENUM('P','C','I','O') NOT NULL DEFAULT 'I' COMMENT 'P=Pending, C=Completed, I= Inprogress, O=Reopened' COLLATE 'utf8mb4_unicode_ci' AFTER `description`;

ALTER TABLE `log_tbl_task`
	CHANGE COLUMN `status` `status` ENUM('P','C','I','O') NOT NULL DEFAULT 'I' COMMENT 'P=Pending, C=Completed, I= Inprogress, O=Reopened' COLLATE 'utf8mb4_unicode_ci' AFTER `description`;
