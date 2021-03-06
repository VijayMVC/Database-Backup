/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopeDisplayGroupIDFromName]    Script Date: 5/15/2018 12:13:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopeDisplayGroupIDFromName(
    @ConsumerName nvarchar( 60 ),
    @Name nvarchar( 60 ),
    @DisplayGroupID int OUTPUT )
AS
    SELECT
        @DisplayGroupID = DisplayGroupID
    FROM
        dbo.MSSScopeDisplayGroups, dbo.MSSRegisteredConsumers
    WHERE
        dbo.MSSScopeDisplayGroups.ConsumerID = dbo.MSSRegisteredConsumers.ConsumerID AND
        ConsumerName = @ConsumerName AND
        Name = @Name
    IF @@ROWCOUNT = 0
        RETURN 1
    ELSE
        RETURN @@ERROR

GO
