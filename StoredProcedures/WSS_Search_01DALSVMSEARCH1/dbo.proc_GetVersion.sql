/****** Object:  StoredProcedure [dbo].[proc_GetVersion]    Script Date: 5/15/2018 12:13:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetVersion
(
    @VersionId uniqueidentifier,
    @Version nvarchar(64) output
)
AS
    SET NOCOUNT ON
    SELECT
        @Version = Version
    FROM
        Versions
    WHERE
    VersionId = @VersionId

GO
