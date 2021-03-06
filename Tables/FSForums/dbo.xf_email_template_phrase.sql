/****** Object:  Table [dbo].[xf_email_template_phrase]    Script Date: 5/15/2018 12:00:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_email_template_phrase](
	[title] [varbinary](50) NOT NULL,
	[phrase_title] [varbinary](100) NOT NULL,
 CONSTRAINT [PK_xf_email_template_phrase_title] PRIMARY KEY CLUSTERED 
(
	[title] ASC,
	[phrase_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [phrase_title]    Script Date: 5/15/2018 12:00:21 PM ******/
CREATE NONCLUSTERED INDEX [phrase_title] ON [dbo].[xf_email_template_phrase]
(
	[phrase_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
