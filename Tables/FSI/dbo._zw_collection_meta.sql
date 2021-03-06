/****** Object:  Table [dbo].[_zw_collection_meta]    Script Date: 5/15/2018 12:00:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[_zw_collection_meta](
	[pk_id] [int] IDENTITY(1,1) NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[table_name] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_collection] [datetime] NOT NULL,
 CONSTRAINT [PK__zw_collection_meta] PRIMARY KEY CLUSTERED 
(
	[zw_franchise_id] ASC,
	[table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX__zw_collection_meta_1]    Script Date: 5/15/2018 12:00:45 PM ******/
CREATE NONCLUSTERED INDEX [IX__zw_collection_meta_1] ON [dbo].[_zw_collection_meta]
(
	[last_collection] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Trigger [dbo].[trg_zw_collection_meta]    Script Date: 5/15/2018 12:00:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER [trg_zw_collection_meta] 
    ON [dbo].[_zw_collection_meta] 
    after update 
AS 
BEGIN
    IF update(last_collection)
	begin
            INSERT AuditCollection 
            (zw_franchise_id,last_collection,trg_action,trg_date)
           (select zw_franchise_id,last_collection, 'Update',getdate() from inserted as i
            where table_name = 'TransHeader' and not exists(select last_collection from AuditCollection as c
                         where CONVERT(VARCHAR(10), i.last_collection, 101)=CONVERT(VARCHAR(10), c.last_collection, 101)))
	end
END

GO
