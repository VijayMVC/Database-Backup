/****** Object:  Table [dbo].[RC_GenMan]    Script Date: 5/15/2018 12:07:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RC_GenMan](
	[ReportID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Q1] [int] NULL,
	[Q2] [int] NULL,
	[Q3] [int] NULL,
	[Q4] [int] NULL,
	[Q5] [int] NULL,
	[Q6] [int] NULL,
	[Q7] [int] NULL,
	[Q8] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q9] [int] NULL,
	[Q10] [int] NULL,
	[Q11] [int] NULL,
	[Q12] [int] NULL,
	[Q13] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14] [int] NULL,
	[Q15] [int] NULL,
	[Q16] [int] NULL,
	[Q17] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q18] [int] NULL,
	[Q19] [int] NULL,
	[Q20] [int] NULL,
	[Q21] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q22] [int] NULL,
	[Q23] [int] NULL,
	[Q24] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25] [int] NULL,
	[Q26] [int] NULL,
	[Q27] [int] NULL,
	[Q28] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Misc] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_RC_GenMan] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
