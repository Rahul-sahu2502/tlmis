DROP TABLE `tbl_nodal`;
DROP TABLE `tbl_forward`;
DROP TABLE `tbl_allocation`;


ALTER TABLE `tbl_task_dept_map`
	DROP COLUMN `is_send_back`,
	DROP COLUMN `send_back_remark`,
	DROP COLUMN `send_back_status`,
	DROP COLUMN `send_back_by`,
	DROP COLUMN `send_back_date`,
	DROP COLUMN `send_back_ipaddress`,
	DROP COLUMN `sb_action_by`,
	DROP COLUMN `sb_action_remark`,
	DROP COLUMN `sb_action_date`,
	DROP COLUMN `sb_action_ipddress`;


ALTER TABLE `tbl_task_reply_trs`
	CHANGE COLUMN `reply_file` `reply_file` TEXT NULL COLLATE 'utf8mb4_unicode_ci' AFTER `reply`;


ALTER TABLE log_tbl_task_dept_map_before_delete DROP COLUMN is_send_back,
  DROP COLUMN send_back_remark,
  DROP COLUMN send_back_status,
  DROP COLUMN send_back_by,
  DROP COLUMN send_back_date,
  DROP COLUMN send_back_ipaddress,
  DROP COLUMN sb_action_by,
  DROP COLUMN sb_action_date,
  DROP COLUMN sb_action_ipddress;
ALTER TABLE log_tbl_task_dept_map_before_update DROP COLUMN is_send_back,
  DROP COLUMN send_back_remark,
  DROP COLUMN send_back_status,
  DROP COLUMN send_back_by,
  DROP COLUMN send_back_date,
  DROP COLUMN send_back_ipaddress,
  DROP COLUMN sb_action_by,
  DROP COLUMN sb_action_date,
  DROP COLUMN sb_action_ipddress;
ALTER TABLE tbl_task_send_back_trs DROP COLUMN is_send_back,
  DROP COLUMN send_back_remark,
  DROP COLUMN send_back_status,
  DROP COLUMN send_back_by,
  DROP COLUMN send_back_date,
  DROP COLUMN send_back_ipaddress,
  DROP COLUMN sb_action_by,
  DROP COLUMN sb_action_remark,
  DROP COLUMN sb_action_date,
  DROP COLUMN sb_action_ipddress;


alter table master_sections
    change name_hin name_hi varchar(100) not null;

alter table master_sections
    change name_eng name_en varchar(100) not null;


alter table master_sections
    change create_by created_by int null;

alter table master_sections
    change update_by updated_by int null;


alter table master_sections
    change create_ipaddress created_ip varchar(45) null;

alter table master_sections
    change update_ipaddress update_ip varchar(45) null;


alter table master_sections
    change is_active status tinyint(1) default 1 not null;

alter table master_sections
    change update_ip updated_ip varchar(45) null;




- Dumping structure for trigger tlmis_main_db.trg_tbl_task_dept_map_before_delete
DROP TRIGGER IF EXISTS `trg_tbl_task_dept_map_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_tbl_task_dept_map_before_delete` BEFORE DELETE ON `tbl_task_dept_map` FOR EACH ROW INSERT INTO log_tbl_task_dept_map_before_update
  (td_map_id, fk_task_id, fk_dept_id)
  VALUES (OLD.td_map_id, OLD.fk_task_id, OLD.fk_dept_id)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tlmis_main_db.trg_tbl_task_dept_map_before_update
DROP TRIGGER IF EXISTS `trg_tbl_task_dept_map_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_tbl_task_dept_map_before_update` BEFORE UPDATE ON `tbl_task_dept_map` FOR EACH ROW INSERT INTO log_tbl_task_dept_map_before_update
  (td_map_id, fk_task_id, fk_dept_id)
  VALUES (OLD.td_map_id, OLD.fk_task_id, OLD.fk_dept_id)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
