/****** Object:  Table [dbo].[backupmediafamily]    Script Date: 5/15/2018 12:02:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[backupmediafamily](
	[media_set_id] [int] NOT NULL,
	[family_sequence_number] [tinyint] NOT NULL,
	[media_family_id] [uniqueidentifier] NULL,
	[media_count] [int] NULL,
	[logical_device_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[physical_device_name] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[device_type] [tinyint] NULL,
	[physical_block_size] [int] NULL,
	[mirror] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[media_set_id] ASC,
	[family_sequence_number] ASC,
	[mirror] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [backupmediafamilyuuid]    Script Date: 5/15/2018 12:02:53 PM ******/
CREATE NONCLUSTERED INDEX [backupmediafamilyuuid] ON [dbo].[backupmediafamily]
(
	[media_family_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[backupmediafamily] ADD  DEFAULT ((0)) FOR [mirror]
ALTER TABLE [dbo].[backupmediafamily]  WITH CHECK ADD FOREIGN KEY([media_set_id])
REFERENCES [dbo].[backupmediaset] ([media_set_id])
GO
