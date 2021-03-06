/****** Object:  StoredProcedure [dbo].[proc_MSS_GetNextDocID]    Script Date: 5/15/2018 12:13:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetNextDocID
@MaxDocID int,
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
        IF @NextDocID >= @MaxDocId AND @MaxDocId <> -1
        BEGIN
            SET @NextDocID = -1
        END
        ELSE
        BEGIN
            UPDATE MSSNextDocID WITH(TABLOCKX) SET NextDocID = NextDocID + 1 
            SELECT @NextDocID = NextDocID FROM MSSNextDocID
        END
    END

GO
