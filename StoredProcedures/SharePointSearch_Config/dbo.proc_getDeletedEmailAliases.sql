/****** Object:  StoredProcedure [dbo].[proc_getDeletedEmailAliases]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_getDeletedEmailAliases AS
    SET NOCOUNT ON
    SELECT
        Alias,
        ListId
    FROM
        dbo.EmailEnabledLists
    WHERE
        Deleted = 1
    RETURN 0

GO
