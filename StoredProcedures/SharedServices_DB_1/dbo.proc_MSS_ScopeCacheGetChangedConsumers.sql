/****** Object:  StoredProcedure [dbo].[proc_MSS_ScopeCacheGetChangedConsumers]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ScopeCacheGetChangedConsumers(
    @Since bigint )
AS
    SELECT
        ConsumerName
    FROM
        dbo.MSSRegisteredConsumers
    WHERE
        LastUpdate > @Since

    SELECT 
        LastConsumerChangeID 
    FROM 
        dbo.MSSScopesSystem

    RETURN @@ERROR

GO
