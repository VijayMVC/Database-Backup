/****** Object:  Table [dbo].[ANLShadowWeb]    Script Date: 5/15/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ANLShadowWeb](
	[WebGuid] [uniqueidentifier] NOT NULL,
	[WebUrl] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY]

GO
