/****** Object:  Table [Product].[PrintAsDim]    Script Date: 5/15/2018 11:59:41 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Product].[PrintAsDim](
	[PrintAsKey] [int] IDENTITY(1,1) NOT NULL,
	[PrintAsName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_PrintAsKey] PRIMARY KEY CLUSTERED 
(
	[PrintAsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Product].[PrintAsDim] ADD  CONSTRAINT [DF_PrintAs_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
