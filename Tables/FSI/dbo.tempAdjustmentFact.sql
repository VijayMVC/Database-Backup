/****** Object:  Table [dbo].[tempAdjustmentFact]    Script Date: 5/15/2018 12:00:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tempAdjustmentFact](
	[ID] [int] NOT NULL,
	[FranID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastUpdate] [datetime] NULL
) ON [PRIMARY]

GO
