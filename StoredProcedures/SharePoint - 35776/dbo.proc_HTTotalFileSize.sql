/****** Object:  StoredProcedure [dbo].[proc_HTTotalFileSize]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_HTTotalFileSize
AS
SELECT (SUM(CAST(([FileSize]) AS BIGINT)))
FROM HT_Cache

GO
