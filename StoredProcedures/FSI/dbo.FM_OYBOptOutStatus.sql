/****** Object:  StoredProcedure [dbo].[FM_OYBOptOutStatus]    Script Date: 5/15/2018 12:09:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Alex Montminy
-- Create date: 10/08/2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FM_OYBOptOutStatus]
	-- Add the parameters for the stored procedure here
	@ZWID nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1
	OptOut2 
	from dbo._ExactTarget_Integration_Contacts
	where 
	zw_franchise_id = @ZWID
	
	
END

GO
