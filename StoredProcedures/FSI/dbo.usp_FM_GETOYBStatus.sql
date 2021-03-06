/****** Object:  StoredProcedure [dbo].[usp_FM_GETOYBStatus]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:        Alex Montminy
-- Create date: 02/04/2013
-- Description:   Gets The OYB status fpr a single store
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_GETOYBStatus]
      -- Add the parameters for the stored procedure here
    @ZWID NVARCHAR(MAX)
AS 
    BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
        SET NOCOUNT ON;
      
        IF NOT EXISTS ( SELECT
                            IsOYB
                        FROM
                            dbo.FM_OYBStatus
                        WHERE
                            ZW_ID = @ZWID ) 
            BEGIN
                INSERT  INTO dbo.FM_OYBStatus
                        ( IsOYB, ZW_ID )
                VALUES
                        ( 0, @ZWID ) 
            END
      
        SELECT
            IsOYB
        FROM
            dbo.FM_OYBStatus
        WHERE
            ZW_ID = @ZWID 
      
    END


GO
