/****** Object:  View [dbo].[Join_JournalTimeCardActivity]    Script Date: 5/15/2018 12:14:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW Join_JournalTimeCardActivity AS SELECT     J.ID, J.StoreID, J.ClassTypeID, J.ModifiedByUser, J.ModifiedByComputer, J.ModifiedDate, J.SeqID, J.IsSystem, J.IsActive, J.JournalActivityType, 
                      J.JournalActivityText, J.Description, J.HasCalendarLinks, J.EmployeeID, J.StartDateTime, J.EndDateTime, J.TotalTime, J.IsSummary, J.IsDetail, 
                      J.SummaryID, J.SummaryClassTypeID, TC.StatusID, TC.StatusName, J.AccountID, J.AccountClassTypeID, J.ContactID, J.ContactClassTypeID, 
                      J.TransactionID, J.TransactionClassTypeID, TC.TransDetailID, TC.TransDetailStoreID, TC.TransDetailClassTypeID, TC.TransPartID, 
                      TC.TransPartStoreID, TC.TransPartClassTypeID, J.PartID, J.PartClassTypeID, J.LinkID, J.LinkStoreID, J.LinkClassTypeID, J.IsBillable, 
                      J.BillableDateTime, J.UseActualTime, J.BillingType, J.TotalBilledTime, J.DivisionID, TC.AdjustedByID, TC.ManuallyAdjusted, J.QueryStartDateTime, TC.CanCreatePartUsageCard,
                      J.QueryEndDateTime, TC.PartUsageCardID, TH.StatusID AS TransheaderStatusID, TH.TransactionType, TH.StatusText AS TransheaderStatusText
FROM         Journal AS J LEFT OUTER JOIN
                      TimeCard AS TC ON J.ID = TC.ID LEFT OUTER JOIN
                      TransHeader AS TH ON J.TransactionID = TH.ID AND J.TransactionClassTypeID = TH.ClassTypeID
WHERE     (J.ClassTypeID = 20051)

GO
