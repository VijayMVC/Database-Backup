/****** Object:  StoredProcedure [dbo].[proc_NavStructLockWebsDirtyPageDependents]    Script Date: 5/15/2018 12:12:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_NavStructLockWebsDirtyPageDependents(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier)
AS
    DECLARE @WebCount int
    SELECT
         @WebCount= COUNT(*)
    FROM
        Webs WITH (UPDLOCK)
    WHERE
        Id = @WebId OR
        NavParentWebId = @WebId

GO
