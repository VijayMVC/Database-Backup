/****** Object:  Table [dbo].[EmployeeFact]    Script Date: 5/15/2018 12:06:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EmployeeFact](
	[EmployeeID] [int] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FirstName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Birthdate] [date] NULL,
	[HireDate] [date] NULL,
	[TerminationDate] [date] NULL,
	[Title] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FaxNumber] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeStoreID] [int] NULL,
	[Department] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomePhoneNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PagerNumber] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CellularPhoneNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CurrentStatus] [smallint] NULL,
	[PricingRatio] [float] NULL,
	[ReportsToID] [int] NULL,
	[SalesPerson] [bit] NULL,
	[CommissionSales] [bit] NULL,
	[Active] [bit] NULL,
	[OLTP_InsertDate] [datetime] NOT NULL,
	[OLTP_UpdateDate] [datetime] NOT NULL,
	[UpdateCheckSum] [int] NOT NULL
) ON [PRIMARY]

GO
