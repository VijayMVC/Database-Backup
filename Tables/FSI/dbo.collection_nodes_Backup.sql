/****** Object:  Table [dbo].[collection_nodes_Backup]    Script Date: 5/15/2018 12:00:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[collection_nodes_Backup](
	[concept_id] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[node_id] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[lastcollected_clienttime] [datetime] NULL,
	[lastcollected_servertime] [datetime] NULL
) ON [PRIMARY]

GO
