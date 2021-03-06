/****** Object:  Table [Store].[RegionDim]    Script Date: 5/15/2018 11:59:45 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Store].[RegionDim](
	[RegionKey] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsValid] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_RegionDim] PRIMARY KEY CLUSTERED 
(
	[RegionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Store].[RegionDim] ADD  CONSTRAINT [DF_StoreRegionDim_IsValid]  DEFAULT ((1)) FOR [IsValid]
ALTER TABLE [Store].[RegionDim] ADD  CONSTRAINT [DF_RegionDim_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
