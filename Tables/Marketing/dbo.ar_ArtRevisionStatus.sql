/****** Object:  Table [dbo].[ar_ArtRevisionStatus]    Script Date: 5/15/2018 12:02:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ar_ArtRevisionStatus](
	[ArtRevisionStatusID] [int] NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Enum] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
