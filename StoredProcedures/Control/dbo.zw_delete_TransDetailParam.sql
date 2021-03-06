/****** Object:  StoredProcedure [dbo].[zw_delete_TransDetailParam]    Script Date: 5/15/2018 12:09:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_TransDetailParam ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ParentID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@TransactionType int  = NULL , 
@TransHeaderID int  = NULL , 
@TransHeaderClassTypeID int  = NULL , 
@ParameterID int  = NULL , 
@ParameterClassTypeID int  = NULL , 
@ParameterName [nvarchar](25)   = NULL , 
@FormattedText [nvarchar](MAX)   = NULL , 
@ListID int  = NULL , 
@ListValue int  = NULL , 
@Units int  = NULL , 
@ValueType int  = NULL , 
@ValueAsString [nvarchar](MAX)   = NULL , 
@ValueAsFloat float  = NULL , 
@ValueAsInteger int  = NULL , 
@ValueAsDateTime datetime  = NULL , 
@ValueAsBinary image  = NULL , 
@ValueAsBlob image  = NULL , 
@ValueAsStr25 [nvarchar](25)   = NULL , 
@BlobType int  = NULL , 
@Overridden bit  = NULL , 
@VariableID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [TransDetailParam] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
