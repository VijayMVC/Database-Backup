/****** Object:  StoredProcedure [dbo].[proc_dropEmailEnabledListsByWeb]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_dropEmailEnabledListsByWeb
(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier
) AS
    SET NOCOUNT ON
    DELETE FROM
        dbo.EmailEnabledLists
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        Deleted = 0
    RETURN 0 

GO
