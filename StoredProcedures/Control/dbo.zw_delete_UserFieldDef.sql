/****** Object:  StoredProcedure [dbo].[zw_delete_UserFieldDef]    Script Date: 5/15/2018 12:09:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_UserFieldDef ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@FieldName [nvarchar](50)   = NULL , 
@Description [nvarchar](50)   = NULL , 
@DataType int  = NULL , 
@AssociatedClassTypeID int  = NULL , 
@FieldIndex int  = NULL , 
@AnswerRequired bit  = NULL , 
@Alignment int  = NULL , 
@DisplayFormatString [nvarchar](25)   = NULL , 
@SortIndex int  = NULL , 
@UseDropdownBox bit  = NULL , 
@DropdownValues [nvarchar](MAX)   = NULL , 
@LimitToList bit  = NULL , 
@CategoryName varchar(40)  = NULL , 
@UseDefaultColors bit  = NULL , 
@DescriptionColor int  = NULL , 
@AnswerColor int  = NULL , 
@DescriptionFontColor int  = NULL , 
@AnswerFontColor int  = NULL , 
@AnswerRequiredOrd bit  = NULL , 
@AnswerRequiredEst bit  = NULL , 
@AnswerRequiredTemp bit  = NULL , 
@AnswerRequiredST bit  = NULL , 
@ShowOrder bit  = NULL , 
@ShowEstimate bit  = NULL , 
@ShowTemplate bit  = NULL , 
@ShowService bit  = NULL , 
@ShowClient bit  = NULL , 
@ShowProspect bit  = NULL , 
@ClearOnClone bit  = NULL , 
@ClearOnConvert bit  = NULL , 
@ShowFullContact bit  = NULL , 
@ShowLimitedContact bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [UserFieldDef] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
