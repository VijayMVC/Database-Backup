/****** Object:  StoredProcedure [dbo].[sub_CoOpFromWebNumberSelect]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE sub_CoOpFromWebNumberSelect
(	
	@webnumber int
)

 AS

SELECT
	CoOpID
FROM	
	CoOpStores
WHERE
	WebNumber = @webnumber
GO
