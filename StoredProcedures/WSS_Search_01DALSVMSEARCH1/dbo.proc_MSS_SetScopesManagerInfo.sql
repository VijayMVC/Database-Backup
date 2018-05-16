/****** Object:  StoredProcedure [dbo].[proc_MSS_SetScopesManagerInfo]    Script Date: 5/15/2018 12:13:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetScopesManagerInfo(
    @CompilationScheduleType smallint,
    @CustomCompilationSchedule nvarchar( 60 ) )
AS
    UPDATE
        dbo.MSSScopesSystem
    SET
        CompilationScheduleType = @CompilationScheduleType,
        CustomCompilationSchedule = @CustomCompilationSchedule
    RETURN @@ERROR

GO
