/****** Object:  StoredProcedure [dbo].[proc_SplitLeafName]    Script Date: 5/15/2018 12:12:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SplitLeafName(
    @LeafName nvarchar(128),
    @FileBaseName nvarchar(128) OUTPUT,
    @FileExtension nvarchar(128) OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @idx int
    SET @idx = CHARINDEX(N'.', REVERSE(@LeafName) COLLATE Latin1_General_BIN)
    SET @FileBaseName =   
        CASE   
        WHEN @idx > 0
        THEN LEFT(@LeafName, LEN(@LeafName) - @idx)
        ELSE @LeafName
        END
    SET @FileExtension =   
        CASE   
        WHEN @idx > 0
        THEN RIGHT(@LeafName, @idx - 1)
        ELSE N''
        END

GO
