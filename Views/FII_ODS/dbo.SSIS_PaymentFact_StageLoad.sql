/****** Object:  View [dbo].[SSIS_PaymentFact_StageLoad]    Script Date: 5/15/2018 12:13:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[SSIS_PaymentFact_StageLoad]
 AS 
SELECT [Staging].[dbo].[PaymentFact].* 
   ,PaymentMethodKey 
   ,TrackingNumberKey 
   ,ReasonKey 
   ,TakenForCustomerInfoKey 
FROM [Staging].[dbo].[PaymentFact] 
LEFT JOIN [Orders].[PaymentMethodDim] WITH (NOLOCK) ON [Orders].[PaymentMethodDim].[PaymentMethodName]=[PaymentFact].[PaymentMethod] 
LEFT JOIN [Orders].[TrackingNumberDim] WITH (NOLOCK) ON [Orders].[TrackingNumberDim].[TrackingNumberName]=[PaymentFact].[TrackingNumber] 
LEFT JOIN [Orders].[ReasonDim] WITH (NOLOCK) ON [Orders].[ReasonDim].[ReasonName]=[PaymentFact].[Reason] 
LEFT JOIN [Orders].[TakenForCustomerInfoDim] WITH (NOLOCK) ON [Orders].[TakenForCustomerInfoDim].[TakenForCustomerInfoName]=[PaymentFact].[TakenForCustomerInfo] 

GO
