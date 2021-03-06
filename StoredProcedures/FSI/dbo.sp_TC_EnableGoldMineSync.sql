/****** Object:  StoredProcedure [dbo].[sp_TC_EnableGoldMineSync]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex Montminy
-- Create date: 1/16/2013
-- Description:   Puts StoreNum into Store Information Database so it will sync with goldmine 
-- =============================================
CREATE PROCEDURE sp_TC_EnableGoldMineSync
      -- Add the parameters for the stored procedure here
      @StoreNum int
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
    if Exists(
      SELECT StoreID
      from [dbo].[Store Information Database]
      where  StoreID = @StoreNum
      )
            begin
            select 'Store ' + cast( @StoreNum as nvarchar(20)) + ' is already in [Store Information Database]'
            return;
            end
      insert      into dbo.[Store Information Database] (StoreID)
      values(@StoreNum)
      select 'Store ' + cast( @StoreNum as nvarchar(20)) + ' has been inserted into [Store Information Database]'
      return
END

GO
