/****** Object:  Table [dbo].[sf_publishing_mapping]    Script Date: 5/15/2018 12:02:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_publishing_mapping](
	[typ] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_required] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[destination_property_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[defaultvalue] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_publishing_mapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
