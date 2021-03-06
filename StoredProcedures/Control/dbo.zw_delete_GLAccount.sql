/****** Object:  StoredProcedure [dbo].[zw_delete_GLAccount]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_GLAccount ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@AccountGroupID int  = NULL , 
@AccountName [nvarchar](25)   = NULL , 
@Description [nvarchar](MAX)   = NULL , 
@ExportAccountName [nvarchar](50)   = NULL , 
@ExportAccountNumber int  = NULL , 
@ExportGroupID int  = NULL , 
@ConsolidateExport bit  = NULL , 
@Depth int  = NULL , 
@PathName1 [nvarchar](150)   = NULL , 
@PathName2 [nvarchar](150)   = NULL , 
@PathName3 [nvarchar](150)   = NULL , 
@PathName4 [nvarchar](150)   = NULL , 
@PathName5 [nvarchar](150)   = NULL , 
@MasterGroup bit  = NULL , 
@AllowSubGroups bit  = NULL , 
@RequireOneMember bit  = NULL , 
@MemberClassTypeID int  = NULL , 
@ConsolidateSubAccounts bit  = NULL , 
@SortIndex float  = NULL , 
@ExportAccountDesc [nvarchar](MAX)   = NULL , 
@NoExportToExternal bit  = NULL , 
@AccountType int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [GLAccount] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
