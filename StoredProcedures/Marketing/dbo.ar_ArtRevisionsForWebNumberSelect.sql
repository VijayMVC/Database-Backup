/****** Object:  StoredProcedure [dbo].[ar_ArtRevisionsForWebNumberSelect]    Script Date: 5/15/2018 12:10:08 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE ar_ArtRevisionsForWebNumberSelect
(
	@WebNumber int
)
 AS
SELECT 
	A.WebNumber,
	A.LastUpdated,
	A.ArtTypeID,
	B.Name,
	B.Folder,
	B.FileNameMask,
	B.IsApprovable,
	A.ArtRevisionStatusID,
	C.Description,
	C.Enum
FROM
	ar_ArtRevisions A
INNER JOIN
	ar_ArtTypes B
ON
	a.ArtTypeID = B.ArtTypeID
INNER JOIN 
	ar_ArtRevisionStatus C
ON
	A.ArtRevisionStatusID = C.ArtRevisionStatusID
WHERE 
	A.WebNumber = @WebNumber



GO
