CREATE TABLE `game`.`withdrawal_details` (
  `withdrawal_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(15) NULL,
  `withdraw_transaction_id` BIGINT(15) NULL,
  `withdraw_status` VARCHAR(20) NULL,
  `withdraw_amount` INT NULL,
  `updated_amount` INT NULL,
  `wallet_id` BIGINT(20) NULL,
  PRIMARY KEY (`withdrawal_id`));
