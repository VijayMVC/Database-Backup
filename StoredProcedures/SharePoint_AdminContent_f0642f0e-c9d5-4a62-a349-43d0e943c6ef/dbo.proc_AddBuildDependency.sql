/****** Object:  StoredProcedure [dbo].[proc_AddBuildDependency]    Script Date: 5/15/2018 12:12:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddBuildDependency(
    @DocSiteId uniqueidentifier,
    @DocDirName  nvarchar(256),
    @DocLeafName nvarchar(128),
    @TargetDirName nvarchar(256),
    @TargetLeafName nvarchar(128),
    @DirectDependency bit
)
AS
    SET NOCOUNT ON
    INSERT INTO BuildDependencies (
        SiteId,
        DirName,
        LeafName,
        TargetDirName,
        TargetLeafName,
        DirectDependency)
    VALUES (
        @DocSiteId,
        @DocDirName,
        @DocLeafName,
        @TargetDirName,
        @TargetLeafName,
        @DirectDependency
    )
    RETURN 0

GO
