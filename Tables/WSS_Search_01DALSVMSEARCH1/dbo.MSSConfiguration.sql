/****** Object:  Table [dbo].[MSSConfiguration]    Script Date: 5/15/2018 12:09:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSConfiguration](
	[Name] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Value] [sql_variant] NULL,
	[BigValue] [image] NULL,
	[LastModified] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
