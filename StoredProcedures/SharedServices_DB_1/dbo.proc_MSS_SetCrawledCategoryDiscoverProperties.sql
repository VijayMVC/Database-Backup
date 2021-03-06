/****** Object:  StoredProcedure [dbo].[proc_MSS_SetCrawledCategoryDiscoverProperties]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetCrawledCategoryDiscoverProperties
@Propset uniqueidentifier,
@DiscoverNewProperties bit
AS

DECLARE @RetVal int  SET @RetVal = 0

Update MSSCrawledPropCategory Set DiscoverNewProperties = @DiscoverNewProperties
            where Propset = @Propset  
SELECT @RetVal = @@ERROR

Update MSSSchemaHighLevelProps set LastCatChange = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR

return @RetVal

GO
