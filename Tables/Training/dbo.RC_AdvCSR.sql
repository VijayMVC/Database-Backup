/****** Object:  Table [dbo].[RC_AdvCSR]    Script Date: 5/15/2018 12:07:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RC_AdvCSR](
	[ReportID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Q1] [int] NULL,
	[Q2] [int] NULL,
	[Q3] [int] NULL,
	[Q4] [int] NULL,
	[Q5] [int] NULL,
	[Q6] [int] NULL,
	[Q7] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q8] [int] NULL,
	[Q9] [int] NULL,
	[Q10] [int] NULL,
	[Q11] [int] NULL,
	[Q12] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q13] [int] NULL,
	[Q14] [int] NULL,
	[Q15] [int] NULL,
	[Q16] [int] NULL,
	[Q17] [int] NULL,
	[Q18] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q19] [int] NULL,
	[Q20] [int] NULL,
	[Q21] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q22] [int] NULL,
	[Q23] [int] NULL,
	[Q24] [int] NULL,
	[Q25] [int] NULL,
	[Q26] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q27] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q29] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q30] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q31] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q32] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q33] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q34] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q35] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q36] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q37] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q38] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q39] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q40] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q41] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q42] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q43] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q44] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q45] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q46] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q47] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q48] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q49] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q50] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q51] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q52] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q53] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q54] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q55] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q56] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q57] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q58] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q59] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q60] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q61] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q62] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q63] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q64] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q65] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q66] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q67] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q68] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q69] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q70] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q71] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q72] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q73] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q74] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Misc] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q101] [int] NULL,
	[Q102] [int] NULL,
	[Q103] [int] NULL,
	[Q104] [int] NULL,
	[Q105] [int] NULL,
	[Q106] [int] NULL,
	[Q107] [int] NULL,
	[Q108] [int] NULL,
	[Q109] [int] NULL,
	[Q110] [int] NULL,
	[Q111] [int] NULL,
	[Q112] [int] NULL,
 CONSTRAINT [PK_RC_AdvCSR] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
