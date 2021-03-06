/****** Object:  UserDefinedFunction [dbo].[fn_GetRootFolder]    Script Date: 5/15/2018 12:15:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_GetRootFolder(@tp_RootFolder uniqueidentifier)
RETURNS nvarchar(260)
AS
BEGIN
    DECLARE @strRootDirName nvarchar(256)
    DECLARE @strRootLeafName nvarchar(128)
    SELECT
        @strRootDirName = Docs.DirName,
        @strRootLeafName = Docs.LeafName
    FROM
        Docs
    WHERE
        Docs.Id = @tp_RootFolder
    RETURN N'/' + CASE WHEN (DATALENGTH(@strRootDirName) = 0) THEN @strRootLeafName WHEN (DATALENGTH(@strRootLeafName) = 0) THEN @strRootDirName ELSE @strRootDirName + N'/' + @strRootLeafName END
END

GO
