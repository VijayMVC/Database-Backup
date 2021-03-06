/****** Object:  Table [dbo].[collection_nodes]    Script Date: 5/15/2018 12:00:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[collection_nodes](
	[concept_id] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[node_id] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[lastcollected_clienttime] [datetime] NULL,
	[lastcollected_servertime] [datetime] NULL,
 CONSTRAINT [PK_collection_nodes] PRIMARY KEY CLUSTERED 
(
	[concept_id] ASC,
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Trigger [dbo].[trg_collection_nodes]    Script Date: 5/15/2018 12:00:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER [dbo].[trg_collection_nodes] 
    ON [dbo].[collection_nodes] 
    after update 
AS 
    IF update(lastcollected_clienttime)

   begin

            INSERT audit_collection_nodes 
            (concept_id,node_id,lastcollected_clienttime,lastcollected_servertime,trg_action,trg_date) 
           (select concept_id,node_id,lastcollected_clienttime,lastcollected_servertime, 'Update',getdate() from inserted as i
            where not exists(select lastcollected_servertime from audit_collection_nodes as c
                         where i.lastcollected_clienttime=c.lastcollected_clienttime))


end

/****** Object:  Trigger [dbo].[trg_collection_nodes_inserts]    Script Date: 5/15/2018 12:00:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create trigger trg_collection_nodes_inserts
on dbo.collection_nodes
for insert
as
begin
insert audit_collection_nodes
(concept_id,node_id,lastcollected_clienttime,lastcollected_servertime,trg_action,trg_date)
select concept_id,node_id,lastcollected_clienttime,lastcollected_servertime, 'Insert',getdate() from inserted
end
GO
