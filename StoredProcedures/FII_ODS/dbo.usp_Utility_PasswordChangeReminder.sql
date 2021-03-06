/****** Object:  StoredProcedure [dbo].[usp_Utility_PasswordChangeReminder]    Script Date: 5/15/2018 12:09:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Tim Fleck
-- Create date: 2013-05-15
-- Description:	Password Reminder Email Generator
-- =============================================
CREATE PROCEDURE [dbo].[usp_Utility_PasswordChangeReminder]
	-- Add the parameters for the stored procedure here
    @Recipient NVARCHAR(255) ,
    @LastPWChangeDate DATETIME
AS 
    BEGIN
        DECLARE @expirecheckdate INT
        SET @expirecheckdate = DATEDIFF(DAY, GETDATE(),
                                        DATEADD(day, 60, @LastPWChangeDate))

        IF @expirecheckdate = 10
            OR @expirecheckdate = 5
            OR @expirecheckdate = 1 
            BEGIN
	
                INSERT  INTO [System].[EmailReminderLog]
                        ( [Recipient] ,
                          [NumberOfDaysToChange]
                        )
                VALUES
                        ( @Recipient ,
                          @expirecheckdate
                        )

                DECLARE @sub_text VARCHAR(200) 
                DECLARE @htmltext VARCHAR(MAX)

                IF @expirecheckdate = 1 
                    BEGIN 
                        SET @sub_text = 'Your Password will expire in 1 day'
                        SET @htmltext = ( SELECT
                                            HTML_BODY
                                          FROM
                                            System.EmailNotificationSystemDriver
                                          WHERE
                                            ProjectCode = 'PASS'
                                            AND TypeCode = 'Day1'
                                        )
					
                    END
                IF @expirecheckdate = 5 
                    BEGIN 
                        SET @sub_text = 'Your Password will expire in 5 days'
                        SET @htmltext = ( SELECT
                                            HTML_BODY
                                          FROM
                                            System.EmailNotificationSystemDriver
                                          WHERE
                                            ProjectCode = 'PASS'
                                            AND TypeCode = 'Day5'
                                        )

				
                    END
                IF @expirecheckdate = 10 
                    BEGIN 
                        SET @sub_text = 'Your Password will expire in 10 days'
                        SET @htmltext = ( SELECT
                                            HTML_BODY
                                          FROM
                                            System.EmailNotificationSystemDriver
                                          WHERE
                                            ProjectCode = 'PASS'
                                            AND TypeCode = 'Day10'
                                        )
                    END


                EXEC msdb.dbo.sp_send_dbmail 
                    @importance = 'HIGH' ,
                    @reply_to = 'HelpDesk@Fastsigns.com' ,
                    @from_address = 'PasswordChange@FASTSIGNS.com' ,
                    @profile_name = 'AppDev' ,
                    @recipients = @Recipient ,
                    @subject = @sub_text ,
                    @body_format = 'HTML' ,
                    @body = @htmltext

            END


    END
GO
