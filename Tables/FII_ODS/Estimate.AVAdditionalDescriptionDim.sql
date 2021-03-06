/****** Object:  Table [Estimate].[AVAdditionalDescriptionDim]    Script Date: 5/15/2018 11:59:29 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Estimate].[AVAdditionalDescriptionDim](
	[AVAdditionalDescriptionKey] [int] IDENTITY(1,1) NOT NULL,
	[AVAdditionalDescriptionName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_AVAdditionalDescriptionKey] PRIMARY KEY CLUSTERED 
(
	[AVAdditionalDescriptionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Estimate].[AVAdditionalDescriptionDim] ADD  CONSTRAINT [DF_AVAdditionalDescription_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
