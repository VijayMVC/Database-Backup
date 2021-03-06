/****** Object:  UserDefinedFunction [dbo].[PurchaseOrderIDFromNumber]    Script Date: 5/15/2018 12:15:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION PurchaseOrderIDFromNumber (@PurchaseOrderNumber INT)
RETURNS INT
AS
BEGIN
  DECLARE @Result INT;
  SET @Result = (SELECT TOP 1 ID
                 FROM   TransHeader
                 WHERE  PurchaseOrderNumber = @PurchaseOrderNumber
                        AND TransactionType IN (7));
  Return(@Result);
END

GO
