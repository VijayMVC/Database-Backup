/****** Object:  Table [dbo].[sysjobs]    Script Date: 5/15/2018 12:03:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysjobs](
	[job_id] [uniqueidentifier] NOT NULL,
	[originating_server_id] [int] NOT NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[description] [nvarchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[start_step_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[owner_sid] [varbinary](85) NOT NULL,
	[notify_level_eventlog] [int] NOT NULL,
	[notify_level_email] [int] NOT NULL,
	[notify_level_netsend] [int] NOT NULL,
	[notify_level_page] [int] NOT NULL,
	[notify_email_operator_id] [int] NOT NULL,
	[notify_netsend_operator_id] [int] NOT NULL,
	[notify_page_operator_id] [int] NOT NULL,
	[delete_level] [int] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[date_modified] [datetime] NOT NULL,
	[version_number] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [clust]    Script Date: 5/15/2018 12:03:04 PM ******/
CREATE UNIQUE CLUSTERED INDEX [clust] ON [dbo].[sysjobs]
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [nc1]    Script Date: 5/15/2018 12:03:04 PM ******/
CREATE NONCLUSTERED INDEX [nc1] ON [dbo].[sysjobs]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [nc3]    Script Date: 5/15/2018 12:03:04 PM ******/
CREATE NONCLUSTERED INDEX [nc3] ON [dbo].[sysjobs]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [nc4]    Script Date: 5/15/2018 12:03:04 PM ******/
CREATE NONCLUSTERED INDEX [nc4] ON [dbo].[sysjobs]
(
	[owner_sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Trigger [dbo].[trig_sysjobs_insert_update]    Script Date: 5/15/2018 12:03:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE TRIGGER [dbo].[trig_sysjobs_insert_update]
ON [dbo].[sysjobs]
FOR INSERT, UPDATE
AS
BEGIN
  SET NOCOUNT ON
  -- Disallow the insert or update if the originating_server_id isn't in sysoriginatingservers_view.  
  IF (EXISTS (SELECT *
            FROM inserted
           WHERE inserted.originating_server_id NOT IN 
                    (SELECT v.originating_server_id 
                     FROM sysoriginatingservers_view AS v)))
  BEGIN
   RAISERROR(14379, -1, -1, 'dbo.sysjobs')
   ROLLBACK TRANSACTION
    RETURN
  END
END

GO
