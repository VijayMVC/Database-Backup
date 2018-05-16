/****** Object:  View [dbo].[Convention_Attendance]    Script Date: 5/15/2018 12:13:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE VIEW [dbo].[Convention_Attendance]
AS select distinct ACCOUNTNO, substring(city,9,4) as Convention_Year, count(*) as Number_of_Attendees from contsupp where rectype = 'P' and contact = 'Training' and contsupref like '%Convention%' group by accountno, substring(city,9,4) 



GO
