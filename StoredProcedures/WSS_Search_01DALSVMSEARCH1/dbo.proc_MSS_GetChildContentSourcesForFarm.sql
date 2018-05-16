/****** Object:  StoredProcedure [dbo].[proc_MSS_GetChildContentSourcesForFarm]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetChildContentSourcesForFarm(
    @FarmName nvarchar( 64 ) )
AS
    SELECT
        Name,
        StartAddress
    FROM
        dbo.MSSChildContentSources
    WHERE 
        FarmName = @FarmName

GO
