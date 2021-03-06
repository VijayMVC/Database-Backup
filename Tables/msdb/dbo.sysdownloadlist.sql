/****** Object:  Table [dbo].[sysdownloadlist]    Script Date: 5/15/2018 12:03:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysdownloadlist](
	[instance_id] [int] IDENTITY(1,1) NOT NULL,
	[source_server] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[operation_code] [tinyint] NOT NULL,
	[object_type] [tinyint] NOT NULL,
	[object_id] [uniqueidentifier] NOT NULL,
	[target_server] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[error_message] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date_posted] [datetime] NOT NULL,
	[date_downloaded] [datetime] NULL,
	[status] [tinyint] NOT NULL,
	[deleted_object_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

/****** Object:  Index [clust]    Script Date: 5/15/2018 12:03:03 PM ******/
CREATE UNIQUE CLUSTERED INDEX [clust] ON [dbo].[sysdownloadlist]
(
	[instance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [nc1]    Script Date: 5/15/2018 12:03:03 PM ******/
CREATE NONCLUSTERED INDEX [nc1] ON [dbo].[sysdownloadlist]
(
	[target_server] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [nc2]    Script Date: 5/15/2018 12:03:03 PM ******/
CREATE NONCLUSTERED INDEX [nc2] ON [dbo].[sysdownloadlist]
(
	[object_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
