/****** Object:  StoredProcedure [dbo].[proc_SecDecCurrentUsersCount]    Script Date: 5/15/2018 12:12:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecDecCurrentUsersCount(
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    BEGIN TRAN
    DECLARE @UsersCount int
    SELECT
        @UsersCount = UsersCount
    FROM
        Sites WITH (UPDLOCK)
    WHERE
        Sites.Id = @SiteId
    UPDATE
        Sites
    SET
        UsersCount = @UsersCount - 1
    WHERE
        Sites.Id = @SiteId    
    COMMIT TRAN

GO
