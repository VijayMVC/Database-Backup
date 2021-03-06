/****** Object:  StoredProcedure [dbo].[rc_GetRegInfo]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE rc_GetRegInfo
(   @RegID int )

AS

SELECT R.FirstName, R.LastName, R.StorePosition, R.City, R.State, R.StoreNumber, S.StartDate
FROM Registrants R INNER JOIN Subclasses S ON R.Subclass = S.ID
WHERE R.ID = @RegID

GO
