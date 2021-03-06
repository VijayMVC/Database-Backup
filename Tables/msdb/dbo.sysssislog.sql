/****** Object:  Table [dbo].[sysssislog]    Script Date: 5/15/2018 12:03:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysssislog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[computer] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[operator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[source] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sourceid] [uniqueidentifier] NOT NULL,
	[executionid] [uniqueidentifier] NOT NULL,
	[starttime] [datetime] NOT NULL,
	[endtime] [datetime] NOT NULL,
	[datacode] [int] NOT NULL,
	[databytes] [image] NULL,
	[message] [nvarchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
