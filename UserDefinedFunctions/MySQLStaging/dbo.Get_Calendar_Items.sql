/****** Object:  UserDefinedFunction [dbo].[Get_Calendar_Items]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		SMT
-- =============================================
CREATE FUNCTION Get_Calendar_Items
    (
      @franchise_id VARCHAR(32)
    )
RETURNS TABLE
AS
RETURN
    ( SELECT
        ColorId = RIGHT(schedule_color, 6) ,
        CalendarId = employee_data_id ,
        Title = first_name + ' ' + last_name + ' Work Schedule'
      FROM
        employee_data ed
        JOIN users u ON ed.users_id = u.users_id
      WHERE
        u.franchise_id = @franchise_id
    )

GO
