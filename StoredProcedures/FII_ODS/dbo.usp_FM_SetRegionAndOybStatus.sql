/****** Object:  StoredProcedure [dbo].[usp_FM_SetRegionAndOybStatus]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_SetRegionAndOybStatus] 
	-- Add the parameters for the stored procedure here
@zw_ID nvarchar(20),
@RegionID int,
@Is_Oyb bit

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @CenterKey Int=0;
    select @CenterKey = CenterKey
    from Store.StoreFact
    where ZW_Franchise_ID = @zw_ID
    
    
	update Store.FastMailDim
	set FastMailGroupId =@RegionID, IS_OYB = @Is_Oyb
	
	where CenterKey = @CenterKey
	

	
	
END

GO
