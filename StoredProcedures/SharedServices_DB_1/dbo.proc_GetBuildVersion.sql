/****** Object:  StoredProcedure [dbo].[proc_GetBuildVersion]    Script Date: 5/15/2018 12:11:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetBuildVersion
(
    @BuildVersion nvarchar(64) output
)
AS
    SET NOCOUNT ON
    SELECT
        @BuildVersion = Version
    FROM
        Versions
    WHERE
        VersionId = '00000000-0000-0000-0000-000000000000'

GO
