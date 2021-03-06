/****** Object:  StoredProcedure [dbo].[zw_delete_CourseTerm]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE [dbo].[zw_delete_CourseTerm] ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser varchar(25)  = NULL , 
@ModifiedByComputer varchar(25)  = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@CourseTermTypeID int  = NULL , 
@CourseID int  = NULL , 
@CourseClassTypeID int  = NULL , 
@InstructorID1 int  = NULL , 
@InstructorID2 int  = NULL , 
@InstructorID3 int  = NULL , 
@StartDate datetime  = NULL , 
@EndDate datetime  = NULL , 
@DefaultLocationID int  = NULL , 
@DefaultLocationStoreID int  = NULL , 
@DefaultLocationClassTypeID int  = NULL , 
@DisplayName varchar(30)  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [CourseTerm] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID


GO
