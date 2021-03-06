/****** Object:  Table [Store].[StateDim]    Script Date: 5/15/2018 11:59:45 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Store].[StateDim](
	[StateKey] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
	[MarketingRegion] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_StateKey] PRIMARY KEY CLUSTERED 
(
	[StateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Store].[StateDim] ADD  CONSTRAINT [DF_State_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
