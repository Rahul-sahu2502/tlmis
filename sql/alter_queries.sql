-- added on 31-12-2024
ALTER TABLE `tbl_file_mgmt` CHANGE `file_type` `file_type_id` INT(11) NOT NULL;
ALTER TABLE `master_issuers` CHANGE `type` `issuer_type_id` INT(11) NOT NULL;
--added on 04-01-2025
ALTER TABLE `tbl_file_mgmt` ADD `doc_nature` ENUM('NL','TL') NOT NULL DEFAULT 'NL' AFTER `unique_file_id`, ADD `doc_priority` VARCHAR(255) NOT NULL AFTER `doc_nature`;
--added on 07-01-2025
ALTER TABLE `tl_review_task_map` CHANGE `status` `status` ENUM('REVIEWED','NOT-REVIEWED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NOT-REVIEWED';
ALTER TABLE tl_reviews ADD COLUMN `postponed_date` DATE NULL,ADD COLUMN `postponed_time` TIME NULL;
--added on 22-01-2025
ALTER TABLE `tl_reviews` CHANGE `tl_title` `tl_title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL, CHANGE `tl_desc` `tl_desc` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;