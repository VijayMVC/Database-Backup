/****** Object:  StoredProcedure [dbo].[proc_markForDeletionEmailEnabledListsByWeb]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_markForDeletionEmailEnabledListsByWeb
(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier
) AS
    SET NOCOUNT ON
    UPDATE
        dbo.EmailEnabledLists
    SET
        Deleted = 1
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId
    RETURN 0 

GO
