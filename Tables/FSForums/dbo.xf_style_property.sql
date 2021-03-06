/****** Object:  Table [dbo].[xf_style_property]    Script Date: 5/15/2018 12:00:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_style_property](
	[property_id] [bigint] IDENTITY(2018,1) NOT NULL,
	[property_definition_id] [bigint] NOT NULL,
	[style_id] [int] NOT NULL,
	[property_value] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_xf_style_property_property_id] PRIMARY KEY CLUSTERED 
(
	[property_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_style_property$definition_id_style_id] UNIQUE NONCLUSTERED 
(
	[property_definition_id] ASC,
	[style_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
