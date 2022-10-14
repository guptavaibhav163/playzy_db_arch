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
	
    DECLARE v_cur_amount INT;
    
    SELECT IFNULL(MAX(current_amount),0) 
    INTO v_cur_amount
    FROM 
    transaction_detail td
    INNER JOIN 
    users u
    ON 
    td.user_id = u.user_id
    WHERE u.username = v_username;
    
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
    
    IF v_cur_amount = 0 
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
		,v_cur_amount
		,v_added_amt
		,v_added_amt
		,v_added_amt
		,v_added_amt
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
		,v_current_amt + v_added_amt
		,v_current_amt
		,v_current_amt + v_added_amt -- + bonus
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
	AND td.transaction_id = v_transaction_id
    SET w.transaction_id = v_transaction_id
    ,w.transaction_detail_id = td.transaction_detail_id
    ,w.total_amount = td.total_amount
    WHERE u.username = v_username
    ;
     
END$$

DELIMITER ;

