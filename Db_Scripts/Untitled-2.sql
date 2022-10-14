-- Active: 1664969722645@@localhost@3306@game
INSERT INTO `sql6524946`.`users`
(
	username
	,first_name
	,last_name
	,date_of_birth
	,date_of_registration
	,email
	,phone_number
	,wallet_id
)
SELECT
	'vaibhav_g'
	,'vaibhav'
	,'gupta'
	,'1998-12-03'
	,'2022-10-08'
	,'example@gmail.com'
	,9675489032
    ,123



SELECT str_to_date('03-12-1998','%d-%m-%Y')