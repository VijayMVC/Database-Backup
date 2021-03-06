/****** Object:  Table [dbo].[ServerParametersInstance]    Script Date: 5/15/2018 12:05:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ServerParametersInstance](
	[ServerParametersID] [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ParentID] [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Path] [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Timeout] [int] NOT NULL,
	[Expiration] [datetime] NOT NULL,
	[ParametersValues] [image] NOT NULL,
 CONSTRAINT [PK_ServerParametersInstance] PRIMARY KEY CLUSTERED 
(
	[ServerParametersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_ServerParametersInstanceExpiration]    Script Date: 5/15/2018 12:05:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServerParametersInstanceExpiration] ON [dbo].[ServerParametersInstance]
(
	[Expiration] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
