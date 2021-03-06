/****** Object:  StoredProcedure [dbo].[ar_ArtRevisionsByStatusesSelect]    Script Date: 5/15/2018 12:10:07 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE ar_ArtRevisionsByStatusesSelect
(
  @statuscodes varchar(100)
)

AS

DECLARE @sql nvarchar(1000)

SELECT @sql = 'SELECT A.WebNumber, A.LastUpdated, 	A.ArtTypeID, B.Name, B.Folder, B.FileNameMask, 	B.IsApprovable, 	A.ArtRevisionStatusID, C.Description, C.Enum, A.TransactionID, D.Comment  '
SELECT @sql = @sql + 'FROM ar_ArtRevisions A INNER JOIN ar_ArtTypes B ON a.ArtTypeID = B.ArtTypeID INNER JOIN  ar_ArtRevisionStatus C  '
SELECT @sql = @sql + ' ON A.ArtRevisionStatusID = C.ArtRevisionStatusID '
SELECT @sql = @sql + 'LEFT JOIN ar_ArtRevisionComments D ON D.transactionID = A.TransactionID '
SELECT @sql = @sql + 'WHERE C.ArtRevisionStatusID in (' + @statuscodes +')  '
SELECT @sql = @sql + 'ORDER BY A.LastUpdated '

EXEC sp_executesql @sql
GO
