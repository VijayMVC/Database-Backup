/****** Object:  View [dbo].[tqview1]    Script Date: 5/15/2018 12:13:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create view tqview1
as
SELECT     ID, StoreID, DateTime, OrderID, CustomerID, RecordID, AccountCode, UserID, Amount, Description, Closed, ClosedDate, Exported, ExportedDate, ExportedBatch, 
                      EnteredByID, SubAccountCode, Taxable, Consolidated, Category, sys_di, sys_du, zw_franchise_id, zw_active, zw_pk_id
FROM         [GL Database]
WHERE     (zw_franchise_id = 'fsi0005')
GO
