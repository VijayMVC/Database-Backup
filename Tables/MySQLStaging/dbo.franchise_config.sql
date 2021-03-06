/****** Object:  Table [dbo].[franchise_config]    Script Date: 5/15/2018 12:04:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[franchise_config](
	[franchise_config_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[key_id] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[key_value] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_franchise_config_franchise_config_id] PRIMARY KEY CLUSTERED 
(
	[franchise_config_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[franchise_config] ADD  DEFAULT (NULL) FOR [key_value]
GO
