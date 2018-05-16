/****** Object:  StoredProcedure [dbo].[zw_upsert_TempNewGroupIDs]    Script Date: 5/15/2018 12:09:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE [dbo].[zw_upsert_TempNewGroupIDs] ( 
@GroupID int  = NULL , 
@ID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
     INSERT INTO [TempNewGroupIDs]( [GroupID], [ID], [zw_franchise_id], [sys_di], [zw_active] ) 
		VALUES( @GroupID, @ID, @zw_franchise_id, getdate(), 1 ) 


GO
