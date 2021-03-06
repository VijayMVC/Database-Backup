/****** Object:  StoredProcedure [dbo].[zw_upsert_AdvQuery]    Script Date: 5/15/2018 12:09:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_AdvQuery ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@QueryName [nvarchar](75)   = NULL , 
@QueryType int  = NULL , 
@OwnedQuery bit  = NULL , 
@ParentID int  = NULL , 
@ParentStoreID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@Description [nvarchar](MAX)   = NULL , 
@ShowRange int  = NULL , 
@ShowRangeCount int  = NULL , 
@TableNodeID int  = NULL , 
@QuerySortFields [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
     INSERT INTO [AdvQuery]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [QueryName], [QueryType], [OwnedQuery], [ParentID], [ParentStoreID], [ParentClassTypeID], [Description], [ShowRange], [ShowRangeCount], [TableNodeID], [QuerySortFields], [zw_franchise_id], [sys_di], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @QueryName, @QueryType, @OwnedQuery, @ParentID, @ParentStoreID, @ParentClassTypeID, @Description, @ShowRange, @ShowRangeCount, @TableNodeID, @QuerySortFields, @zw_franchise_id, getdate(), 1 )

GO
