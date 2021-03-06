/****** Object:  Table [dbo].[phpkb_backups]    Script Date: 5/15/2018 11:59:16 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_backups](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[backup_type] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[creation_date] [smalldatetime] NOT NULL,
	[created_by] [int] NOT NULL,
 CONSTRAINT [backup_id] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_backups] ADD  DEFAULT ((0)) FOR [created_by]
GO
