/****** Object:  StoredProcedure [dbo].[UpdateSubscriptionLastRunInfo]    Script Date: 5/15/2018 12:10:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[UpdateSubscriptionLastRunInfo]
@SubscriptionID uniqueidentifier,
@Flags int,
@LastRunTime datetime,
@LastStatus nvarchar(260)
AS

update Subscriptions set
        [InactiveFlags] = @Flags,
        [LastRunTime] = @LastRunTime,
        [LastStatus] = @LastStatus
where
    [SubscriptionID] = @SubscriptionID

GO
