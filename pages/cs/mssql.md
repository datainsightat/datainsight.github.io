# SQL Error Handling

## Try-Catch

	BEGIN TRY
	END TRY
	BEGIN CATCH
		SELECT  ERROR_NUMBER() AS number,  
        	ERROR_SEVERITY() AS severity_level,  
        	ERROR_STATE() AS state,
        	ERROR_LINE() AS line,  
        	ERROR_MESSAGE() AS message; 
	END CATCH;

## Raise Error

	IF NOT EXISTS (SELECT * FROM staff WHERE staff_id = 15)
		RAISERROR('No %s with id %d.', 16, 1, 'staff member', 15);
		
Note: 16 > Severity Level. Errors < 10 won't be catched!

## Throw

	BEGIN TRY
	END TRY
	BEGIN CATCH
		SELECT 'Info Message';
		THROW 52000 'Error Message' 1;
	END CATCH;
	
Note: Watch the semicolon upfront the THROW statement!

## Transactions
	BEGIN TRY
		BEGIN TRAN;
			UPDATE accounts 
				SET current_balance = current_balance - 100
			WHERE account_id = 1;
			INSERT INTO transactions 
				VALUES (1, -100, GETDATE());
			UPDATE accounts 
				SET current_balance = current_balance + 100
			WHERE account_id = 5;
			INSERT INTO transactions 
				VALUES (5, 100, GETDATE());
		COMMIT TRAN;
	END TRY
	BEGIN CATCH  
		ROLLBACK TRAN;
	END CATCH

## @@Trancount
	SELECT @@TRANCOUNT AS'@@TRANCOUNT value';
	BEGIN TRAN;
		SELECT @@TRANCOUNT AS'@@TRANCOUNT value';
		DELETE transactions;
		BEGIN TRAN; 
			SELECT @@TRANCOUNT AS'@@TRANCOUNT value'; 
			DELETE accounts;
		COMMIT TRAN;
		SELECT @@TRANCOUNT AS'@@TRANCOUNT value';
	COMMIT TRAN;
	SELECT @@TRANCOUNT AS'@@TRANCOUNT value';

## Savepoint
	BEGIN TRAN;   
		SAVE TRAN savepoint1;
		INSERTINTO customers VALUES ('Mark', 'Davis', 'markdavis@mail.com', '555909090');   
		SAVE TRAN savepoint2;
		INSERTINTO customers VALUES ('Zack', 'Roberts', 'zackroberts@mail.com', '555919191');
		ROLLBACK TRAN savepoint2;
		ROLLBACK TRAN savepoint1;   
		SAVE TRAN savepoint3;
		INSERTINTO customers VALUES ('Jeremy', 'Johnsson', 'jeremyjohnsson@mail.com', '555929292');
	COMMIT TRAN;
	
## XACT_APORT, XACT_STATE
	SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRAN;
			INSERT INTO customers 
				VALUES ('Mark', 'Davis', 'markdavis@mail.com', '555909090');
			INSERT INTO customers 
				VALUES ('Dylan', 'Smith', 'dylansmith@mail.com', '555888999'); -- ERROR!
		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() = -1
			ROLLBACK TRAN;    
		IF XACT_STATE() = 1
			COMMIT TRAN;
		SELECT ERROR_MESSAGE() AS Error_message;
	END CATCH

## Isolation Levels
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT current_balance
FROM accounts 
WHERE account_id = 5;

* READ UNCOMMITTED
* READ COMMITTED
* REPEATABLE READ
* SERIALIZABLE
* SNAPSHOT

## Snapshot
	SELECT *
-- Avoid being blocked
		FROM transactions WITH (NOLOCK)
	WHERE account_id = 1
