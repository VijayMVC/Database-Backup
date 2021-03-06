/****** Object:  UserDefinedFunction [dbo].[EstimateFromNumber]    Script Date: 5/15/2018 12:15:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION EstimateFromNumber (@EstimateNumber INT)
RETURNS TABLE
AS
RETURN

SELECT TOP 1 *
FROM   TransHeader
WHERE  EstimateNumber = @EstimateNumber
       AND TransactionType IN (2);

GO
