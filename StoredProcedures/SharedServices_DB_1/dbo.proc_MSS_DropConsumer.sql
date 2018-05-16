/****** Object:  StoredProcedure [dbo].[proc_MSS_DropConsumer]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DropConsumer(
    @ConsumerName nvarchar( 60 ) )
AS
    DELETE FROM
        dbo.MSSRegisteredConsumers
    WHERE
        ConsumerName = @ConsumerName 

    RETURN @@ERROR

GO
