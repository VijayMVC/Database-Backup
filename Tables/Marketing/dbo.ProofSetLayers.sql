/****** Object:  Table [dbo].[ProofSetLayers]    Script Date: 5/15/2018 12:02:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProofSetLayers](
	[PrfSId] [int] NOT NULL,
	[PrfLId] [int] NOT NULL,
	[PrfLType] [tinyint] NOT NULL,
	[PrfLLock] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrfLCoordX1] [int] NULL,
	[PrfLCoordY1] [int] NULL,
	[PrfLCoordX2] [int] NULL,
	[PrfLCoordY2] [int] NULL,
	[PrfLRotation] [int] NULL,
 CONSTRAINT [PK_ProofSetLayers] PRIMARY KEY CLUSTERED 
(
	[PrfLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ProofSetLayers]    Script Date: 5/15/2018 12:02:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProofSetLayers] ON [dbo].[ProofSetLayers]
(
	[PrfSId] ASC,
	[PrfLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
