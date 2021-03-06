/****** Object:  Table [dbo].[ANLShadowResource]    Script Date: 5/15/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ANLShadowResource](
	[ResourceId] [int] NOT NULL,
	[WebAppGuid] [uniqueidentifier] NOT NULL,
	[SiteGuid] [uniqueidentifier] NOT NULL,
	[WebGuid] [uniqueidentifier] NOT NULL,
	[DocName] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[FullUrl] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[HostDns] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY]

GO
