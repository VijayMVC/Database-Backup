/****** Object:  View [dbo].[SSIS_EstimateHeaderFact_StageLoad]    Script Date: 5/15/2018 12:13:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[SSIS_EstimateHeaderFact_StageLoad]
 AS 
SELECT [Staging].[dbo].[EstimateHeaderFact].* 
   ,DescriptionKey 
   ,OrdererFirstNameKey 
   ,OrdererLastNameKey 
   ,OrdererTitleKey 
   ,StatusKey 
   ,PurchaseOrderNumberKey 
   ,ShippingAddressKey 
   ,DispositionOnCompletionKey 
   ,OrderNotesKey 
   ,InstallNotesKey 
   ,CustomerNameKey 
   ,JobBoxKey
   ,StoreFact.CenterKey 
   ,ISNULL(CustomerFact.CustomerKey,-255) AS CustomerKey
   ,ISNULL(ContactFact.ContactKey,-255) AS [ContactKey]
   ,ISNULL(EmployeeFact.EmployeeKey,-255) AS [SalePersonKey]
   ,ISNULL(E2.EmployeeKey,-255) AS [EnteredByKey]

FROM [Staging].[dbo].[EstimateHeaderFact] WITH (NOLOCK) 
JOIN Store.StoreFact WITH (NOLOCK) ON StoreFact.ZW_Franchise_ID = EstimateHeaderFact.ZW_Franchise_ID
LEFT JOIN [Estimate].[DescriptionDim] WITH (NOLOCK) ON [Estimate].[DescriptionDim].[DescriptionName]=[EstimateHeaderFact].[Description] 
LEFT JOIN [Estimate].[OrdererFirstNameDim] WITH (NOLOCK) ON [Estimate].[OrdererFirstNameDim].[OrdererFirstNameName]=[EstimateHeaderFact].[OrdererFirstName] 
LEFT JOIN [Estimate].[OrdererLastNameDim] WITH (NOLOCK) ON [Estimate].[OrdererLastNameDim].[OrdererLastNameName]=[EstimateHeaderFact].[OrdererLastName] 
LEFT JOIN [Estimate].[OrdererTitleDim] WITH (NOLOCK) ON [Estimate].[OrdererTitleDim].[OrdererTitleName]=[EstimateHeaderFact].[OrdererTitle] 
LEFT JOIN [Estimate].[StatusDim] WITH (NOLOCK) ON [Estimate].[StatusDim].[StatusName]=[EstimateHeaderFact].[Status] 
LEFT JOIN [Estimate].[PurchaseOrderNumberDim] WITH (NOLOCK) ON [Estimate].[PurchaseOrderNumberDim].[PurchaseOrderNumberName]=[EstimateHeaderFact].[PurchaseOrderNumber] 
LEFT JOIN [Estimate].[ShippingAddressDim] WITH (NOLOCK) ON [Estimate].[ShippingAddressDim].[ShippingAddressName]=[EstimateHeaderFact].[ShippingAddress] 
LEFT JOIN [Estimate].[DispositionOnCompletionDim] WITH (NOLOCK) ON [Estimate].[DispositionOnCompletionDim].[DispositionOnCompletionName]=[EstimateHeaderFact].[DispositionOnCompletion] 
LEFT JOIN [Estimate].[OrderNotesDim] WITH (NOLOCK) ON [Estimate].[OrderNotesDim].[OrderNotesName]=[EstimateHeaderFact].[OrderNotes] 
LEFT JOIN [Estimate].[InstallNotesDim] WITH (NOLOCK) ON [Estimate].[InstallNotesDim].[InstallNotesName]=[EstimateHeaderFact].[InstallNotes] 
LEFT JOIN [Estimate].[CustomerNameDim] WITH (NOLOCK) ON [Estimate].[CustomerNameDim].[CustomerNameName]=[EstimateHeaderFact].[CustomerName] 
LEFT JOIN [Estimate].[JobBoxDim] WITH (NOLOCK) ON [Estimate].[JobBoxDim].[JobBoxName]=[EstimateHeaderFact].[JobBox] 
LEFT JOIN Contact.CustomerFact WITH (NOLOCK) ON StoreFact.CenterKey = CustomerFact.CenterKey
				AND EstimateHeaderFact.CustomerID = CustomerFact.CustomerID
LEFT JOIN Contact.EmployeeFact WITH (NOLOCK) ON StoreFact.CenterKey = EmployeeFact.CenterKey 
				AND EmployeeFact.EmployeeID = EstimateHeaderFact.SalePersonID
LEFT JOIN Contact.EmployeeFact E2 WITH (NOLOCK) ON StoreFact.CenterKey = E2.CenterKey 
				AND E2.EmployeeID = EstimateHeaderFact.EnteredByID
LEFT JOIN Contact.ContactFact WITH (NOLOCK) ON StoreFact.CenterKey = ContactFact.CenterKey
				AND EstimateHeaderFact.[ContactID] = ContactFact.ContactID



GO
