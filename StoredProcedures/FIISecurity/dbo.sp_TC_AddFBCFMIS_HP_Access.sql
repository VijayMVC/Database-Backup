/****** Object:  StoredProcedure [dbo].[sp_TC_AddFBCFMIS_HP_Access]    Script Date: 5/15/2018 12:09:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:        Alex Montminy/Josh Steward
-- Create date: 8/16/2013
-- Description: Gives New FBC access to FMIS home Page and Add History button
-- =============================================
CREATE PROCEDURE [dbo].[sp_TC_AddFBCFMIS_HP_Access] 
      -- Gives New employee access to FMIS home Page 
    @userName NVARCHAR(100) ,
    @firstName NVARCHAR(100) ,
    @lastName NVARCHAR(100) ,
    @email NVARCHAR(100)
AS 
    BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
        SET NOCOUNT ON;

      -- Insert statements for procedure here
        
        IF EXISTS ( SELECT
                        *
                    FROM
                        sec_AuthenticatedUsers
                    WHERE
                        username = @userName ) 
            BEGIN
                SELECT
                    'user ' + @userName
                    + ' already exists in sec_AuthenticatedUsers'
                RETURN;
            END
        
        INSERT  INTO sec_AuthenticatedUsers
                ( username ,
                  user_type ,
                  first_name ,
                  last_name ,
                  email
                )
        VALUES
                ( @userName ,
                  1 ,
                  @firstName ,
                  @lastName ,
                  @email
                )
                
                
               
        --Give FBC Access to Add History button        
        INSERT  INTO [sec_UserApplicationRoles]
                ( [user_id] ,
                  application_role_id
                )
                SELECT TOP 1
                    [user_id] ,
                    '73'
                FROM
                    sec_AuthenticatedUsers
                WHERE
                    username = @username
        
                
                
                
        SELECT
            'FBC ' + @userName
            + ' has been inserted into sec_AuthenticatedUsers and given Add History button.'
        RETURN
    END

GO
