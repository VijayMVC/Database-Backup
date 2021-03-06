/****** Object:  Table [dbo].[oakeygen]    Script Date: 5/15/2018 12:01:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[oakeygen](
	[table_name] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_used_id] [int] NOT NULL,
 CONSTRAINT [pk_oakeygen] PRIMARY KEY CLUSTERED 
(
	[table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
