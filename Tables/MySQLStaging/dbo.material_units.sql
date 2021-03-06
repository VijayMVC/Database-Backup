/****** Object:  Table [dbo].[material_units]    Script Date: 5/15/2018 12:04:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[material_units](
	[material_unit_id] [int] IDENTITY(8,1) NOT NULL,
	[name] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[display_order] [smallint] NOT NULL,
 CONSTRAINT [PK_material_units_material_unit_id] PRIMARY KEY CLUSTERED 
(
	[material_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[material_units] ADD  DEFAULT ((1)) FOR [display_order]
GO
