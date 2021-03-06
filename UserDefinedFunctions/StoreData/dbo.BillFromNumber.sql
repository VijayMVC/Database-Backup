/****** Object:  UserDefinedFunction [dbo].[BillFromNumber]    Script Date: 5/15/2018 12:15:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION BillFromNumber (@BillNumber INT)
RETURNS TABLE
AS
RETURN

SELECT TOP 1 *
FROM   TransHeader
WHERE  BillNumber = @BillNumber
       AND TransactionType IN (8,10);

GO
