/****** Object:  Table [dbo].[xf_permission_entry]    Script Date: 5/15/2018 12:00:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_permission_entry](
	[permission_entry_id] [bigint] IDENTITY(1471,1) NOT NULL,
	[user_group_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[permission_group_id] [varbinary](25) NOT NULL,
	[permission_id] [varbinary](25) NOT NULL,
	[permission_value] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[permission_value_int] [int] NOT NULL,
 CONSTRAINT [PK_xf_permission_entry_permission_entry_id] PRIMARY KEY CLUSTERED 
(
	[permission_entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_permission_entry$unique_permission] UNIQUE NONCLUSTERED 
(
	[user_group_id] ASC,
	[user_id] ASC,
	[permission_group_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
