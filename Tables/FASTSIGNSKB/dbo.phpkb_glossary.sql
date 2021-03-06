/****** Object:  Table [dbo].[phpkb_glossary]    Script Date: 5/15/2018 11:59:17 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_glossary](
	[glossary_id] [int] IDENTITY(1,1) NOT NULL,
	[glossary_term] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[glossary_content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[glossary_show] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [glossary_id] PRIMARY KEY CLUSTERED 
(
	[glossary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[glossary_term] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_glossary] ADD  DEFAULT ('no') FOR [glossary_show]
ALTER TABLE [dbo].[phpkb_glossary]  WITH CHECK ADD CHECK  (([glossary_show]='no' OR [glossary_show]='yes'))
GO
