/****** Object:  StoredProcedure [dbo].[RemoveSubscriptionFromBeingDeleted]    Script Date: 5/15/2018 12:10:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[RemoveSubscriptionFromBeingDeleted] 
@SubscriptionID uniqueidentifier
AS
delete from [SubscriptionsBeingDeleted] where SubscriptionID = @SubscriptionID

GO
