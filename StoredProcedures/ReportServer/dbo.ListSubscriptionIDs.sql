/****** Object:  StoredProcedure [dbo].[ListSubscriptionIDs]    Script Date: 5/15/2018 12:11:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[ListSubscriptionIDs]
AS

SELECT [SubscriptionID]
FROM [dbo].[Subscriptions] WITH (XLOCK, TABLOCK)

GO
