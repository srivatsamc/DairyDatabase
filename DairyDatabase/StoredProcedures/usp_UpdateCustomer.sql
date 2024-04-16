CREATE PROCEDURE [dbo].[usp_UpdateCustomer]
	@firstName VARCHAR(100),
	@lastName VARCHAR(100),
	@email VARCHAR(50),
	@password VARCHAR(200),
	@contact NCHAR(10),
	@address VARCHAR(MAX),
	@customerId INT
/*
<documentation>
	<summary>Update the existing customer<summary>
	<returns>Identity column number<returns>
	<author>Srivatsa<author>
	<created>2024-04-16<created>
	<modified>-<modified>
</documentation>
*/
AS
SET NOCOUNT ON;

DECLARE 
	@ErrorMessage NVARCHAR(1000),
	@ErrorSeverity INT,
	@ErrorState INT;
BEGIN TRANSACTION
	BEGIN TRY
			IF NOT EXISTS (SELECT 1 FROM Customer WHERE Email = @email AND Password = @password)
				BEGIN
					UPDATE Customer SET
					Firstname = @firstName,
					Lastname = @lastName,
					Email = @email,
					Password = @password,
					Contact = @contact,
					Address = @address
					WHERE Id = @customerId

					SELECT 1

					COMMIT TRANSACTION
				END
			ELSE
				SELECT 0
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE()
		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
GO

