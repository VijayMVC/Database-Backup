/****** Object:  Table [dbo].[service_categories]    Script Date: 5/15/2018 12:04:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[service_categories](
	[service_category_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[display_flag] [smallint] NULL,
 CONSTRAINT [PK_service_categories_service_category_id] PRIMARY KEY CLUSTERED 
(
	[service_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[service_categories] ADD  DEFAULT (NULL) FOR [display_flag]
GO
