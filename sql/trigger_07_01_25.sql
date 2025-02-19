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

-- Dumping structure for trigger tlmis_main_db.trg_tbl_task_dept_map_before_update
DROP TRIGGER IF EXISTS `trg_tbl_task_dept_map_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `trg_tbl_task_dept_map_before_update` BEFORE UPDATE ON `tbl_task_dept_map` FOR EACH ROW INSERT INTO log_tbl_task_dept_map_before_update
	(td_map_id, fk_task_id, fk_dept_id, is_send_back, send_back_remark, send_back_status, send_back_by, send_back_date, send_back_ipaddress, sb_action_by, sb_action_date, sb_action_ipddress)
	VALUES (OLD.td_map_id, OLD.fk_task_id, OLD.fk_dept_id, OLD.is_send_back, OLD.send_back_remark, OLD.send_back_status, 
	OLD.send_back_by, OLD.send_back_date, OLD.send_back_ipaddress, OLD.sb_action_by, OLD.sb_action_date, OLD.sb_action_ipddress)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
