/****** Object:  Table [dbo].[OrderDtlProofSetLayers]    Script Date: 5/15/2018 12:02:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderDtlProofSetLayers](
	[PrfSId] [int] NOT NULL,
	[PrfLId] [int] NOT NULL,
	[OrdPSId] [int] NOT NULL,
	[OrdPSLId] [int] NOT NULL,
	[OrdPSLType] [tinyint] NOT NULL,
	[OrdPSLOffId] [int] NULL,
	[OrdPSLLock] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdPSLCoordX1] [int] NULL,
	[OrdPSLCoordY1] [int] NULL,
	[OrdPSLCoordX2] [int] NULL,
	[OrdPSLCoordY2] [int] NULL,
	[OrdPSLRotation] [int] NULL,
	[OrdPSLImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdPSLText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_OrderDtlProofSetLayers] PRIMARY KEY CLUSTERED 
(
	[OrdPSId] ASC,
	[OrdPSLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
