/****** Object:  Table [dbo].[sf_dynamic_type_base]    Script Date: 5/15/2018 12:01:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_dynamic_type_base](
	[original_parent_id] [uniqueidentifier] NULL,
	[original_item_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
	[voa_class] [int] NOT NULL,
 CONSTRAINT [pk_sf_dynamic_type_base] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
