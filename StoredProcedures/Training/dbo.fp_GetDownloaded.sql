/****** Object:  StoredProcedure [dbo].[fp_GetDownloaded]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE fp_GetDownloaded 
(   @Order varchar(20)   )
AS

DECLARE @str nvarchar(200)

SELECT @str = 'SELECT ID, FirstName, LastName, Store, Email FROM FP_Info WHERE Shipping = 0 '
SELECT @str = @str + 'ORDER BY ' + @Order
EXEC sp_executesql @str

GO
