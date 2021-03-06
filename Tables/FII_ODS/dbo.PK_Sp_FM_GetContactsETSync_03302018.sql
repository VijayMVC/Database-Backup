/****** Object:  Table [dbo].[PK_Sp_FM_GetContactsETSync_03302018]    Script Date: 5/15/2018 11:59:26 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PK_Sp_FM_GetContactsETSync_03302018](
	[ContactKey] [int] NULL,
	[CenterKey] [int] NULL,
	[CustomerID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyNameName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountyName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountryName] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Prospect] [bit] NULL,
	[CreateDate] [date] NULL,
	[LastOrderDate] [date] NULL,
	[LastPickedUpDate] [date] NULL,
	[SalesSubtotal] [money] NULL,
	[ActiveCustomer] [bit] NULL,
	[SalesPersonFirstName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesPersonLastName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FaxNumber] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BirthMonth] [smallint] NULL,
	[BirthDay] [int] NULL,
	[IsModified] [bit] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[CleanedIndustry] [varchar](186) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IndustryTypeName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NULL,
	[DoNotEmail] [bit] NULL
) ON [PRIMARY]

GO
