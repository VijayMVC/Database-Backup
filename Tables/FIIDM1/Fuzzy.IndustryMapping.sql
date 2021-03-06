/****** Object:  Table [Fuzzy].[IndustryMapping]    Script Date: 5/15/2018 11:59:56 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Fuzzy].[IndustryMapping](
	[SourceIndustryType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PreliminaryIndustryMatch] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[1stPass_IndustryMappingMatch] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[1stPass_IndustryKey] [int] NULL,
	[1stPass_IndustryName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[1stPass_Similarity] [real] NULL,
	[1stPass_Confidence] [real] NULL,
	[2ndPass_IndustryKey] [int] NULL,
	[2ndPass_IndustryName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[2ndPass_Similarity] [real] NULL,
	[2ndPass_Confidence] [real] NULL,
	[3rdPass_IndustryKey] [int] NULL,
	[3rdPass_IndustryName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[3rdPass_SimilarityMap] [real] NULL,
	[3rdPass_Similarity] [real] NULL,
	[3rdPass_Confidence] [real] NULL,
	[Final_IndustryKey] [int] NULL,
	[Final_IndustryName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Final_Similarity] [real] NULL,
	[Final_Confidence] [real] NULL,
	[Final_Similarity_Rounded]  AS (round([Final_Similarity],(1))),
	[Final_Confidence_Rounded]  AS (round([final_confidence],(1))),
	[FS_Display1]  AS (CONVERT([char](3),right('00'+CONVERT([varchar],CONVERT([int],round([Final_Similarity],(1))*(100),(0)),(0)),(3)),(0))),
	[FS_Display2]  AS (CONVERT([char](3),right('00'+CONVERT([varchar],CONVERT([int],[Final_Similarity]*(100),(0)),(0)),(3)),(0))),
	[FC_Display1]  AS (CONVERT([char](3),right('00'+CONVERT([varchar],CONVERT([int],round([Final_Confidence],(1))*(100),(0)),(0)),(3)),(0))),
	[FC_Display2]  AS (CONVERT([char](3),right('00'+CONVERT([varchar],CONVERT([int],[Final_Confidence]*(100),(0)),(0)),(3)),(0))),
 CONSTRAINT [PK_IndustryMapping] PRIMARY KEY NONCLUSTERED 
(
	[SourceIndustryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_IndustryMapping]    Script Date: 5/15/2018 11:59:56 AM ******/
CREATE CLUSTERED INDEX [IX_IndustryMapping] ON [Fuzzy].[IndustryMapping]
(
	[SourceIndustryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
