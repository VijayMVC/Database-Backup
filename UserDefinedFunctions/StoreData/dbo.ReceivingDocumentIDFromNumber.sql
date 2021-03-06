/****** Object:  UserDefinedFunction [dbo].[ReceivingDocumentIDFromNumber]    Script Date: 5/15/2018 12:15:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION ReceivingDocumentIDFromNumber (@ReceivingDocumentNumber INT)
RETURNS INT
AS
BEGIN
  DECLARE @Result INT;
  SET @Result = (SELECT TOP 1 ID
                 FROM   TransHeader
                 WHERE  ReceivingDocNumber = @ReceivingDocumentNumber
                        AND TransactionType IN (9));
  Return(@Result);
END

GO
