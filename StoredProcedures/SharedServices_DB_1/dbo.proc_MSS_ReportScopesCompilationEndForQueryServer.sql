/****** Object:  StoredProcedure [dbo].[proc_MSS_ReportScopesCompilationEndForQueryServer]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ReportScopesCompilationEndForQueryServer
AS
    UPDATE
        dbo.MSSScopesSystem
    SET
        QueryServersDone = QueryServersDone + 1

GO
