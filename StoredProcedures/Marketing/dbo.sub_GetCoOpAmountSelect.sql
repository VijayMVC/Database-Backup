/****** Object:  StoredProcedure [dbo].[sub_GetCoOpAmountSelect]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetCoOpAmountSelect
(
	@Year int,
	@CoOpID int	
)
 AS
SELECT 
	B.CoOpID, 
	B.CoOpName ,
	A.AmountEarned,
	A.AmountAvailable,
	A.Year
FROM
	CoOpAmounts A
INNER JOIN
	CoOps B
ON
	A.CoOpID = B.CoOpID 
WHERE
	
	A.CoOpID = @CoOpID
AND
            A.Year = @Year
ORDER BY B.CoOpName



GO
