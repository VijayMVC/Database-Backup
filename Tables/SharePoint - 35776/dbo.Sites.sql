/****** Object:  Table [dbo].[Sites]    Script Date: 5/15/2018 12:05:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Sites](
	[FullUrl] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[NextUserOrGroupId] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[SecondaryContactID] [int] NULL,
	[Subscribed] [bit] NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
	[UsersCount] [int] NULL,
	[BWUsed] [bigint] NULL,
	[DiskUsed] [bigint] NULL,
	[SecondStageDiskUsed] [bigint] NULL,
	[QuotaTemplateID] [smallint] NULL,
	[DiskQuota] [bigint] NULL,
	[UserQuota] [int] NULL,
	[DiskWarning] [bigint] NULL,
	[DiskWarned] [datetime] NULL,
	[BitFlags] [int] NULL,
	[SecurityVersion] [bigint] NULL,
	[CertificationDate] [datetime] NULL,
	[DeadWebNotifyCount] [smallint] NOT NULL,
	[PortalURL] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PortalName] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastContentChange] [datetime] NOT NULL,
	[LastSecurityChange] [datetime] NOT NULL,
	[AuditFlags] [int] NULL,
	[InheritAuditFlags] [int] NULL,
	[UserInfoListId] [uniqueidentifier] NULL,
	[UserIsActiveFieldRowOrdinal] [int] NULL,
	[UserIsActiveFieldColumnName] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[UserAccountDirectoryPath] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[RootWebId] [uniqueidentifier] NULL,
	[HashKey] [binary](16) NULL,
	[DomainGroupMapVersion] [bigint] NOT NULL,
	[DomainGroupMapCacheVersion] [bigint] NOT NULL,
	[DomainGroupMapCache] [image] NULL,
	[HostHeader] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EmailEnabled] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Sites_Id]    Script Date: 5/15/2018 12:05:44 PM ******/
CREATE UNIQUE CLUSTERED INDEX [Sites_Id] ON [dbo].[Sites]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT (N'') FOR [FullUrl]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [Subscribed]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((1)) FOR [UsersCount]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [BWUsed]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [DiskUsed]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [SecondStageDiskUsed]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [QuotaTemplateID]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [DiskQuota]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [UserQuota]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [DiskWarning]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [BitFlags]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [SecurityVersion]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [DeadWebNotifyCount]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT (getutcdate()) FOR [LastContentChange]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT (getutcdate()) FOR [LastSecurityChange]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [DomainGroupMapVersion]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((-1)) FOR [DomainGroupMapCacheVersion]
ALTER TABLE [dbo].[Sites] ADD  DEFAULT ((0)) FOR [EmailEnabled]
GO
