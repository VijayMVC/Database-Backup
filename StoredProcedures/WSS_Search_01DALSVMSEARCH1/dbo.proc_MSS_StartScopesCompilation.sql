/****** Object:  StoredProcedure [dbo].[proc_MSS_StartScopesCompilation]    Script Date: 5/15/2018 12:13:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_StartScopesCompilation
AS
    UPDATE
        dbo.MSSScopesSystem
    SET
        StartCompilation = 1
    RETURN @@ERROR

GO
