/****** Object:  Table [dbo].[FC_Employee]    Script Date: 5/15/2018 12:00:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_Employee](
	[referenceId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[salutation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[firstName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lastName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[country] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[state] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zipcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fax] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mobile] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[email] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_role1338702800] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_birthdate1801414912] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[muidValue] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
