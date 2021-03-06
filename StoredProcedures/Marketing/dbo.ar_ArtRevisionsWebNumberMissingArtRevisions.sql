/****** Object:  StoredProcedure [dbo].[ar_ArtRevisionsWebNumberMissingArtRevisions]    Script Date: 5/15/2018 12:10:08 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE ar_ArtRevisionsWebNumberMissingArtRevisions
(
	@webNumber int
)
AS
SELECT 
	ArtTypeID,
	Name,
	Folder,
	FileNameMask,
	IsApprovable
FROM 
	ar_ArtTypes
WHERE
	ArtTypeID NOT IN 
			(
			SELECT
				 ArtTypeID 
			FROM
				 ar_ArtRevisions
			 WHERE 
				WebNumber = @webnumber)



GO
