/****** Object:  StoredProcedure [dbo].[rc_RedirectToArchive]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE rc_RedirectToArchive
(   @RegID int,
    @ReportCard int  )
	
AS

SELECT C.StartDate 
FROM RegistrantReportCards A INNER JOIN Registrants B ON A.RegistrantID = B.ID INNER JOIN Subclasses C ON B.Subclass = C.ID
WHERE A.ReportCard = @ReportCard
AND A.RegistrantID = @RegID

GO
