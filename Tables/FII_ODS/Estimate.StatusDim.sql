/****** Object:  Table [Estimate].[StatusDim]    Script Date: 5/15/2018 11:59:32 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Estimate].[StatusDim](
	[StatusKey] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_StatusKey] PRIMARY KEY CLUSTERED 
(
	[StatusKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Estimate].[StatusDim] ADD  CONSTRAINT [DF_Status_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
