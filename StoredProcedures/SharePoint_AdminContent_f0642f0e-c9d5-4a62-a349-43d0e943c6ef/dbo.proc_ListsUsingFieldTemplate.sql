/****** Object:  StoredProcedure [dbo].[proc_ListsUsingFieldTemplate]    Script Date: 5/15/2018 12:12:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_ListsUsingFieldTemplate(
    @SiteId uniqueidentifier,
    @FieldId tContentTypeId,
    @BaseTypes int
    )
AS
    SET NOCOUNT ON
    IF @BaseTypes = 0
    BEGIN    
        SELECT
            WebId,
            ListId
        FROM
            ContentTypeUsage
        WHERE
            SiteId = @SiteId AND
            ContentTypeId = @FieldId AND
            IsFieldId = 0
        ORDER BY
            WebId,
            ListId
    END
    ELSE
    BEGIN
        (SELECT
            WebId,
            ListId
        FROM
            ContentTypeUsage
        WHERE
            SiteId = @SiteId AND
            ContentTypeId = @FieldId AND
            IsFieldId = 0
        UNION
        (SELECT
            Lists.tp_WebId AS WebId,
            Lists.tp_Id AS ListId
        FROM
            Lists
        JOIN
    	Webs
        ON
    	Webs.Id = Lists.tp_WebId AND
    	Webs.SiteId = @SiteId
        WHERE
            tp_BaseType < 31 AND
            (POWER(2, tp_BaseType) & @BaseTypes) <> 0))
        ORDER BY
            WebId
    END

GO
