/****** Object:  StoredProcedure [dbo].[sp_TC_AddODZAccount]    Script Date: 5/15/2018 12:09:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex Montminy
-- Create date: 1/14/2013
-- Description:   Adds an ODZ account
-- =============================================
CREATE PROCEDURE [dbo].[sp_TC_AddODZAccount] 
      -- Add the parameters for the stored procedure here
    @storeNum INTEGER ,
    @password NVARCHAR(MAX)
AS 
    BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here
        IF EXISTS ( SELECT
                        *
                    FROM
                        [FIISecurity].[dbo].[sec_StoreSubscription]
                    WHERE
                        @storeNum = [store_number]
                        AND [application_id] = 2 ) 
            BEGIN
            
                UPDATE
                    [FIISecurity].[dbo].[sec_StoreSubscription]
                SET 
                    [state_id] = 3 ,
                    [date_transition] = GETDATE() ,
                    [subsc_pwd] = @password
                WHERE
                    @storeNum = [store_number]
                    AND [application_id] = 2 
                SELECT
                    'Store ' + CAST(@storeNum AS NVARCHAR(50))
                    + ' found and modified'
                RETURN 
            END
        ELSE 
            BEGIN 
                INSERT  INTO [FIISecurity].[dbo].[sec_StoreSubscription]
                        ( [store_number] ,
                          [state_id] ,
                          [date_transition] ,
                          [application_id] ,
                          [subsc_pwd]
                        )
                VALUES
                        ( @storeNum ,
                          3 ,
                          GETDATE() ,
                          2 ,
                          @password
                        ) 
                SELECT
                    'Store ' + CAST(@storeNum AS NVARCHAR(50))
                    + ' found and modified' 
                RETURN
            END
      
    END

GO
