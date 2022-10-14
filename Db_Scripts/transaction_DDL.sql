CREATE TABLE `sql6524946`.`transaction` (
  `transaction_id` BIGINT(20) NOT NULL,
  `user_id` BIGINT(15) NULL,
  `transaction_date` DATE NULL,
  `transaction_time` VARCHAR(20) NULL,
  `transaction_status` VARCHAR(10) NULL,
  `user_agent` VARCHAR(100) NULL,
  `wallet_id` BIGINT(15) NULL,
  `amount` INT NULL,
  PRIMARY KEY (`transaction_id`));
