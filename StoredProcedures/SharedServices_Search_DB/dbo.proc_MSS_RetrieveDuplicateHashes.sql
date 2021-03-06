/****** Object:  StoredProcedure [dbo].[proc_MSS_RetrieveDuplicateHashes]    Script Date: 5/15/2018 12:11:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_RetrieveDuplicateHashes
AS
    SELECT 
        s.DocId, 
        s.HashVal 
    FROM 
        dbo.MSSDuplicateHashes AS s with (nolock)
    JOIN #Temp AS t 
    ON 
        t.DocId = s.DocId
    ORDER BY
        t.value

   TRUNCATE TABLE #Temp

GO
