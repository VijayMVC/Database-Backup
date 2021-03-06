/****** Object:  StoredProcedure [dbo].[proc_GenerateWebAncestry]    Script Date: 5/15/2018 12:12:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GenerateWebAncestry(
    @WebId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @ChildWebId uniqueidentifier
    DECLARE @CurrentWebId uniqueidentifier
    DECLARE @ParentWebId uniqueidentifier
    DECLARE @RelativeUrlOfParent nvarchar(260)
    DECLARE @Depth int
    DECLARE @tblWalk TABLE
    (
        Depth int,
        WebId uniqueidentifier,
        RelativeUrlOfParent nvarchar(260),
        PRIMARY KEY CLUSTERED(Depth, [WebId])
    )
    SET @Depth = 0
    SET @CurrentWebId = @WebId
    WHILE (@CurrentWebId IS NOT NULL AND @Depth < 131)
    BEGIN
        SELECT
            @ParentWebId = CASE
                WHEN
                    Webs.Ancestry IS NULL
                THEN
                    P.[Id]
                ELSE
                    NULL
                END,
            @RelativeUrlOfParent = CASE
                WHEN
                    P.FullUrl IS NULL OR (DATALENGTH(P.FullUrl) = 0)
                THEN
                    Webs.FullUrl
                ELSE
                    SUBSTRING(Webs.FullUrl,
                              LEN(P.FullUrl) + 2,
                              260)
                END
        FROM
            Webs
        LEFT OUTER JOIN
            Webs AS P
        ON
            Webs.ParentWebId = P.[Id]
        WHERE
            Webs.[Id] = @CurrentWebId
        IF (@ChildWebId IS NOT NULL)
        BEGIN
            INSERT INTO @tblWalk(
                Depth,
                WebId,
                RelativeUrlOfParent)
            VALUES (
                @Depth,
                @ChildWebId,
                @RelativeUrlOfParent)
        END
        SET @ChildWebId = @CurrentWebId
        SET @CurrentWebId = @ParentWebId
        SET @Depth = @Depth + 1
    END
    IF @CurrentWebId IS NOT NULL
    BEGIN
        RETURN 3
    END
    WHILE (@Depth > 0)
    BEGIN
        UPDATE
            Webs
        SET
            Ancestry =
                CASE WHEN P.Ancestry IS NULL THEN
                    CONVERT(varbinary(16), P.Id) + CONVERT(varbinary(4), N';#') + CONVERT(varbinary(2), CASE WHEN P.NavParentWebId IS NULL THEN N'U' ELSE N'I' END) + CONVERT(varbinary(4), N';#') + CONVERT(varbinary(510), REPLACE(P.Title, N';', N';;')) + CONVERT(varbinary(4), N';#') + CONVERT(varbinary(520), CASE WHEN (DATALENGTH(T.RelativeUrlOfParent) = 0) THEN N'/' ELSE REPLACE(T.RelativeUrlOfParent, N';', N';;') END)
                ELSE
                    SUBSTRING(P.Ancestry, 1, DATALENGTH(P.Ancestry)) +
                    CONVERT(varbinary(8), N';#;#') +
                    CONVERT(varbinary(16), P.Id) + CONVERT(varbinary(4), N';#') + CONVERT(varbinary(2), CASE WHEN P.NavParentWebId IS NULL THEN N'U' ELSE N'I' END) + CONVERT(varbinary(4), N';#') + CONVERT(varbinary(510), REPLACE(P.Title, N';', N';;')) + CONVERT(varbinary(4), N';#') + CONVERT(varbinary(520), CASE WHEN (DATALENGTH(T.RelativeUrlOfParent) = 0) THEN N'/' ELSE REPLACE(T.RelativeUrlOfParent, N';', N';;') END)
                END
        FROM
            Webs
        INNER JOIN
            @tblWalk AS T
        ON
            T.WebId = Webs.[Id]
        INNER JOIN
            Webs AS P
        ON
            P.[Id] = Webs.ParentWebId
        WHERE
            T.Depth = @Depth AND
            Webs.Ancestry IS NULL AND
            Webs.ParentWebId IS NOT NULL
        SET @Depth = @Depth - 1
    END
    RETURN 0

GO
