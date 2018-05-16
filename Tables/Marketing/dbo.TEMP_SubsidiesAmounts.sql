/****** Object:  Table [dbo].[TEMP_SubsidiesAmounts]    Script Date: 5/15/2018 12:02:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TEMP_SubsidiesAmounts](
	[CoopID] [int] NULL,
	[CoopName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Earned] [money] NULL,
	[Eligible] [money] NULL
) ON [PRIMARY]

GO
