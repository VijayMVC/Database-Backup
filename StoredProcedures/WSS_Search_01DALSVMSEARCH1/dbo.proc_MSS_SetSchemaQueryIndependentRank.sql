/****** Object:  StoredProcedure [dbo].[proc_MSS_SetSchemaQueryIndependentRank]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetSchemaQueryIndependentRank
@PID                                int,
@QueryIndependentRank   bit
as
DECLARE @RetVal int  SET @RetVal = 0
BEGIN TRANSACTION
update MSSManagedProperties Set QueryIndependentRank = @QueryIndependentRank
                    where @PID = PID
SELECT @RetVal = @@ERROR
update MSSSchemaHighLevelProps set LastManagedProp = CURRENT_TIMESTAMP
if ( 0 != @RetVal )
     SELECT @RetVal = @@ERROR
if ( 0 = @RetVal )
     COMMIT TRANSACTION
else
     ROLLBACK TRANSACTION
return @RetVal

GO
