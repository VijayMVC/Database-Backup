/****** Object:  Table [dbo].[MaterialGroupsDtl]    Script Date: 5/15/2018 12:02:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MaterialGroupsDtl](
	[MatGHId] [int] NOT NULL,
	[MatGPrdId] [int] NOT NULL,
	[MatGDMailDate] [smalldatetime] NOT NULL,
	[MatGDSignUpDate] [smalldatetime] NULL,
	[MatGDImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatGDDisplayType] [tinyint] NULL,
	[MatGDMalPId] [int] NULL,
	[MatGDSignUpDeadline] [smallint] NULL,
	[MatGDUploadDBDeadline] [smallint] NULL,
	[MatGDCreditCardValidation] [smallint] NULL,
	[MatGDPlanSignUpDeadline] [smallint] NULL,
 CONSTRAINT [PK_ScheduledMailingsDtl] PRIMARY KEY CLUSTERED 
(
	[MatGHId] ASC,
	[MatGPrdId] ASC,
	[MatGDMailDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
