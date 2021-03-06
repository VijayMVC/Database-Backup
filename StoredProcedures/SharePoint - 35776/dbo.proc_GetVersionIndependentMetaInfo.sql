/****** Object:  StoredProcedure [dbo].[proc_GetVersionIndependentMetaInfo]    Script Date: 5/15/2018 12:12:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetVersionIndependentMetaInfo(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128))
AS
    SET NOCOUNT ON
    SELECT TOP 1
        UnVersionedMetaInfo,
        UnVersionedMetaInfoVersion
    FROM 
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName

GO
