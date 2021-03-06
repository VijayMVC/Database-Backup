/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteManagedProperty]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteManagedProperty
@PID int
as
DECLARE @RetVal int  SET @RetVal = 0
DECLARE @Mappings int Set @Mappings = 0

BEGIN TRANSACTION
Select @Mappings = Count(*) from MSSSchemaPropertyMappings where PID = @PID
if @Mappings > 0
BEGIN
   ROLLBACK TRANSACTION
   return 11
END

delete MSSManagedProperties  where @PID = PID
SELECT @RetVal = @@ERROR

update MSSSchemaHighLevelProps set LastManagedPropDeleted = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
   SELECT @RetVal = @@ERROR

if ( 0 = @RetVal )
   COMMIT TRANSACTION
else
   ROLLBACK TRANSACTION
return @RetVal

GO
