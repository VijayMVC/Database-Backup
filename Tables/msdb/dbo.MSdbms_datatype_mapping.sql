/****** Object:  Table [dbo].[MSdbms_datatype_mapping]    Script Date: 5/15/2018 12:02:59 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSdbms_datatype_mapping](
	[datatype_mapping_id] [int] IDENTITY(1,1) NOT NULL,
	[map_id] [int] NOT NULL,
	[dest_datatype_id] [int] NOT NULL,
	[dest_precision] [bigint] NULL,
	[dest_scale] [int] NULL,
	[dest_length] [bigint] NULL,
	[dest_nullable] [bit] NULL,
	[dest_createparams] [int] NOT NULL,
	[dataloss] [bit] NOT NULL,
 CONSTRAINT [pk_MSdbms_datatype_mapping] PRIMARY KEY CLUSTERED 
(
	[datatype_mapping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[MSdbms_datatype_mapping] ADD  DEFAULT (NULL) FOR [dest_precision]
ALTER TABLE [dbo].[MSdbms_datatype_mapping] ADD  DEFAULT (NULL) FOR [dest_scale]
ALTER TABLE [dbo].[MSdbms_datatype_mapping] ADD  DEFAULT (NULL) FOR [dest_length]
ALTER TABLE [dbo].[MSdbms_datatype_mapping] ADD  DEFAULT (NULL) FOR [dest_nullable]
ALTER TABLE [dbo].[MSdbms_datatype_mapping] ADD  DEFAULT ((0)) FOR [dest_createparams]
ALTER TABLE [dbo].[MSdbms_datatype_mapping] ADD  DEFAULT ((0)) FOR [dataloss]
ALTER TABLE [dbo].[MSdbms_datatype_mapping]  WITH CHECK ADD  CONSTRAINT [fk_MSdbms_datatype_mapping_dest_datatype_id] FOREIGN KEY([dest_datatype_id])
REFERENCES [dbo].[MSdbms_datatype] ([datatype_id])
ALTER TABLE [dbo].[MSdbms_datatype_mapping] CHECK CONSTRAINT [fk_MSdbms_datatype_mapping_dest_datatype_id]
ALTER TABLE [dbo].[MSdbms_datatype_mapping]  WITH CHECK ADD  CONSTRAINT [fk_MSdbms_datatype_mapping_map_id] FOREIGN KEY([map_id])
REFERENCES [dbo].[MSdbms_map] ([map_id])
ALTER TABLE [dbo].[MSdbms_datatype_mapping] CHECK CONSTRAINT [fk_MSdbms_datatype_mapping_map_id]
GO
