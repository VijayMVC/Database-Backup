/****** Object:  Table [dbo].[CompaniesUsers]    Script Date: 5/15/2018 11:59:02 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CompaniesUsers](
	[CompanyLocationId] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FranchiseName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [int] NULL,
	[IsSalesperson] [int] NULL,
	[IsDesigner] [int] NULL
) ON [PRIMARY]

GO
