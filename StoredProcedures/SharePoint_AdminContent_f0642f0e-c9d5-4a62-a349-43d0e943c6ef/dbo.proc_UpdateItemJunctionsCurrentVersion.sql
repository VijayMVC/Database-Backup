/****** Object:  StoredProcedure [dbo].[proc_UpdateItemJunctionsCurrentVersion]    Script Date: 5/15/2018 12:13:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_UpdateItemJunctionsCurrentVersion(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @NewUIVersion int,
    @Level tinyint = 1
    )
AS
    SET NOCOUNT ON
    UPDATE 
        UserDataJunctions
    SET
        tp_UIVersion = @NewUIVersion
    WHERE
        tp_SiteId = @SiteId AND
        tp_DirName = @DirName AND
        tp_LeafName = @LeafName AND
        tp_Level = @Level        

GO
