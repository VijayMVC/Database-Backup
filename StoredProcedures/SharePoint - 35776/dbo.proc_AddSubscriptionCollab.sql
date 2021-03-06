/****** Object:  StoredProcedure [dbo].[proc_AddSubscriptionCollab]    Script Date: 5/15/2018 12:11:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddSubscriptionCollab(
    @SiteId         uniqueidentifier,
    @NotifyFreq     int,
    @WebId          uniqueidentifier,
    @Url            nvarchar(260),
    @EventType      int,
    @UserId         int,
    @SiteUrl        nvarchar(64),
    @WebUrl         nvarchar(256),
    @WebTitle       nvarchar(255),
    @WebLanguage    int,
    @WebLocale      int,
    @WebTimeZone    smallint,
    @WebTime24      bit,
    @WebCalendarType        smallint,
    @WebAdjustHijriDays     smallint,
    @Max            int)
AS
    SET NOCOUNT ON
    DECLARE @DirName    nvarchar(256)
    DECLARE @LeafName   nvarchar(128)
    EXEC proc_SplitUrl @Url, @DirName OUTPUT, @LeafName OUTPUT
    DECLARE @ListId     uniqueidentifier
    DECLARE @ItemId     int
    DECLARE @DocId      uniqueidentifier
    SELECT
        @ListId         = Docs.ListId,
        @ItemId         = Docs.DoclibRowId,
        @DocId          = Docs.Id
    FROM
        Docs
    INNER JOIN
        Lists
    ON
        Docs.ListId     = Lists.tp_ID
    WHERE
        Docs.SiteId     = @SiteId       AND
        Docs.DirName    = @DirName      AND
        Docs.LeafName   = @LeafName     AND
        ((Docs.Type     = 0  AND
            Docs.DoclibRowId  IS NOT NULL)    OR
            (Docs.Type     = 1   AND
                Docs.Id       = Lists.tp_RootFolder))
    IF (@ListId IS NULL)
        RETURN 3
    DECLARE @ItemDocId  uniqueidentifier
    IF (@ItemId IS NOT NULL)
        SET @ItemDocId  = @DocId
    DECLARE @ListUrl        nvarchar(256)
    DECLARE @ListTitle      nvarchar(255)
    DECLARE @ListBaseType   int
    DECLARE @ListServerTemplate int
    SELECT
        @ListUrl            = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,
        @ListTitle          = Lists.tp_Title,
        @ListBaseType       = Lists.tp_BaseType,
        @ListServerTemplate = Lists.tp_ServerTemplate
    FROM
        Lists
    INNER JOIN
        Docs
    ON
        Lists.tp_RootFolder = Docs.Id
    WHERE
        Lists.tp_WebId      = @WebId    AND
        Lists.tp_ID         = @ListId
    IF (@ListUrl IS NULL OR @ListTitle IS NULL)
        RETURN 3
    DECLARE @ReturnCode     int
    EXEC @ReturnCode = proc_AddSubscription
        @SiteId,
        @NotifyFreq,
        @WebId,
        @ListId,
        @ItemId,
        @EventType,
        @UserId,
        @SiteUrl,
        @WebUrl,
        @WebTitle,
        @WebLanguage,
        @WebLocale,
        @WebTimeZone,
        @WebTime24,
        @WebCalendarType,
        @WebAdjustHijriDays,
        @ListUrl,
        @ListTitle,
        @ListBaseType,
        @ListServerTemplate,
        NULL,
        NULL,
        1,  
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        @ItemDocId,
        @Max,
        NULL,
        NULL,
        NULL
    RETURN @ReturnCode

GO
