/****** Object:  StoredProcedure [dbo].[FM_OptIN]    Script Date: 5/15/2018 12:09:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Alex Montminy
-- Create date: 10/08/2012
-- Description:	New Fastmail procs
-- =============================================
CREATE PROCEDURE [dbo].[FM_OptIN] 
	-- Add the parameters for the stored procedure here
	@ZW_ID nvarchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update dbo._ExactTarget_Integration_Contacts
	set OptOut2 = 0, 
	last_modified = getDate()
	where zw_franchise_id = @ZW_ID
	
	 
END

GO
