/****** Object:  StoredProcedure [dbo].[ListUsedDeliveryProviders]    Script Date: 5/15/2018 12:11:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[ListUsedDeliveryProviders] 
AS
select distinct [DeliveryExtension] from Subscriptions where [DeliveryExtension] <> ''

GO
