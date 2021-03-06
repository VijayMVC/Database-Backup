/****** Object:  Table [dbo].[ar_ArtTypes]    Script Date: 5/15/2018 12:02:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ar_ArtTypes](
	[ArtTypeID] [int] NOT NULL,
	[Name] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Folder] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FileNameMask] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsApprovable] [bit] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[ar_ArtTypes] ADD  CONSTRAINT [DF_ar_ArtTypes_IsApprovable]  DEFAULT (1) FOR [IsApprovable]
GO
