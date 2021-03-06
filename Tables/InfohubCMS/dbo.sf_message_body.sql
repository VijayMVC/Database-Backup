/****** Object:  Table [dbo].[sf_message_body]    Script Date: 5/15/2018 12:01:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_message_body](
	[was_template_copied] [tinyint] NULL,
	[plain_text_version] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nme] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[message_body_type] [int] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[is_template] [tinyint] NOT NULL,
	[internal_page_template_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[copied_template_id] [uniqueidentifier] NULL,
	[body_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_message_body] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
