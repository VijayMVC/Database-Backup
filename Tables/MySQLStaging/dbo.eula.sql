/****** Object:  Table [dbo].[eula]    Script Date: 5/15/2018 12:04:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[eula](
	[eula_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[eula_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[current_flag] [smallint] NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
 CONSTRAINT [PK_eula_eula_id] PRIMARY KEY CLUSTERED 
(
	[eula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[eula] ADD  DEFAULT (NULL) FOR [current_flag]
ALTER TABLE [dbo].[eula] ADD  DEFAULT (NULL) FOR [created_by]
ALTER TABLE [dbo].[eula] ADD  DEFAULT (NULL) FOR [created_on]
GO
