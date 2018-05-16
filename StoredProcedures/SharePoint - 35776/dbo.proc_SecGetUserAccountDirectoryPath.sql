/****** Object:  StoredProcedure [dbo].[proc_SecGetUserAccountDirectoryPath]    Script Date: 5/15/2018 12:12:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetUserAccountDirectoryPath(
	@SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        UserAccountDirectoryPath
    FROM
        Sites
    WHERE
        Id = @SiteId
    RETURN 0    

GO
