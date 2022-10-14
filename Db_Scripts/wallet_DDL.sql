CREATE TABLE `game`.`wallet` (
  `wallet_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(15) NULL,
  `transaction_id` BIGINT(20) NULL,
  `withdrawal_id` BIGINT(15) NULL,
  `transaction_detail_id` BIGINT(15) NULL,
  `total_amount` INT NULL,
  `bonus_amount` INT NULL,
  PRIMARY KEY (`wallet_id`));
