/****** Object:  StoredProcedure [dbo].[fp_GetOrdered]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE fp_GetOrdered
(   @Order varchar(20)   )
AS

DECLARE @str nvarchar(200)

SELECT @str = 'SELECT I.ID, I.FirstName, I.LastName, I.Store, I.Email, S.Invoiced, S.Shipped FROM FP_Info I, FP_Shipping S WHERE I.Shipping = 1 AND I.ID = S.InfoID '
SELECT @str = @str + 'ORDER BY ' + @Order
EXEC sp_executesql @str

GO
