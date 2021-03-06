/****** Object:  StoredProcedure [dbo].[proc_UpdateSubsListSettings]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateSubsListSettings(
    @SiteId         uniqueidentifier,
    @ListId         uniqueidentifier,
    @ListTitle      nvarchar(255),
    @ReadSecurity   int,
    @RemoveSystemAlerts bit)
AS
    SET NOCOUNT ON
    IF (@ReadSecurity = 0x00000002)
    BEGIN
        DELETE
            ImmedSubscriptions
        WHERE
            SiteId         = @SiteId        AND
            ListId         = @ListId
        DELETE
            SchedSubscriptions
        WHERE
            SiteId         = @SiteId        AND
            ListId         = @ListId
    END
    ELSE
    BEGIN
        UPDATE
            ImmedSubscriptions
        SET
            ListTitle      = ISNULL(@ListTitle, ListTitle)
        WHERE
            SiteId         = @SiteId        AND
            ListId         = @ListId
        UPDATE
            SchedSubscriptions
        SET
            ListTitle      = ISNULL(@ListTitle, ListTitle)
        WHERE
            SiteId         = @SiteId        AND
            ListId         = @ListId
        IF (@RemoveSystemAlerts = 1)
        BEGIN
            DELETE
                ImmedSubscriptions
            WHERE
                SiteId         = @SiteId        AND
                ListId         = @ListId        AND
                UserId         = 0              AND
                AlertType & 536870912 = 536870912
        END
    END
    RETURN 0

GO
