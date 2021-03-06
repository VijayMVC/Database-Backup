/****** Object:  StoredProcedure [dbo].[proc_MSS_SetManagedPropertyLastModified]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetManagedPropertyLastModified
@PID                       int
as
DECLARE @RetVal int  SET @RetVal = 0
DECLARE @Modified datetime SET @Modified = CURRENT_TIMESTAMP

BEGIN TRANSACTION
update MSSManagedProperties Set LastModified = @Modified
                    where @PID = PID
SELECT @RetVal = @@ERROR

update MSSSchemaHighLevelProps set LastManagedProp = @Modified

if ( 0 != @RetVal )
   SELECT @RetVal = @@ERROR

if ( 0 = @RetVal )
   COMMIT TRANSACTION
else
   ROLLBACK TRANSACTION
return @RetVal

GO
