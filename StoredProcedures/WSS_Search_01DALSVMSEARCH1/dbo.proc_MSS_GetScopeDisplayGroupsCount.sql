/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopeDisplayGroupsCount]    Script Date: 5/15/2018 12:13:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopeDisplayGroupsCount(
    @Count int OUTPUT )
AS
    SELECT
        @Count = COUNT(*)
    FROM
        dbo.MSSScopeDisplayGroups
    RETURN @@ERROR

GO
