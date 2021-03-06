/****** Object:  Table [dbo].[xf_phrase_compiled]    Script Date: 5/15/2018 12:00:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_phrase_compiled](
	[language_id] [bigint] NOT NULL,
	[title] [varbinary](100) NOT NULL,
	[phrase_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_phrase_compiled_language_id] PRIMARY KEY CLUSTERED 
(
	[language_id] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
