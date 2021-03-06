/****** Object:  Table [dbo].[sysmail_attachments_transfer]    Script Date: 5/15/2018 12:03:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmail_attachments_transfer](
	[transfer_id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[filename] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[filesize] [int] NOT NULL,
	[attachment] [varbinary](max) NULL,
	[create_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transfer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[sysmail_attachments_transfer] ADD  DEFAULT (getdate()) FOR [create_date]
GO
