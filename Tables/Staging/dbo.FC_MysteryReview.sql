/****** Object:  Table [dbo].[FC_MysteryReview]    Script Date: 5/15/2018 12:06:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_MysteryReview](
	[referenceId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdInspectionDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdReportSentToFranchiseeDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtTotalScore] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTaGeneralComments] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ3] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ4] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ6] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ7] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValuePerformanceQ8] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPerformanceQuestionScore] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTaCommentsForPerformance] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ3] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ4] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ6] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ7] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ8] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ9] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ10] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ11] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueServiceQ12] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtServiceQuestionScore] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTaCommentsForService] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueAppearanceQ1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueAppearanceQ2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueAppearanceQ3] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueAppearanceQ4] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtPointValueAppearanceQ5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFtAppearanceQuestionScore] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTaCommentsForAppearance] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
