/****** Object:  StoredProcedure [dbo].[proc_MSS_ReportScopesCompilationBegin]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ReportScopesCompilationBegin
AS
    UPDATE
        dbo.MSSScopesSystem
    SET
        CompilationState = 1,
        CompilationStartTime = GETUTCDATE(),
        CompilationPercentComplete = 0,
        QueryServersDone = 0

    RETURN @@ERROR

GO
