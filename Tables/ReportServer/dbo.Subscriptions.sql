/****** Object:  Table [dbo].[Subscriptions]    Script Date: 5/15/2018 12:05:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Subscriptions](
	[SubscriptionID] [uniqueidentifier] NOT NULL,
	[OwnerID] [uniqueidentifier] NOT NULL,
	[Report_OID] [uniqueidentifier] NOT NULL,
	[Locale] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[InactiveFlags] [int] NOT NULL,
	[ExtensionSettings] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ModifiedByID] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Description] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastStatus] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EventType] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[MatchData] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastRunTime] [datetime] NULL,
	[Parameters] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DataSettings] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DeliveryExtension] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Version] [int] NOT NULL,
	[ReportZone] [int] NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Subscriptions] ADD  DEFAULT ((0)) FOR [ReportZone]
ALTER TABLE [dbo].[Subscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Subscriptions_Catalog] FOREIGN KEY([Report_OID])
REFERENCES [dbo].[Catalog] ([ItemID])
ON DELETE CASCADE
NOT FOR REPLICATION 
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Catalog]
ALTER TABLE [dbo].[Subscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Subscriptions_ModifiedBy] FOREIGN KEY([ModifiedByID])
REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_ModifiedBy]
ALTER TABLE [dbo].[Subscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Subscriptions_Owner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Owner]
/****** Object:  Trigger [dbo].[Subscription_delete_DataSource]    Script Date: 5/15/2018 12:05:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- end session tables

CREATE TRIGGER [dbo].[Subscription_delete_DataSource] ON [dbo].[Subscriptions]
AFTER DELETE 
AS
    delete DataSource from DataSource DS inner join deleted D on DS.SubscriptionID = D.SubscriptionID

/****** Object:  Trigger [dbo].[Subscription_delete_Schedule]    Script Date: 5/15/2018 12:05:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[Subscription_delete_Schedule] ON [dbo].[Subscriptions] 
AFTER DELETE 
AS
    delete ReportSchedule from ReportSchedule RS inner join deleted D on RS.SubscriptionID = D.SubscriptionID

GO
