/****** Object:  Table [dbo].[Features]    Script Date: 5/15/2018 12:05:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Features](
	[SiteId] [uniqueidentifier] NOT NULL,
	[WebId] [uniqueidentifier] NOT NULL,
	[FeatureId] [uniqueidentifier] NOT NULL,
	[TimeActivated] [datetime] NOT NULL,
	[Flags] [int] NOT NULL,
	[Properties] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PropertiesModified] [datetime] NOT NULL,
 CONSTRAINT [Features_PK] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC,
	[WebId] ASC,
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Features] ADD  DEFAULT (getutcdate()) FOR [TimeActivated]
GO
