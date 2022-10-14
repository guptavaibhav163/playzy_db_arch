 -- CALL sp_registration_validation  ( 'shamsher', 'shams', 'madhani',  '1998-12-27', '2022-10-08', 'sams@example.com', '8017454324' )
CALL sp_transactions  ( 'shamsher1', '123458745098765432', '2022-10-09',  '17:03','251', 'AEUYW:B23V:BNJIB:1234') 

-- SELECT * FROM users
-- SELECT * FROM wallet
-- SELECT * FROM transaction
-- SELECT * FROM transaction_detail;

-- DELETE FROM transaction WHERE transaction_id = 123458745098765432

-- DELETE FROM users WHERE user_id = 8