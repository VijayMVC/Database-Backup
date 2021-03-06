/****** Object:  Table [dbo].[zipcodes]    Script Date: 5/15/2018 12:01:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[zipcodes](
	[City] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ST] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[A/C] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FIPS] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Pref?] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T/Z] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DST?] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
