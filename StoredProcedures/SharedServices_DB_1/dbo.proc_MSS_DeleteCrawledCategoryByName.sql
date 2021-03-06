/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteCrawledCategoryByName]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteCrawledCategoryByName
@Name nvarchar(64)
AS

DECLARE @RetVal int  SET @RetVal = 0

Delete MSSCrawledPropCategory where CategoryName = @Name  
SELECT @RetVal = @@ERROR

Update MSSSchemaHighLevelProps set LastCatChange = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR

return @RetVal

GO
