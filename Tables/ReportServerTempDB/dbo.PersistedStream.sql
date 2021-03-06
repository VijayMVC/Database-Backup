/****** Object:  Table [dbo].[PersistedStream]    Script Date: 5/15/2018 12:05:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PersistedStream](
	[SessionID] [varchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Index] [int] NOT NULL,
	[Content] [image] NULL,
	[Name] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[MimeType] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Extension] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Encoding] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Error] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[RefCount] [int] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PersistedStream] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC,
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
