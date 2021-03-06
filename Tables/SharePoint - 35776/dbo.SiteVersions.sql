/****** Object:  Table [dbo].[SiteVersions]    Script Date: 5/15/2018 12:05:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SiteVersions](
	[SiteId] [uniqueidentifier] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[Version] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
 CONSTRAINT [SiteVersions_PK] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC,
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
