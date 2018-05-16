/****** Object:  Table [dbo].[sf_security_roots]    Script Date: 5/15/2018 12:02:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_security_roots](
	[id] [uniqueidentifier] NOT NULL,
	[ky] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
 CONSTRAINT [pk_sf_security_roots] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_security_roots]    Script Date: 5/15/2018 12:02:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_security_roots] ON [dbo].[sf_security_roots]
(
	[ky] ASC,
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
