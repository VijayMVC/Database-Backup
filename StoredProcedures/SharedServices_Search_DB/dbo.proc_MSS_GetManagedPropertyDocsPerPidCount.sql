/****** Object:  StoredProcedure [dbo].[proc_MSS_GetManagedPropertyDocsPerPidCount]    Script Date: 5/15/2018 12:11:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetManagedPropertyDocsPerPidCount
@PID int,
@Limit int,
@FoundCount int OUTPUT
AS
        set RowCount @Limit
	    SELECT @FoundCount = Count(*)  
	    FROM dbo.MSSDocProps 
	    WHERE PID = @PID
        set RowCount 0

GO
