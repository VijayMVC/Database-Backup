/****** Object:  Table [dbo].[fs_report_permissions]    Script Date: 5/15/2018 12:02:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[fs_report_permissions](
	[fs_report_type_id] [int] NOT NULL,
	[fs_role_id] [int] NOT NULL,
	[fs_center_id] [int] NOT NULL
) ON [PRIMARY]

GO
