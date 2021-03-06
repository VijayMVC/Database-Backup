/****** Object:  Table [dbo].[xf_warning_definition]    Script Date: 5/15/2018 12:00:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_warning_definition](
	[warning_definition_id] [bigint] IDENTITY(5,1) NOT NULL,
	[points_default] [int] NOT NULL,
	[expiry_type] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[expiry_default] [int] NOT NULL,
	[extra_user_group_ids] [varbinary](255) NOT NULL,
	[is_editable] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_warning_definition_warning_definition_id] PRIMARY KEY CLUSTERED 
(
	[warning_definition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [points_default]    Script Date: 5/15/2018 12:00:42 PM ******/
CREATE NONCLUSTERED INDEX [points_default] ON [dbo].[xf_warning_definition]
(
	[points_default] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
