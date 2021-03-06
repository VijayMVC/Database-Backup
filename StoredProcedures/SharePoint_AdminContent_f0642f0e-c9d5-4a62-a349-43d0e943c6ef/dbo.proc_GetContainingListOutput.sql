/****** Object:  StoredProcedure [dbo].[proc_GetContainingListOutput]    Script Date: 5/15/2018 12:12:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetContainingListOutput(
    @SiteId uniqueidentifier,
    @WebId  uniqueidentifier,
    @Url nvarchar(260),
    @ListId uniqueidentifier OUTPUT,
    @BaseType int = NULL OUTPUT,
    @ExcludedType int = NULL OUTPUT,
    @bLockLists bit = 0,
    @ListFlags bigint = NULL OUTPUT)
AS
    DECLARE @iRet int
    EXEC @iRet = proc_GetContainingListCore @SiteId, @WebId, @Url, 0,
        @ListId OUTPUT,
        @BaseType OUTPUT,
        @ExcludedType OUTPUT,
        @bLockLists,
        @ListFlags OUTPUT
    RETURN @iRet

GO
