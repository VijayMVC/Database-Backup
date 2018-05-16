/****** Object:  StoredProcedure [dbo].[proc_MSS_SetManagedPropertyInternalProperty]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetManagedPropertyInternalProperty
@PID int,
@NoDelete bit,
@NoMap bit,
@Hidden bit
AS
DECLARE @RetVal int  SET @RetVal = 0
DECLARE @Modified datetime SET @Modified = CURRENT_TIMESTAMP

Update [dbo].[MSSManagedProperties]
    Set NoDelete = @NoDelete,
        NoMap = @NoMap,
        Hidden = @Hidden,
        LastModified = @Modified
    where PID = @PID
SELECT @RetVal = @@ERROR
Update MSSSchemaHighLevelProps set LastManagedProp = @Modified
if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR

return @RetVal

GO
