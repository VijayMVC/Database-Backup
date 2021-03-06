/****** Object:  Table [dbo].[dm_launch_status]    Script Date: 5/15/2018 12:04:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[dm_launch_status](
	[launch_status_cd] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[status_nm] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[order_no] [int] NULL,
 CONSTRAINT [PK_dm_launch_status_launch_status_cd] PRIMARY KEY CLUSTERED 
(
	[launch_status_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[dm_launch_status] ADD  DEFAULT (NULL) FOR [status_nm]
ALTER TABLE [dbo].[dm_launch_status] ADD  DEFAULT (NULL) FOR [order_no]
GO
