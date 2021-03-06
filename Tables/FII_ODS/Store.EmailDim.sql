/****** Object:  Table [Store].[EmailDim]    Script Date: 5/15/2018 11:59:43 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Store].[EmailDim](
	[StoreNumber] [int] NOT NULL,
	[OwnerEmail] [varchar](254) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_EmailDim] PRIMARY KEY CLUSTERED 
(
	[StoreNumber] ASC,
	[OwnerEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Store].[EmailDim] ADD  CONSTRAINT [DF_EMail_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
