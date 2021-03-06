/****** Object:  StoredProcedure [dbo].[proc_InitCachedStructure]    Script Date: 5/15/2018 12:12:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_InitCachedStructure(
    @WebId uniqueidentifier
    )
AS
    SET NOCOUNT ON
    UPDATE
        Webs
    SET
        CachedNav = NULL,
        CachedInheritedNav = NULL,
        CachedNavScope = NULL,
        CachedNavDirty = 0
    WHERE
        Id = @WebId
    RETURN 0

GO
