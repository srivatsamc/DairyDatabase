CREATE PROCEDURE [dbo].[usp_CustomerExists]
	@email VARCHAR(50),
	@isLogin INT = 1,
	@password VARCHAR(200)
/*
<documentation>
	<summary>Check the the customer exists or not<summary>
	<returns>true or false<returns>
	<author>Srivatsa<author>
	<created>2024-04-16<created>
	<modified>2024-04-17<modified>
</documentation>
*/
AS
SET NOCOUNT ON;

BEGIN
		IF (@isLogin = 1)
			BEGIN
				IF EXISTS(SELECT 1 FROM Customer WHERE Email = @email)
					SELECT 1
				ELSE
					SELECT 0
			END

		ELSE 
			BEGIN
				IF EXISTS ( SELECT 1 FROM Customer WHERE Email = @email AND Password = @password)
					SELECT 1
				ELSE
					SELECT 0
			END
END
GO
