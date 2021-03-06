/****** Object:  Table [dbo].[phpkb_referrers]    Script Date: 5/15/2018 11:59:18 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_referrers](
	[referrer_id] [int] IDENTITY(1,1) NOT NULL,
	[referrer] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[referrer_url] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[referrer_date_time] [smalldatetime] NOT NULL,
	[article_id] [int] NOT NULL,
 CONSTRAINT [referrer_id] PRIMARY KEY CLUSTERED 
(
	[referrer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_referrers] ADD  DEFAULT ('other') FOR [referrer]
ALTER TABLE [dbo].[phpkb_referrers]  WITH CHECK ADD  CONSTRAINT [fk___article_referrers] FOREIGN KEY([article_id])
REFERENCES [dbo].[phpkb_articles] ([article_id])
ALTER TABLE [dbo].[phpkb_referrers] CHECK CONSTRAINT [fk___article_referrers]
GO
