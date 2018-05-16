/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteCrawledCategory]    Script Date: 5/15/2018 12:13:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteCrawledCategory
@Propset uniqueidentifier
AS
DECLARE @RetVal int  SET @RetVal = 0
Delete MSSCrawledPropCategory where Propset = @Propset  
SELECT @RetVal = @@ERROR
Update MSSSchemaHighLevelProps set LastCatChange = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR
return @RetVal

GO
