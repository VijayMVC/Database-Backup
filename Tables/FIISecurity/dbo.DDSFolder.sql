/****** Object:  Table [dbo].[DDSFolder]    Script Date: 5/15/2018 12:00:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DDSFolder](
	[DDSFolderID] [int] IDENTITY(1,1) NOT NULL,
	[WebNumber] [int] NULL,
	[FolderName] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullPath] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_DDSFolder] PRIMARY KEY CLUSTERED 
(
	[DDSFolderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
