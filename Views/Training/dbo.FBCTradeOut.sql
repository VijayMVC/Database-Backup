/****** Object:  View [dbo].[FBCTradeOut]    Script Date: 5/15/2018 12:14:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.FBCTradeOut
AS
SELECT    TOP 100 PERCENT R.FirstName + ' ' + R.LastName AS Name, R.StoreNumber, M.Title AS Class, convert(varchar, S.StartDate, 101) AS [Date], R.FBCName AS FBC
FROM         dbo.Registrants R INNER JOIN
                      dbo.SubClasses S ON R.SubClass = S.ID INNER JOIN
                      dbo.MasterClasses M ON S.MasterClass = M.ID
WHERE     (R.FBCTradeOut = 1)
AND Year(S.StartDate) = Year(getDate())
ORDER BY R.LastName



GO
