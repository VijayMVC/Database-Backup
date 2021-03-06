/****** Object:  StoredProcedure [dbo].[proc_UpdateEmailEnabledSettings]    Script Date: 5/15/2018 12:13:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateEmailEnabledSettings(
    @SiteId         uniqueidentifier,
    @WebId          uniqueidentifier,
    @EmailEnabled   bit)
AS
    SET NOCOUNT ON
    DECLARE @SiteEmailEnabled bit
    DECLARE @WebEmailEnabled bit
    SET @SiteEmailEnabled = @EmailEnabled
    SET @WebEmailEnabled = @EmailEnabled
    IF @EmailEnabled = 0
    BEGIN
        SELECT
            @WebEmailEnabled = CASE WHEN EXISTS
            (SELECT *
                FROM
                    Lists
                WHERE
                    tp_WebId = @WebId AND
                    tp_Flags & 0x10000 = 0x10000)
        THEN
            1
        ELSE
            0
        END
        SET @SiteEmailEnabled = @WebEmailEnabled
        IF @SiteEmailEnabled = 0
        BEGIN
            SELECT
                @SiteEmailEnabled = CASE WHEN EXISTS
                (SELECT *
                    FROM
                        Lists INNER JOIN Webs
                    ON
                        Lists.tp_WebId = Webs.Id AND
                        Webs.SiteId = @SiteId
                    WHERE
                        Lists.tp_WebId = @WebId AND
                        Lists.tp_Flags & 0x10000 =
                            0x10000)
            THEN
                1
            ELSE
                0
            END
        END
    END
    UPDATE
        Sites
    SET
        EmailEnabled = @SiteEmailEnabled
    WHERE
        Id = @SiteId
    UPDATE
        Webs
    SET
        EmailEnabled = @WebEmailEnabled
    WHERE
        Id = @WebId AND
        SiteId = @SiteId
    RETURN 0

GO
