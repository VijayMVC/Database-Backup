/****** Object:  StoredProcedure [dbo].[sp_TC_AddStoreToProcessCubes]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex M
-- Create date: 1/11/2013
-- Description:   Adds store to StoresToProcessCubes table
-- =============================================
CREATE PROCEDURE sp_TC_AddStoreToProcessCubes
      -- Adds stores to StoresToProcessCubes table
      @ZW_ID nvarchar(20)
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
					 
    -- Insert statements for procedure here
      IF EXISTS ( SELECT    *
                  FROM      StoresToProcessCubes
                  WHERE     zw_franchise_id = @ZW_ID ) 
        BEGIN
            SELECT  @ZW_ID + ' already exists in StoresToProcessCubes'
            RETURN 
        END
      ELSE 
        BEGIN
            INSERT  INTO StoresToProcessCubes
                    ( zw_franchise_id )
            VALUES  ( @ZW_ID )
            SELECT  @ZW_ID + ' has been added to StoresToProcessCubes'
            RETURN
        END
END     
     


GO
