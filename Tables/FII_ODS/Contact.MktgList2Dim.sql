/****** Object:  Table [Contact].[MktgList2Dim]    Script Date: 5/15/2018 11:59:24 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[MktgList2Dim](
	[MktgList2Key] [int] IDENTITY(1,1) NOT NULL,
	[MktgList2Name] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_MktgList2Key] PRIMARY KEY CLUSTERED 
(
	[MktgList2Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [Contact].[MktgList2Dim] ADD  CONSTRAINT [DF_MktgList2_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
