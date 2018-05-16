/****** Object:  Table [dbo].[MSSSchemaParameters]    Script Date: 5/15/2018 12:09:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSchemaParameters](
	[ParamName] [nvarchar](40) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[IsString] [bit] NULL,
	[strValue] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[fltValue] [float] NULL
) ON [PRIMARY]

GO
