/****** Object:  Table [dbo].[COR_CONTACT_INFO_FROM_GOLDMINE]    Script Date: 5/15/2018 12:01:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_CONTACT_INFO_FROM_GOLDMINE](
	[ImportStatus] [int] NULL,
	[WebNumber] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COUNTRY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE1] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT1] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE2] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT2] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE3] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT3] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FAX] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lat] [numeric](9, 0) NULL,
	[Long] [numeric](9, 0) NULL,
	[GoldmineID] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FBC] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpenDate] [datetime] NULL,
	[SoldDate] [datetime] NULL,
	[StoreStatus] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
