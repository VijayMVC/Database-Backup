/****** Object:  StoredProcedure [dbo].[proc_MSS_ConsumerHasChanged]    Script Date: 5/15/2018 12:13:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ConsumerHasChanged(
    @ConsumerID int )
AS
    DECLARE @LastError int
    UPDATE
        dbo.MSSScopesSystem
    SET
        LastConsumerChangeID = LastConsumerChangeID + 1
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
        RETURN @LastError
    UPDATE
        dbo.MSSRegisteredConsumers
    SET 
        LastUpdate = ( SELECT LastConsumerChangeID FROM dbo.MSSScopesSystem )
    WHERE
        ConsumerID = @ConsumerID
    RETURN @@ERROR

GO
