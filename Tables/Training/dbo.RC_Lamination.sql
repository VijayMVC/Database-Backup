/****** Object:  Table [dbo].[RC_Lamination]    Script Date: 5/15/2018 12:07:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RC_Lamination](
	[ReportID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Q1] [int] NULL,
	[Q2] [int] NULL,
	[Q3] [int] NULL,
	[Q4] [int] NULL,
	[Q5] [int] NULL,
	[Q6] [int] NULL,
	[Q7] [int] NULL,
	[Q8] [int] NULL,
	[Q9] [int] NULL,
	[Q10] [int] NULL,
	[Q11] [int] NULL,
	[Q12] [int] NULL,
	[Q13] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Misc] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
