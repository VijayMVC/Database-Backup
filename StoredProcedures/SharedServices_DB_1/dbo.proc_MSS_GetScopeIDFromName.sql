/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopeIDFromName]    Script Date: 5/15/2018 12:11:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopeIDFromName(
    @ConsumerName nvarchar( 60 ),
    @Name nvarchar( 60 ),
    @ScopeID int OUTPUT )
AS
    SELECT
        @ScopeID = ScopeID
    FROM
        dbo.MSSScopes, dbo.MSSRegisteredConsumers
    WHERE
        dbo.MSSScopes.ConsumerID = dbo.MSSRegisteredConsumers.ConsumerID AND
        ConsumerName = @ConsumerName AND
        Name = @Name

    IF @@ROWCOUNT = 0
        RETURN 1
    ELSE
        RETURN @@ERROR

GO
