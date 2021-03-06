/****** Object:  StoredProcedure [dbo].[proc_FindDocs]    Script Date: 5/15/2018 12:11:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_FindDocs(
    @SiteId uniqueidentifier,
    @DirName1 nvarchar(256) = NULL,
    @LeafName1 nvarchar(128) = NULL,
    @DirName2 nvarchar(256) = NULL,
    @LeafName2 nvarchar(128) = NULL,
    @DirName3 nvarchar(256) = NULL,
    @LeafName3 nvarchar(128) = NULL,
    @DirName4 nvarchar(256) = NULL,
    @LeafName4 nvarchar(128) = NULL,
    @DirName5 nvarchar(256) = NULL,
    @LeafName5 nvarchar(128) = NULL,
    @DirName6 nvarchar(256) = NULL,
    @LeafName6 nvarchar(128) = NULL,
    @DirName7 nvarchar(256) = NULL,
    @LeafName7 nvarchar(128) = NULL,
    @DirName8 nvarchar(256) = NULL,
    @LeafName8 nvarchar(128) = NULL)
AS
    SET NOCOUNT ON
    DECLARE @DocList table (
        DirName nvarchar(256)
            COLLATE Latin1_General_CI_AS_KS_WS, 
        LeafName nvarchar(128)
            COLLATE Latin1_General_CI_AS_KS_WS,
        SeqId uniqueidentifier)
    IF @DirName1 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName1, @LeafName1, NEWID())
    IF @DirName2 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName2, @LeafName2, NEWID())
    IF @DirName3 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName3, @LeafName3, NEWID())
    IF @DirName4 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName4, @LeafName4, NEWID())
    IF @DirName5 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName5, @LeafName5, NEWID())
    IF @DirName6 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName6, @LeafName6, NEWID())
    IF @DirName7 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName7, @LeafName7, NEWID())
    IF @DirName8 IS NOT NULL
        INSERT INTO @DocList (DirName, LeafName, SeqId)
            VALUES (@DirName8, @LeafName8, NEWID())
    SELECT
        CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END AS FullName
    FROM
        @DocList DocList INNER JOIN Docs
    ON
        DocList.DirName = Docs.DirName AND
        DocList.LeafName = Docs.LeafName AND
        Docs.SiteId = @SiteId AND
        Docs.Level = 1
    RETURN 0

GO
