/****** Object:  StoredProcedure [dbo].[proc_MSS_GetConsumers]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetConsumers
AS
    SELECT
        ConsumerName
    FROM
        dbo.MSSRegisteredConsumers
    RETURN @@ERROR

GO
