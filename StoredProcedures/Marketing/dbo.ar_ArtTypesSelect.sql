/****** Object:  StoredProcedure [dbo].[ar_ArtTypesSelect]    Script Date: 5/15/2018 12:10:08 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE ar_ArtTypesSelect AS
SELECT
	ArtTypeID,
	Name,
	Folder,
	FileNameMask,
	IsApprovable
FROM 
	ar_ArtTypes



GO
