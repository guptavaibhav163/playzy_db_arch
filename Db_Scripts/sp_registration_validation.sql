USE `game`;
DROP PROCEDURE IF EXISTS `sp_registration_validation`;

DELIMITER $$
CREATE PROCEDURE `sp_registration_validation`(
IN v_user_name VARCHAR(45)
, IN v_first_name VARCHAR(45)
, IN v_last_name VARCHAR(45)
, IN v_date_of_birth DATE
, IN v_date_of_registration DATE
, IN v_email VARCHAR(100)
, IN v_phone_number BIGINT
, IN v_bonus BIGINT
)
BEGIN

	INSERT INTO users
    (
        username
        ,first_name
        ,last_name
        ,date_of_birth
        ,date_of_registration
        ,email
        ,phone_number
    )
    VALUES
    (
        v_user_name
        ,v_first_name
        ,v_last_name
        ,v_date_of_birth
        ,v_date_of_registration
        ,v_email
        ,v_phone_number
    );
    
	INSERT INTO wallet 
	 (
	    user_id 
	 )
	SELECT 
	user_id 
	FROM 
	users 
	WHERE username = v_user_name ;
		
	SET SQL_SAFE_UPDATES = 0;
	UPDATE 
	users AS u
	INNER JOIN 
	wallet AS w
	ON 
	u.user_id = w.user_id
	SET u.wallet_id = w.wallet_id
	,w.bonus_amount = v_bonus
	WHERE u.username = v_user_name ;
    
END$$

DELIMITER ;
;

