/****** Object:  StoredProcedure [dbo].[proc_putPendingDistributionList]    Script Date: 5/15/2018 12:13:07 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_putPendingDistributionList
(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @GroupName nvarchar(255),
    @ModifiedBy nvarchar(255)
) AS
    SET NOCOUNT ON
    BEGIN TRAN
    SELECT
        0
    FROM
        dbo.PendingDistributionLists WITH (UPDLOCK, SERIALIZABLE)
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        GroupName = @GroupName
    IF (@@rowcount = 0)
    BEGIN
        INSERT INTO dbo.PendingDistributionLists
        (
            SiteId,
            WebId,
            GroupName,
            ModifiedBy
        )
        VALUES
        (
            @SiteId,
            @WebId,
            @GroupName,
            @ModifiedBy
        )
    END
    COMMIT TRAN
    RETURN 0 

GO
