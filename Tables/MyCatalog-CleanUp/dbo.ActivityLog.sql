/****** Object:  Table [dbo].[ActivityLog]    Script Date: 5/15/2018 12:03:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ActivityLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityLogTypeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Comment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ActivityLogTypeID_Cover]    Script Date: 5/15/2018 12:03:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityLogTypeID_Cover] ON [dbo].[ActivityLog]
(
	[ActivityLogTypeId] ASC
)
INCLUDE ( 	[CustomerId],
	[Comment],
	[CreatedOnUtc]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[ActivityLog]  WITH CHECK ADD  CONSTRAINT [ActivityLog_ActivityLogType] FOREIGN KEY([ActivityLogTypeId])
REFERENCES [dbo].[ActivityLogType] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[ActivityLog] CHECK CONSTRAINT [ActivityLog_ActivityLogType]
ALTER TABLE [dbo].[ActivityLog]  WITH CHECK ADD  CONSTRAINT [ActivityLog_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[ActivityLog] CHECK CONSTRAINT [ActivityLog_Customer]
GO
