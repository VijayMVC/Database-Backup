/****** Object:  StoredProcedure [dbo].[sp_TC_EnableFMISContactHitory]    Script Date: 5/15/2018 12:13:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex Montminy
-- Create date: 1/14/2013
-- Description:   Enables FMIS Contact Hitory edits>
-- =============================================
CREATE PROCEDURE sp_TC_EnableFMISContactHitory
      -- Add the parameters for the stored procedure here
      @StoreNum int
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      
INSERT INTO StoreAdditionalInfo(StoreNumber)
values (@StoreNum)
select 'Store ' + cast(@StoreNum as nvarchar(30)) + ' has been added to the StoreAdditionalInfo table'
END

GO
