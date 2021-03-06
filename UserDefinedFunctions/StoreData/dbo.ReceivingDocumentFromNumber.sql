/****** Object:  UserDefinedFunction [dbo].[ReceivingDocumentFromNumber]    Script Date: 5/15/2018 12:15:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION ReceivingDocumentFromNumber (@ReceivingDocumentNumber INT)
RETURNS TABLE
AS
RETURN

SELECT TOP 1 *
FROM   TransHeader
WHERE  ReceivingDocNumber = @ReceivingDocumentNumber
       AND TransactionType IN (9);

GO
