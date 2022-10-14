CREATE TABLE `game`.`transaction_detail` (
  `transaction_detail_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `transaction_id` BIGINT(20) NULL,
  `user_id` BIGINT(15) NULL,
  `current_amount` INT NULL,
  `added_amount` INT NULL,
  `updated_amount` INT NULL,
  `bonus_amount` INT NULL,
  `total_amount` INT NULL,
  `wallet_id` INT NULL,
  PRIMARY KEY (`transaction_detail_id`));
