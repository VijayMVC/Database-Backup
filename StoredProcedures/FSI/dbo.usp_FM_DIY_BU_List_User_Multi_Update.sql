/****** Object:  StoredProcedure [dbo].[usp_FM_DIY_BU_List_User_Multi_Update]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex Montminy
-- Create date: 02/06/2013
-- Description:   Updates the ET IDS after a user and BU are created In Exact Target 
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_DIY_BU_List_User_Multi_Update]
      -- Add the parameters for the stored procedure here
    @webNumber INT ,
    @BU_ID INT ,
    @User_ID INT
AS 
    BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here
        UPDATE
            [FSI].[dbo].[FM_DIY_IDS]
        SET 
            [ET_BUID] = @BU_ID ,
            [ET_UserID] = @User_ID
        WHERE
            [WebNumber] = @webNumber
  
        IF @@ROWCOUNT = 0 
            BEGIN

                INSERT  INTO [FSI].[dbo].[FM_DIY_IDS]
                        ( [WebNumber] ,
                          [ET_BUID] ,
                          [ET_UserID]
                        )
                VALUES
                        ( @webNumber ,
                          @BU_ID ,
                          @User_ID
                        )

            END
    END
GO
