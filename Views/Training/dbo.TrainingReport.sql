/****** Object:  View [dbo].[TrainingReport]    Script Date: 5/15/2018 12:14:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.TrainingReport
AS
SELECT     TOP 100 PERCENT R.FirstName, R.LastName, R.StorePosition, R.StoreNumber, R.City, R.State, R.FBCTradeOut AS TradeOut, M.Title AS Class, 
                      CONVERT(varchar, S.StartDate, 101) AS ClassDate
FROM         dbo.Registrants R INNER JOIN
                      dbo.SubClasses S ON R.SubClass = S.ID AND R.Active = 1 AND (S.StartDate BETWEEN '1/1/2002' AND '12/31/2003' OR
                      R.RegisteredDate BETWEEN '1/1/2002' AND '12/31/2003') INNER JOIN
                      dbo.MasterClasses M ON S.MasterClass = M.ID
ORDER BY R.LastName

GO
