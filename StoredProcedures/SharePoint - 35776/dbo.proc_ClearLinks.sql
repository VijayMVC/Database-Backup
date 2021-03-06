/****** Object:  StoredProcedure [dbo].[proc_ClearLinks]    Script Date: 5/15/2018 12:11:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ClearLinks(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint,
    @FieldId uniqueidentifier)
AS
    SET NOCOUNT ON
    DELETE FROM
        Links
    WHERE
        Links.SiteId = @SiteId AND
        Links.DirName = @DirName AND
        Links.LeafName = @LeafName AND
        Links.Level = @Level AND
        Links.FieldId = @FieldId AND
        Links.WebPartId IS NULL

GO
