/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopeDisplayGroupsInfo]    Script Date: 5/15/2018 12:11:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopeDisplayGroupsInfo
AS
    SELECT
        DisplayGroupID,
        Name,
        Description,
        dbo.MSSRegisteredConsumers.ConsumerName,
        DisplayInAdminUI,
        Undeletable,
        DefaultScopeID,
        LastModifiedTime,
        LastModifiedBy
    FROM
        dbo.MSSScopeDisplayGroups, dbo.MSSRegisteredConsumers
    WHERE
        dbo.MSSScopeDisplayGroups.ConsumerID = dbo.MSSRegisteredConsumers.ConsumerID

    RETURN @@ERROR

GO
