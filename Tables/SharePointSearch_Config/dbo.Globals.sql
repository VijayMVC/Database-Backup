/****** Object:  Table [dbo].[Globals]    Script Date: 5/15/2018 12:06:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Globals](
	[GlobalId] [uniqueidentifier] NOT NULL,
	[SchemaVersion] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[UseHostHeader] [bit] NOT NULL,
	[UseNtAuthForDatabase] [bit] NOT NULL,
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
 CONSTRAINT [PK_Globals] PRIMARY KEY CLUSTERED 
(
	[GlobalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Globals] ADD  DEFAULT ((0)) FOR [UseHostHeader]
ALTER TABLE [dbo].[Globals] ADD  DEFAULT ((1)) FOR [UseNtAuthForDatabase]
ALTER TABLE [dbo].[Globals] ADD  DEFAULT ((0)) FOR [Status]
ALTER TABLE [dbo].[Globals]  WITH NOCHECK ADD  CONSTRAINT [FK_Globals_SmtpServiceId] FOREIGN KEY([SmtpServiceId])
REFERENCES [dbo].[Services] ([ServiceId])
ALTER TABLE [dbo].[Globals] CHECK CONSTRAINT [FK_Globals_SmtpServiceId]
GO
