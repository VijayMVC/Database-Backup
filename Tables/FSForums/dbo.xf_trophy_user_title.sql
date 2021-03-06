/****** Object:  Table [dbo].[xf_trophy_user_title]    Script Date: 5/15/2018 12:00:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_trophy_user_title](
	[minimum_points] [bigint] NOT NULL,
	[title] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_trophy_user_title_minimum_points] PRIMARY KEY CLUSTERED 
(
	[minimum_points] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
