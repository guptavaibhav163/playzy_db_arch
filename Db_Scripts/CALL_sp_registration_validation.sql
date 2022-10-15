 CALL sp_registration_validation  ( 'vatsal1', 'shams', 'madhani',  '1998-12-27', '2022-10-15', 'vatsal1@example.com', '8017456324', 100 )
CALL sp_transactions  ( 'vatsal1', '123458778706675432', '2022-10-25',  '19:56',101, 'ARYNW:B23V:BREIB:1234') 

-- SELECT * FROM users
-- SELECT * FROM wallet
-- SELECT * FROM transaction where transaction_id = 123458745706865432
-- DELETE FROM transaction where transaction_id = 123458778706675432
-- SELECT * FROM transaction_detail;
-- DELETE FROM transaction_detail where transaction_id = 123458778706675432

-- DELETE FROM transaction WHERE transaction_id = 123458745098765432

-- DELETE FROM users WHERE user_id = 8
-- 192.168.1.5