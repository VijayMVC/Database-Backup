/****** Object:  StoredProcedure [dbo].[mdm_UpdateArtRevisions]    Script Date: 5/15/2018 12:10:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE mdm_UpdateArtRevisions
(
	@HIDList varchar(75)
)
AS
UPDATE OrderDtlProofSet
SET
	OrdPSChangeRequest = null
WHERE
	OrdHID IN (@HIDList)



GO
