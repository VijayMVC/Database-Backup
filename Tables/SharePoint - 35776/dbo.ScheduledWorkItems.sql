/****** Object:  Table [dbo].[ScheduledWorkItems]    Script Date: 5/15/2018 12:05:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ScheduledWorkItems](
	[SiteId] [uniqueidentifier] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Type] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemGuid] [varbinary](16) NULL,
	[BatchId] [varbinary](16) NULL,
	[WebId] [varbinary](16) NULL,
	[UserId] [int] NOT NULL,
	[Created] [datetime] NULL,
	[BinaryPayload] [image] NULL,
	[TextPayload] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ProcessingId] [uniqueidentifier] NULL,
	[ProcessMachineId] [uniqueidentifier] NULL,
	[ProcessMachinePID] [int] NULL,
	[InternalState] [int] NULL,
 CONSTRAINT [ScheduledWorkItems_IdUnique] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [ScheduledWorkItems_OnDateType]    Script Date: 5/15/2018 12:05:44 PM ******/
CREATE CLUSTERED INDEX [ScheduledWorkItems_OnDateType] ON [dbo].[ScheduledWorkItems]
(
	[Type] ASC,
	[DeliveryDate] ASC,
	[SiteId] ASC,
	[UserId] ASC,
	[WebId] ASC,
	[BatchId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [ScheduledWorkItems_OnId]    Script Date: 5/15/2018 12:05:44 PM ******/
CREATE NONCLUSTERED INDEX [ScheduledWorkItems_OnId] ON [dbo].[ScheduledWorkItems]
(
	[SiteId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [ScheduledWorkItems_OnListKey]    Script Date: 5/15/2018 12:05:44 PM ******/
CREATE NONCLUSTERED INDEX [ScheduledWorkItems_OnListKey] ON [dbo].[ScheduledWorkItems]
(
	[SiteId] ASC,
	[ParentId] ASC,
	[Type] ASC,
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[ScheduledWorkItems] ADD  DEFAULT ((0)) FOR [ItemId]
ALTER TABLE [dbo].[ScheduledWorkItems] ADD  DEFAULT ((0)) FOR [UserId]
GO
