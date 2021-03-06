/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopeDisplayGroupInfo]    Script Date: 5/15/2018 12:11:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopeDisplayGroupInfo(
    @DisplayGroupID int,
    @Name nvarchar( 60 ) OUTPUT,
    @Description nvarchar( 300 ) OUTPUT,
    @ConsumerName nvarchar( 60 ) OUTPUT,
    @DisplayInAdminUI bit OUTPUT,
    @Undeletable bit OUTPUT,
    @DefaultScopeID int OUTPUT,
    @LastModifiedTime datetime OUTPUT,    
    @LastModifiedBy nvarchar( 60 ) OUTPUT )
AS
    SELECT
        @Name = Name,
        @Description = Description,
        @ConsumerName = dbo.MSSRegisteredConsumers.ConsumerName,
        @DisplayInAdminUI = DisplayInAdminUI,
        @Undeletable = Undeletable,
        @DefaultScopeID = DefaultScopeID,
        @LastModifiedTime = LastModifiedTime,
        @LastModifiedBy = LastModifiedBy
    FROM
        dbo.MSSScopeDisplayGroups, dbo.MSSRegisteredConsumers
    WHERE
        DisplayGroupID = @DisplayGroupID AND
        dbo.MSSScopeDisplayGroups.ConsumerID = dbo.MSSRegisteredConsumers.ConsumerID

    IF @@ROWCOUNT = 0
        RETURN 1
    ELSE
        RETURN @@ERROR

GO
