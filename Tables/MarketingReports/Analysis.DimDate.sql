/****** Object:  Table [Analysis].[DimDate]    Script Date: 5/15/2018 12:02:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[DimDate](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Half_Year] [datetime] NULL,
	[Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Week] [datetime] NULL,
	[Week_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_of_Year] [int] NULL,
	[Day_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_of_Half_Year] [int] NULL,
	[Day_of_Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_of_Quarter] [int] NULL,
	[Day_of_Quarter_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_of_Month] [int] NULL,
	[Day_of_Month_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_of_Week] [int] NULL,
	[Day_of_Week_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Week_of_Year] [int] NULL,
	[Week_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Month_of_Year] [int] NULL,
	[Month_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Month_of_Half_Year] [int] NULL,
	[Month_of_Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Month_of_Quarter] [int] NULL,
	[Month_of_Quarter_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quarter_of_Year] [int] NULL,
	[Quarter_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quarter_of_Half_Year] [int] NULL,
	[Quarter_of_Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Half_Year_of_Year] [int] NULL,
	[Half_Year_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Year] [datetime] NULL,
	[Fiscal_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Half_Year] [datetime] NULL,
	[Fiscal_Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Quarter] [datetime] NULL,
	[Fiscal_Quarter_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Month] [datetime] NULL,
	[Fiscal_Month_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Week] [datetime] NULL,
	[Fiscal_Week_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Day] [datetime] NULL,
	[Fiscal_Day_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Day_of_Year] [int] NULL,
	[Fiscal_Day_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Day_of_Half_Year] [int] NULL,
	[Fiscal_Day_of_Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Day_of_Quarter] [int] NULL,
	[Fiscal_Day_of_Quarter_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Day_of_Month] [int] NULL,
	[Fiscal_Day_of_Month_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Day_of_Week] [int] NULL,
	[Fiscal_Day_of_Week_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Week_of_Year] [int] NULL,
	[Fiscal_Week_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Month_of_Year] [int] NULL,
	[Fiscal_Month_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Month_of_Half_Year] [int] NULL,
	[Fiscal_Month_of_Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Month_of_Quarter] [int] NULL,
	[Fiscal_Month_of_Quarter_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Quarter_of_Year] [int] NULL,
	[Fiscal_Quarter_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Quarter_of_Half_Year] [int] NULL,
	[Fiscal_Quarter_of_Half_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_Half_Year_of_Year] [int] NULL,
	[Fiscal_Half_Year_of_Year_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_DimDate]    Script Date: 5/15/2018 12:02:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_DimDate] ON [Analysis].[DimDate]
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_DimDate_1]    Script Date: 5/15/2018 12:02:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_DimDate_1] ON [Analysis].[DimDate]
(
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
