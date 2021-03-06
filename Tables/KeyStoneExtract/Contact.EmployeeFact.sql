/****** Object:  Table [Contact].[EmployeeFact]    Script Date: 5/15/2018 12:02:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[EmployeeFact](
	[EmployeeKey] [int] NOT NULL,
	[CenterKey] [int] NULL,
	[EmployeeID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Birthdate] [date] NULL,
	[HireDate] [date] NULL,
	[TerminationDate] [date] NULL,
	[PhoneNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FaxNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomePhoneNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipKey] [int] NULL,
	[DepartmentKey] [int] NULL,
	[SalesPerson] [bit] NULL,
	[CommissionSales] [bit] NULL,
	[IsActive] [bit] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
 CONSTRAINT [PK_EmployeeFact] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
