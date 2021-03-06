/****** Object:  View [dbo].[Join_JournalContactActivity]    Script Date: 5/15/2018 12:14:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW Join_JournalContactActivity AS SELECT J.[ID], J.[StoreID], J.[ClassTypeID],
       J.[ModifiedByUser], J.[ModifiedByComputer], J.[ModifiedDate], J.[SeqID], J.[IsSystem], J.[IsActive],
       J.[EmployeeID], J.[JournalActivityType], J.[JournalActivityText], J.[Description], J.[Notes],
       J.[StartDateTime], J.[EndDateTime], J.[TotalTime], J.[ScheduledDateTime], J.[CompletedByID], J.[CompletedDateTime],
       J.[IsSummary], J.[IsDetail], J.[SummaryID], J.[SummaryClassTypeID], J.[SummaryAmount], J.[DetailAmount],
       J.[StartGLGroupID], J.[EndGLGroupID], J.[AccountID], J.[AccountClassTypeID], J.[ContactID], J.[ContactClassTypeID],
       J.[TransactionID], J.[TransactionClassTypeID], J.[IsVoided], J.[VoidedDateTime], J.[VoidedEntryID], J.[VoidedEntryClassTypeID],
       J.[VoidedReason], J.[QueryStartDateTime], J.[QueryEndDateTime], J.[ReminderDateTime], J.[ReminderPrompt], J.[HasCalendarLinks], 
       CA.[AutoRollOver], CA.[AutoRun], CA.[Color], CA.[CreatedByID], CA.[CreatedDateTime], CA.[ImageID],
       CA.[IsFromRecurring], CA.[IsTimeless], CA.[OriginalScheduledDateTime], CA.[Priority], CA.[PriorityText],
       CA.[PrivateEvent], CA.[RecurringActivityID], CA.[RunWithoutPrompting], CA.[ScheduledEndDateTime],
       CA.[ScheduledStartDateTime], CA.[PartInstanceID], CA.[ValidStatus], CA.[TransPartID]
FROM [Journal] J
INNER JOIN [ContactActivity] CA ON (J.[ID]=CA.[ID])
                                    AND (J.[ClassTypeID]=CA.[ClassTypeID])

GO
