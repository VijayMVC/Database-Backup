/****** Object:  StoredProcedure [dbo].[proc_MSS_GetMultipleResults]    Script Date: 5/15/2018 12:11:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetMultipleResults
@RequestTypes int, 
@Term NVARCHAR(100),
@Author NVARCHAR(100),
@SqlSelect NVARCHAR(2048)  AS

    IF ((@RequestTypes & 0x80000000) != 0)
    BEGIN
      EXEC proc_MSS_GetDefinition @Term
    END

    IF ((@RequestTypes & 4) != 0)
    BEGIN
      EXEC proc_MSS_GetHighConfidenceResults @Term, @Author 
    END

    IF ((@RequestTypes & 1) != 0)
    BEGIN
      EXEC sp_executesql @SqlSelect
      TRUNCATE TABLE #Temp
    END
    RETURN

    SET ANSI_NULLS ON

GO
