/****** Object:  StoredProcedure [dbo].[proc_MSS_DropChildContentSource]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DropChildContentSource(
    @Name nvarchar( 64 ) )
AS
    DELETE FROM
        dbo.MSSChildContentSources
    WHERE
        Name = @Name 

GO
