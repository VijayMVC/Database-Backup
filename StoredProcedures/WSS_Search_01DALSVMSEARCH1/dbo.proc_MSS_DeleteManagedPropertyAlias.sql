/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteManagedPropertyAlias]    Script Date: 5/15/2018 12:13:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteManagedPropertyAlias
@PID int,
@Alias nvarchar (2048) 
as
DECLARE @RetVal int  SET @RetVal = 0
BEGIN TRANSACTION
delete MSSManagedPropAliases  where @PID = PID and @Alias = alias
SELECT @RetVal = @@ERROR
if ( 0 = @RetVal )
    exec @RetVal = proc_MSS_SetManagedPropertyLastModified @PID
if ( 0 = @RetVal )
   COMMIT TRANSACTION
else
   ROLLBACK TRANSACTION
return @RetVal

GO
