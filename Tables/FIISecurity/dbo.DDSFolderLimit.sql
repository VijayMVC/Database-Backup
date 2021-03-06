/****** Object:  Table [dbo].[DDSFolderLimit]    Script Date: 5/15/2018 12:00:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DDSFolderLimit](
	[DDSFolderLimitID] [int] IDENTITY(1,1) NOT NULL,
	[WebNumber] [int] NULL,
	[FolderLimit] [int] NOT NULL,
	[AccountLock] [bit] NOT NULL,
	[DateToLock] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DDSFolderLimit] PRIMARY KEY CLUSTERED 
(
	[DDSFolderLimitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_DDSFolderLimit]    Script Date: 5/15/2018 12:00:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_DDSFolderLimit] ON [dbo].[DDSFolderLimit]
(
	[WebNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[DDSFolderLimit] ADD  CONSTRAINT [DF_DDSFolderLimit_Active]  DEFAULT ((0)) FOR [AccountLock]
GO
