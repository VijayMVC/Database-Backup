/****** Object:  StoredProcedure [dbo].[proc_MSS_SetCrawledPropertyVariantType]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetCrawledPropertyVariantType
@crawledPropId int,
@VariantType int
AS
DECLARE @RetVal int  SET @RetVal = 0
Update dbo.MSSCrawledProperties set VariantType = @VariantType,
                                    LastModified = CURRENT_TIMESTAMP
            where CrawledPropertyId = @crawledPropId
SELECT @RetVal = @@ERROR
Update MSSSchemaHighLevelProps set LastCPAddsBenignModified = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR
return @RetVal

GO
