/****** Object:  StoredProcedure [dbo].[rc_GetNOTReportInfo]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE rc_GetNOTReportInfo

(   @ReportID int )

AS

SELECT B.*,C.* FROM RC_NOT B INNER JOIN RC_NOTa C ON B.ReportID = C.ReportID
WHERE B.ReportID = @ReportID

GO
