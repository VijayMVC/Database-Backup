/****** Object:  StoredProcedure [dbo].[proc_DeleteDocBuildDependencySet]    Script Date: 5/15/2018 12:12:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteDocBuildDependencySet(
    @DocSiteId uniqueidentifier,
    @DocDirName  nvarchar(256),
    @DocLeafName nvarchar(128),
    @Level tinyint)
AS
    SET NOCOUNT ON
    BEGIN TRAN
    EXEC proc_UpdateDocBuildDependencySet
        @DocSiteId,
        @DocDirName,
        @DocLeafName,
        @Level,
        NULL
    DELETE 
        BuildDependencies
    WHERE 
        BuildDependencies.SiteId = @DocSiteId AND
        BuildDependencies.DirName = @DocDirName AND
        BuildDependencies.LeafName = @DocLeafName
    COMMIT
    RETURN 0

GO
