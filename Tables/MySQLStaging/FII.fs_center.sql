/****** Object:  Table [FII].[fs_center]    Script Date: 5/15/2018 12:04:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [FII].[fs_center](
	[fs_center_id] [int] IDENTITY(1,1) NOT NULL,
	[center_number] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[region] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_fs_center] PRIMARY KEY CLUSTERED 
(
	[fs_center_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
