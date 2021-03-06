/****** Object:  View [dbo].[Join_PayrollPaycheckPayItem]    Script Date: 5/15/2018 12:14:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW Join_PayrollPaycheckPayItem AS SELECT ppi.ID, ppi.StoreID, ppi.ClassTypeID, ppi.IsSystem, ppi.IsActive, ppi.PaycheckID, ppi.EmployeeID,
       ppi.PayItemID, ppi.PayItemClassTypeID, ppi.Amount, ppi.AmountOV, ppi.CalcAmount, ppi.OVAmount,
       ppi.IsMissed, ppi.PayItemType, ppi.PayItemText, ppi.Hours, ppi.ShowOnPaycheck, pc.PayrollID,
       pc.PayrollClassTypeID, pc.IsVoided, pc.CheckNumber,pc.ProcessedDate, pr.PeriodStartDate, pr.PeriodEndDate

FROM   PayrollPaycheckPayItem ppi
       LEFT OUTER JOIN PayrollPaycheck pc ON pc.ID = ppi.PayCheckID
       LEFT OUTER JOIN Payroll pr ON pr.ID = pc.PayRollID

Where  ppi.ID > 0

GO
