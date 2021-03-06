/****** Object:  Table [dbo].[sysssispackagefolders]    Script Date: 5/15/2018 12:03:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysssispackagefolders](
	[folderid] [uniqueidentifier] NOT NULL,
	[parentfolderid] [uniqueidentifier] NULL,
	[foldername] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_sysssispackagefolders] PRIMARY KEY NONCLUSTERED 
(
	[folderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_sysssispackagefoldersuniquepath] UNIQUE NONCLUSTERED 
(
	[parentfolderid] ASC,
	[foldername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
