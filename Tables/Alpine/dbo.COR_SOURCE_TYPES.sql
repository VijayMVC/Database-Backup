/****** Object:  Table [dbo].[COR_SOURCE_TYPES]    Script Date: 5/15/2018 11:58:37 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_SOURCE_TYPES](
	[SourceType] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FullName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_COR_SOURCE_TYPES] PRIMARY KEY CLUSTERED 
(
	[SourceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

GO
