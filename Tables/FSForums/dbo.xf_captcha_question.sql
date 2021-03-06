/****** Object:  Table [dbo].[xf_captcha_question]    Script Date: 5/15/2018 12:00:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_captcha_question](
	[captcha_question_id] [bigint] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[answers] [varbinary](max) NOT NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_captcha_question_captcha_question_id] PRIMARY KEY CLUSTERED 
(
	[captcha_question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [active]    Script Date: 5/15/2018 12:00:18 PM ******/
CREATE NONCLUSTERED INDEX [active] ON [dbo].[xf_captcha_question]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_captcha_question] ADD  DEFAULT ((1)) FOR [active]
GO
