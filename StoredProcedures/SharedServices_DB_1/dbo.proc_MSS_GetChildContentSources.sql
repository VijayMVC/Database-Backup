/****** Object:  StoredProcedure [dbo].[proc_MSS_GetChildContentSources]    Script Date: 5/15/2018 12:11:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetChildContentSources
AS
    SELECT
        Name,
        StartAddress
    FROM
        dbo.MSSChildContentSources

GO
