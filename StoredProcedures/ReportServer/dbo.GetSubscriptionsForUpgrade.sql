/****** Object:  StoredProcedure [dbo].[GetSubscriptionsForUpgrade]    Script Date: 5/15/2018 12:11:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetSubscriptionsForUpgrade]
@CurrentVersion int
AS
SELECT 
    [SubscriptionID]
FROM 
    [Subscriptions]
WHERE
    [Version] != @CurrentVersion

GO
