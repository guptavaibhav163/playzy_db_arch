CREATE TABLE `sql6524946`.`game_session` (
  `game_session_id` INT NOT NULL AUTO_INCREMENT,
  `game_id` BIGINT(15) NULL,
  `game_name` VARCHAR(45) NULL,
  `number_of_players` INT NULL,
  `wallet_id` BIGINT(15) NULL,
  `room_code` INT NULL,
  `game_date` DATE NULL,
  `game_start_time` VARCHAR(20) NULL,
  `game_end_time` VARCHAR(20) NULL,
  PRIMARY KEY (`game_session_id`));
