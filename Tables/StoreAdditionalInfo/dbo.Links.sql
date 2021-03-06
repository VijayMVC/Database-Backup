/****** Object:  Table [dbo].[Links]    Script Date: 5/15/2018 12:06:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Links](
	[Owner] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date] [datetime] NULL,
	[Document] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[File] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Links_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Links_Id] PRIMARY KEY CLUSTERED 
(
	[Links_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
