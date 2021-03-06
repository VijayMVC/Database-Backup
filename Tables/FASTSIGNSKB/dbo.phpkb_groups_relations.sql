/****** Object:  Table [dbo].[phpkb_groups_relations]    Script Date: 5/15/2018 11:59:17 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_groups_relations](
	[group_member_relation_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[member_id] [int] NOT NULL,
 CONSTRAINT [group_member_relation_id] PRIMARY KEY CLUSTERED 
(
	[group_member_relation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_groups_relations]  WITH CHECK ADD  CONSTRAINT [fk___group_relation] FOREIGN KEY([group_id])
REFERENCES [dbo].[phpkb_groups] ([group_id])
ALTER TABLE [dbo].[phpkb_groups_relations] CHECK CONSTRAINT [fk___group_relation]
GO
