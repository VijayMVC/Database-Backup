/****** Object:  UserDefinedFunction [dbo].[BillIDFromNumber]    Script Date: 5/15/2018 12:15:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION BillIDFromNumber (@BillNumber INT)
RETURNS INT
AS
BEGIN
  DECLARE @Result INT;
  SET @Result = (SELECT TOP 1 ID
                 FROM   TransHeader
                 WHERE  BillNumber = @BillNumber
                        AND TransactionType IN (8,10));
  Return(@Result);
END

GO
