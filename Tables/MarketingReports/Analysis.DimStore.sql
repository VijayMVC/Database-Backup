/****** Object:  Table [Analysis].[DimStore]    Script Date: 5/15/2018 12:02:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[DimStore](
	[PK_Store] [int] IDENTITY(1,1) NOT NULL,
	[DimStore_SCD_Original_ID] [int] NULL,
	[DimStore_SCD_Status]  AS (case when [DimStore_SCD_End_Date]='12/31/9999' then 'Active' else 'Inactive' end),
	[DimStore_SCD_Start_Date] [datetime] NULL,
	[DimStore_SCD_End_Date] [datetime] NULL,
	[Webnumber] [int] NULL,
	[Storenumber] [int] NULL,
	[City] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Region] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FBC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DimStore] PRIMARY KEY CLUSTERED 
(
	[PK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_DimStore]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_DimStore] ON [Analysis].[DimStore]
(
	[DimStore_SCD_Original_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_DimStore_1]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_DimStore_1] ON [Analysis].[DimStore]
(
	[Webnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_DimStore_2]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_DimStore_2] ON [Analysis].[DimStore]
(
	[Storenumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
