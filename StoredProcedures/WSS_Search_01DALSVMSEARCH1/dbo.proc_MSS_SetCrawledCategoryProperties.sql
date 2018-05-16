/****** Object:  StoredProcedure [dbo].[proc_MSS_SetCrawledCategoryProperties]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetCrawledCategoryProperties
@Propset uniqueidentifier,
@DiscoverNewProperties bit,
@MapToContents bit,
@FullTextQueriable bit,
@Retrievable bit
AS
DECLARE @RetVal int  SET @RetVal = 0
Update MSSCrawledPropCategory Set DiscoverNewProperties = @DiscoverNewProperties,
                                  MapToContents = @MapToContents,
                                  FullTextQueriable = @FullTextQueriable,
                                  Retrievable = @Retrievable
            where Propset = @Propset  
SELECT @RetVal = @@ERROR
Update MSSSchemaHighLevelProps set LastCatChange = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR
return @RetVal

GO
