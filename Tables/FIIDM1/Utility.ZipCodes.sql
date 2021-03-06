/****** Object:  Table [Utility].[ZipCodes]    Script Date: 5/15/2018 11:59:58 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Utility].[ZipCodes](
	[ZipCode] [int] NOT NULL,
	[PrimaryRecord] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Population] [int] NULL,
	[HouseholdsPerZipcode] [decimal](18, 8) NULL,
	[WhitePopulation] [int] NULL,
	[BlackPopulation] [int] NULL,
	[HispanicPopulation] [int] NULL,
	[AsianPopulation] [int] NULL,
	[HawaiianPopulation] [int] NULL,
	[IndianPopulation] [int] NULL,
	[OtherPopulation] [int] NULL,
	[MalePopulation] [int] NULL,
	[FemalePopulation] [int] NULL,
	[PersonsPerHousehold] [decimal](18, 2) NULL,
	[AverageHouseValue] [decimal](18, 8) NULL,
	[IncomePerHousehold] [decimal](18, 8) NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Elevation] [int] NULL,
	[State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateFullName] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CityType] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CityAliasAbbreviation] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AreaCode] [varchar](55) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CityAliasName] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountyName] [varchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountyFIPS] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateFIPS] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TimeZone] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DayLightSaving] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MSA] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PMSA] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CSA] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBSA] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBSA_DIV] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBSA_Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBSA_Name] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MSA_Name] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PMSA_Name] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Region] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Division] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MailingName] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PreferredLastLineKey] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClassificationCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MultiCounty] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CSAName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBSA_Div_Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CityStateKey] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostalCode]  AS (right('0000'+CONVERT([varchar],[ZIPCODE],(0)),(5)))
) ON [PRIMARY]

/****** Object:  Index [IX_ZipCodes]    Script Date: 5/15/2018 11:59:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ZipCodes] ON [Utility].[ZipCodes]
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
