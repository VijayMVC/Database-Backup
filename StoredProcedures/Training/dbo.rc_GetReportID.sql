/****** Object:  StoredProcedure [dbo].[rc_GetReportID]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE rc_GetReportID

(   @RegID int )

AS

SELECT ReportID
FROM RegistrantReportCards
WHERE RegistrantID = @RegID

GO
