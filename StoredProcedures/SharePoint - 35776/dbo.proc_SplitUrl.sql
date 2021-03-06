/****** Object:  StoredProcedure [dbo].[proc_SplitUrl]    Script Date: 5/15/2018 12:12:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SplitUrl(
    @Url nvarchar(260),
    @DirName nvarchar(256) OUTPUT,
    @LeafName nvarchar(128) OUTPUT)
AS
   DECLARE @iSlash int
   SET @iSlash = CHARINDEX(N'/', REVERSE(@Url) COLLATE Latin1_General_BIN)
   SET @DirName = dbo.fn_GetDirName(@Url, @iSlash)
   SET @LeafName = dbo.fn_GetLeafName(@Url, @iSlash)

GO
