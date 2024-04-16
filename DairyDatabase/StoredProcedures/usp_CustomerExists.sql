CREATE PROCEDURE [dbo].[usp_CustomerExists]
	@email VARCHAR(50),
	@password VARCHAR(200)
/*
<documentation>
	<summary>Check the the customer exists or not<summary>
	<returns>true or false<returns>
	<author>Srivatsa<author>
	<created>2024-04-16<created>
	<modified>-<modified>
</documentation>
*/
AS
SET NOCOUNT ON;

BEGIN
		IF EXISTS ( SELECT 1 FROM Customer WHERE Email = @email AND Password = @password)
			SELECT 1
		ELSE
			SELECT 0
END
GO
