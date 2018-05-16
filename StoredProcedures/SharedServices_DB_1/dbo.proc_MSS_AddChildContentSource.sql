/****** Object:  StoredProcedure [dbo].[proc_MSS_AddChildContentSource]    Script Date: 5/15/2018 12:11:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AddChildContentSource(
    @FarmName nvarchar( 64 ),
    @Name nvarchar( 64 ),
    @StartAddress nvarchar( 2048 ) )
AS
    INSERT INTO
        dbo.MSSChildContentSources
    VALUES (
        @FarmName,
        @Name,
        @StartAddress )

GO
