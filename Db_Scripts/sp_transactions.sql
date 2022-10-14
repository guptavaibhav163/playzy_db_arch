USE `game`;
DROP PROCEDURE IF EXISTS `sp_transactions`;

DELIMITER $$
CREATE PROCEDURE `sp_transactions` 
(
	 IN v_username VARCHAR(45)
	,IN v_transaction_id BIGINT
    ,IN v_transaction_date DATE
    ,IN v_transaction_time VARCHAR(20)
    ,IN v_added_amt INT
    ,IN	v_user_agent VARCHAR(100)
)
BEGIN
	
    DECLARE cur_amount INT;
    
    SELECT current_amount INTO cur_amount FROM transaction_details WHERE transaction_id = v_transaction_id;
    
    INSERT INTO transaction
    (
		transaction_id
        ,user_id
        ,transaction_date
        ,transaction_time
        ,transaction_status
        ,user_agent
        ,wallet_id
    )
    SELECT 
    v_transaction_id
    ,u.user_id
    ,v_transaction_date
    ,v_transaction_time
    ,'ACTIVE'
    ,v_user_agent
    ,u.wallet_id
    FROM
    users u
    WHERE username = v_username
    ;
    
    IF cur_amount = 0 
    THEN
		INSERT INTO transaction_detail
		(
			transaction_id
			,user_id
			,current_amount
			,added_amount
			,updated_amount
			,bonus_amount
			,total_amount
			,wallet_id
		)
		SELECT 
		v_transaction_id
		,u.user_id
		,v_current_amt
		,v_added_amt
		,v_current_amt
		,v_current_amt
		,v_current_amt
		,u.wallet_id
		FROM 
		users u 
		WHERE
		u.username = v_username
		;
	ELSE
		INSERT INTO transaction_detail
		(
			transaction_id
			,user_id
			,current_amount
			,added_amount
			,updated_amount
			,bonus_amount
			,total_amount
			,wallet_id
		)
		SELECT 
		v_transaction_id
		,u.user_id
		,v_current_amt
		,v_added_amt
		,v_current_amt
		,v_current_amt
		,v_current_amt
		,u.wallet_id
		FROM 
		users u 
		WHERE
		u.username = v_username
		;
	END IF;

    SET SQL_SAFE_UPDATES = 0;
    UPDATE 
    wallet w
    INNER JOIN 
    users u 
    ON w.user_id = u.user_id
    INNER JOIN 
    transaction_detail td
    ON w.user_id = td.user_id
    SET w.transaction_id = v_transaction_id
    ,w.transaction_detail_id = td.transaction_detail_id
    WHERE u.username = v_username
    ;
     
END$$

DELIMITER ;

