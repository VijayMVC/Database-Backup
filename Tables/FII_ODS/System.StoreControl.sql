/****** Object:  Table [System].[StoreControl]    Script Date: 5/15/2018 11:59:48 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [System].[StoreControl](
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DataSource] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AsOfDate] [date] NULL,
	[CoreDate] [date] NULL,
	[RPMClose] [date] NULL,
 CONSTRAINT [PK_StoreControl] PRIMARY KEY CLUSTERED 
(
	[ZW_Franchise_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
