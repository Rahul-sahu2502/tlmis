ALTER TABLE `tbl_task_dept_map`
	CHANGE COLUMN `sb_action_by` `sb_action_by` INT NULL DEFAULT NULL AFTER `send_back_ipaddress`;

ALTER TABLE `tbl_task_dept_map`
	CHANGE COLUMN `sb_action_by` `sb_action_by` INT NULL DEFAULT '0' AFTER `send_back_ipaddress`;

ALTER TABLE `log_tbl_task_dept_map_before_update`
	CHANGE COLUMN `sb_action_by` `sb_action_by` INT NULL DEFAULT '0' AFTER `send_back_ipaddress`;
ALTER TABLE `log_tbl_task_dept_map_before_delete`
	CHANGE COLUMN `sb_action_by` `sb_action_by` INT NULL DEFAULT '0' AFTER `send_back_ipaddress`;
