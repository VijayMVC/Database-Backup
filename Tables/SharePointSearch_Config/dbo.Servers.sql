/****** Object:  Table [dbo].[Servers]    Script Date: 5/15/2018 12:06:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Servers](
	[ServerId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Address] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[LastModifiedUser] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LastModifiedServer] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Status] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[Properties] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
 CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED 
(
	[ServerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Servers_Address] UNIQUE NONCLUSTERED 
(
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Servers] ADD  DEFAULT ((0)) FOR [Status]
GO
