/****** Object:  StoredProcedure [dbo].[fp_GetSingleShipping]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE fp_GetSingleShipping 
(   @ID int   )

AS

SELECT *
FROM FP_Shipping
WHERE InfoID = @ID

GO
