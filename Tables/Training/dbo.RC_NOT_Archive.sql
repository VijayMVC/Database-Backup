/****** Object:  Table [dbo].[RC_NOT_Archive]    Script Date: 5/15/2018 12:07:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RC_NOT_Archive](
	[ReportID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Q1] [int] NULL,
	[Q2] [int] NULL,
	[Q3] [int] NULL,
	[Q4] [int] NULL,
	[Q5] [int] NULL,
	[Q6] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q7] [int] NULL,
	[Q8] [int] NULL,
	[Q9] [int] NULL,
	[Q10] [int] NULL,
	[Q11] [int] NULL,
	[Q12] [int] NULL,
	[Q13] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14] [int] NULL,
	[Q15] [int] NULL,
	[Q16] [int] NULL,
	[Q17] [int] NULL,
	[Q18] [int] NULL,
	[Q19] [int] NULL,
	[Q20] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q21] [int] NULL,
	[Q22] [int] NULL,
	[Q23] [int] NULL,
	[Q24] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25] [int] NULL,
	[Q26] [int] NULL,
	[Q27] [int] NULL,
	[Q28] [int] NULL,
	[Q29] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q30] [int] NULL,
	[Q31] [int] NULL,
	[Q32] [int] NULL,
	[Q33] [int] NULL,
	[Q34] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q35] [int] NULL,
	[Q36] [int] NULL,
	[Q37] [int] NULL,
	[Q38] [int] NULL,
	[Q39] [int] NULL,
	[Q40] [int] NULL,
	[Q41] [int] NULL,
	[Q42] [int] NULL,
	[Q43] [int] NULL,
	[Q44] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q45] [int] NULL,
	[Q46] [int] NULL,
	[Q47] [int] NULL,
	[Q48] [int] NULL,
	[Q49] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q50] [int] NULL,
	[Q51] [int] NULL,
	[Q52] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q53] [int] NULL,
	[Q54] [int] NULL,
	[Q55] [int] NULL,
	[Q56] [int] NULL,
	[Q57] [int] NULL,
	[Q58] [int] NULL,
	[Q59] [int] NULL,
	[Q60] [int] NULL,
	[Q61] [int] NULL,
	[Q62] [int] NULL,
	[Q63] [int] NULL,
	[Q64] [int] NULL,
	[Q65] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q66] [int] NULL,
	[Q67] [int] NULL,
	[Q68] [int] NULL,
	[Q69] [int] NULL,
	[Q70] [int] NULL,
	[Q71] [int] NULL,
	[Q72] [int] NULL,
	[Q73] [int] NULL,
	[Q74] [int] NULL,
	[Q75] [int] NULL,
	[Q76] [int] NULL,
	[Q77] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q78] [int] NULL,
	[Q79] [int] NULL,
	[Q80] [int] NULL,
	[Q81] [int] NULL,
	[Q82] [int] NULL,
	[Q83] [int] NULL,
	[Q84] [int] NULL,
	[Q85] [int] NULL,
	[Q86] [int] NULL,
	[Q87] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q88] [int] NULL,
	[Q89] [int] NULL,
	[Q90] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q91] [int] NULL,
	[Q92] [int] NULL,
	[Q93] [int] NULL,
	[Q94] [int] NULL,
	[Q95] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q96] [int] NULL,
	[Q97] [int] NULL,
	[Q98] [int] NULL,
	[Q99] [int] NULL,
	[Q100] [int] NULL,
	[Q101] [int] NULL,
	[Q102] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q103] [int] NULL,
	[Q104] [int] NULL,
	[Q105] [int] NULL,
	[Q106] [int] NULL,
	[Q107] [int] NULL,
	[Q108] [int] NULL,
	[Q109] [int] NULL,
	[Q110] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q111] [int] NULL,
	[Q112] [int] NULL,
	[Q113] [int] NULL,
	[Q114] [int] NULL,
	[Q115] [int] NULL,
	[Q116] [int] NULL,
	[Q117] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q118] [int] NULL,
	[Q119] [int] NULL,
	[Q120] [int] NULL,
	[Q121] [int] NULL,
	[Q122] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q123] [int] NULL,
	[Q124] [int] NULL,
	[Q125] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q126] [int] NULL,
	[Q127] [int] NULL,
	[Q128] [int] NULL,
	[Q129] [int] NULL,
	[Q130] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q131] [int] NULL,
	[Q132] [int] NULL,
	[Q133] [int] NULL,
	[Q134] [int] NULL,
	[Q135] [int] NULL,
	[Q136] [int] NULL,
	[Misc] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_RC_NOT] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
