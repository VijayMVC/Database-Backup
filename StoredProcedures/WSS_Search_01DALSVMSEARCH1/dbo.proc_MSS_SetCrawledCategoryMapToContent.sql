/****** Object:  StoredProcedure [dbo].[proc_MSS_SetCrawledCategoryMapToContent]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetCrawledCategoryMapToContent
@Propset uniqueidentifier,
@MapToContents bit
AS
DECLARE @RetVal int  SET @RetVal = 0
Update MSSCrawledPropCategory Set MapToContents = @MapToContents
            where Propset = @Propset  
SELECT @RetVal = @@ERROR
Update MSSSchemaHighLevelProps set LastCatChange = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR
return @RetVal

GO
