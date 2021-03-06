/****** Object:  Table [dbo].[ReportSchedule]    Script Date: 5/15/2018 12:05:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ReportSchedule](
	[ScheduleID] [uniqueidentifier] NOT NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[SubscriptionID] [uniqueidentifier] NULL,
	[ReportAction] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_ReportSchedule_ReportID]    Script Date: 5/15/2018 12:05:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ReportID] ON [dbo].[ReportSchedule]
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_ReportSchedule_ScheduleID]    Script Date: 5/15/2018 12:05:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ScheduleID] ON [dbo].[ReportSchedule]
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_ReportSchedule_SubscriptionID]    Script Date: 5/15/2018 12:05:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_SubscriptionID] ON [dbo].[ReportSchedule]
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[ReportSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ReportSchedule_Report] FOREIGN KEY([ReportID])
REFERENCES [dbo].[Catalog] ([ItemID])
ON DELETE CASCADE
ALTER TABLE [dbo].[ReportSchedule] CHECK CONSTRAINT [FK_ReportSchedule_Report]
ALTER TABLE [dbo].[ReportSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ReportSchedule_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
ON DELETE CASCADE
ALTER TABLE [dbo].[ReportSchedule] CHECK CONSTRAINT [FK_ReportSchedule_Schedule]
ALTER TABLE [dbo].[ReportSchedule]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportSchedule_Subscriptions] FOREIGN KEY([SubscriptionID])
REFERENCES [dbo].[Subscriptions] ([SubscriptionID])
NOT FOR REPLICATION 
ALTER TABLE [dbo].[ReportSchedule] NOCHECK CONSTRAINT [FK_ReportSchedule_Subscriptions]
/****** Object:  Trigger [dbo].[ReportSchedule_Schedule]    Script Date: 5/15/2018 12:05:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[ReportSchedule_Schedule] ON [dbo].[ReportSchedule]
AFTER DELETE
AS

-- if the deleted row is the last connection between a schedule and a report delete the schedule
-- as long as the schedule is not a shared schedule (type == 0)
delete [Schedule] from 
    [Schedule] S inner join deleted D on S.[ScheduleID] = D.[ScheduleID] 
where
    S.[Type] != 0 and
    not exists (select * from [ReportSchedule] R where S.[ScheduleID] = R.[ScheduleID])

GO
