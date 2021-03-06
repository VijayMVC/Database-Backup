/****** Object:  Table [dbo].[modifiers_materials]    Script Date: 5/15/2018 12:04:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[modifiers_materials](
	[modifier_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[material_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[replaces] [smallint] NOT NULL,
 CONSTRAINT [PK_modifiers_materials_modifier_id] PRIMARY KEY CLUSTERED 
(
	[modifier_id] ASC,
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[modifiers_materials] ADD  DEFAULT ((0)) FOR [replaces]
GO
