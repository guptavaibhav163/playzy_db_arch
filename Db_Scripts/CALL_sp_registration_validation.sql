-- CALL sp_registration_validation  ( 'shamsher1', 'shams', 'madhani',  '1998-12-27', '2022-10-08', 'sams1@example.com', '8017654324' )
CALL sp_transactions  ( 'shamsher1', '123458745098765432', '2022-10-09',  '17:03', 'AEUYW:B23V:BNJIB:1234')

-- SELECT * FROM users
-- SELECT * FROM wallet
-- SELECT * FROM transaction

-- DELETE FROM transaction WHERE transaction_id = 123458745098765432

-- DELETE FROM users WHERE user_id = 8