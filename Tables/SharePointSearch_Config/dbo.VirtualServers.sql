/****** Object:  Table [dbo].[VirtualServers]    Script Date: 5/15/2018 12:06:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[VirtualServers](
	[VirtualServerId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[SmtpServiceId] [uniqueidentifier] NULL,
	[MailCodePage] [int] NULL,
	[FromAddress] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ReplyToAddress] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastModified] [datetime] NOT NULL,
	[LastModifiedUser] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LastModifiedServer] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Status] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[Properties] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
 CONSTRAINT [PK_VirtualServers] PRIMARY KEY CLUSTERED 
(
	[VirtualServerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_VirtualServers_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[VirtualServers] ADD  DEFAULT ((0)) FOR [Status]
ALTER TABLE [dbo].[VirtualServers]  WITH NOCHECK ADD  CONSTRAINT [FK_VirtualServers_SmtpServiceId] FOREIGN KEY([SmtpServiceId])
REFERENCES [dbo].[Services] ([ServiceId])
ALTER TABLE [dbo].[VirtualServers] CHECK CONSTRAINT [FK_VirtualServers_SmtpServiceId]
GO
