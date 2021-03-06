/****** Object:  Table [dbo].[xf_admin_template_modification]    Script Date: 5/15/2018 12:00:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_admin_template_modification](
	[modification_id] [bigint] IDENTITY(1,1) NOT NULL,
	[addon_id] [varbinary](25) NOT NULL,
	[template] [varbinary](50) NOT NULL,
	[modification_key] [varbinary](50) NOT NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[execution_order] [bigint] NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[action] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[find] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[replace] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_admin_template_modification_modification_id] PRIMARY KEY CLUSTERED 
(
	[modification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_admin_template_modification$modification_key] UNIQUE NONCLUSTERED 
(
	[modification_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [addon_id]    Script Date: 5/15/2018 12:00:15 PM ******/
CREATE NONCLUSTERED INDEX [addon_id] ON [dbo].[xf_admin_template_modification]
(
	[addon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [template_order]    Script Date: 5/15/2018 12:00:15 PM ******/
CREATE NONCLUSTERED INDEX [template_order] ON [dbo].[xf_admin_template_modification]
(
	[template] ASC,
	[execution_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
