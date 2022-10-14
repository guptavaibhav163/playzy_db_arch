CREATE TABLE `game`.`users` (
  `user_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  `date_of_registration` DATE NULL,
  `email` VARCHAR(100) NULL,
  `phone_number` BIGINT(20) NULL,
  `wallet_id` BIGINT(15) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE);