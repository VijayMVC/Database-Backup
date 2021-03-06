/****** Object:  StoredProcedure [dbo].[sp_AddODZAccount]    Script Date: 5/15/2018 12:09:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_AddODZAccount](@storeNum Integer, @password nvarchar(max))

      -- Add the parameters for the stored procedure here
AS
BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

insert into [FIISecurity].[dbo].[sec_StoreSubscription] 
( [store_number],
[state_id],
[date_transition],
[application_id],
[subsc_pwd])
  
  values ( 
  @storeNum, 
  3,
  getdate(),
   2,
  @password) 
      
END




GO
