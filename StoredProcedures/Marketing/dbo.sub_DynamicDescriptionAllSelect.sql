/****** Object:  StoredProcedure [dbo].[sub_DynamicDescriptionAllSelect]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_DynamicDescriptionAllSelect AS
SET NOCOUNT ON
SELECT 
	DynDescId,
	DynDescFilename,
	DynDescCategory,
	DynDescDescription
FROM
	DynamicDescription



GO
