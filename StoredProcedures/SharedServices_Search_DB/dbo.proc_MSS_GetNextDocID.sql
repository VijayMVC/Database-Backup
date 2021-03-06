/****** Object:  StoredProcedure [dbo].[proc_MSS_GetNextDocID]    Script Date: 5/15/2018 12:11:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetNextDocID
@NextDocID int  OUTPUT

AS
    SET @NextDocID = 0

    SELECT @NextDocID = (SELECT TOP 1 DocID FROM MSSDocDeleteList  WITH (TABLOCKX) WHERE Available = 2) 

    IF @NextDocID IS NOT NULL AND @NextDocID <> 0
    BEGIN
        DELETE FROM MSSDocDeleteList WHERE DocID = @NextDocID
    END
    ELSE
    BEGIN
        SELECT @NextDocID = NextDocID FROM MSSNextDocID
        UPDATE MSSNextDocID WITH(TABLOCKX) SET NextDocID = NextDocID + 1 
        SELECT @NextDocID = NextDocID FROM MSSNextDocID
    END

GO
