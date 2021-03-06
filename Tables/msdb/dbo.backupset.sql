/****** Object:  Table [dbo].[backupset]    Script Date: 5/15/2018 12:02:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[backupset](
	[backup_set_id] [int] IDENTITY(1,1) NOT NULL,
	[backup_set_uuid] [uniqueidentifier] NOT NULL,
	[media_set_id] [int] NOT NULL,
	[first_family_number] [tinyint] NULL,
	[first_media_number] [smallint] NULL,
	[last_family_number] [tinyint] NULL,
	[last_media_number] [smallint] NULL,
	[catalog_family_number] [tinyint] NULL,
	[catalog_media_number] [smallint] NULL,
	[position] [int] NULL,
	[expiration_date] [datetime] NULL,
	[software_vendor_id] [int] NULL,
	[name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[software_major_version] [tinyint] NULL,
	[software_minor_version] [tinyint] NULL,
	[software_build_version] [smallint] NULL,
	[time_zone] [smallint] NULL,
	[mtf_minor_version] [tinyint] NULL,
	[first_lsn] [numeric](25, 0) NULL,
	[last_lsn] [numeric](25, 0) NULL,
	[checkpoint_lsn] [numeric](25, 0) NULL,
	[database_backup_lsn] [numeric](25, 0) NULL,
	[database_creation_date] [datetime] NULL,
	[backup_start_date] [datetime] NULL,
	[backup_finish_date] [datetime] NULL,
	[type] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort_order] [smallint] NULL,
	[code_page] [smallint] NULL,
	[compatibility_level] [tinyint] NULL,
	[database_version] [int] NULL,
	[backup_size] [numeric](20, 0) NULL,
	[database_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[server_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[machine_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[flags] [int] NULL,
	[unicode_locale] [int] NULL,
	[unicode_compare_style] [int] NULL,
	[collation_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_password_protected] [bit] NULL,
	[recovery_model] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_bulk_logged_data] [bit] NULL,
	[is_snapshot] [bit] NULL,
	[is_readonly] [bit] NULL,
	[is_single_user] [bit] NULL,
	[has_backup_checksums] [bit] NULL,
	[is_damaged] [bit] NULL,
	[begins_log_chain] [bit] NULL,
	[has_incomplete_metadata] [bit] NULL,
	[is_force_offline] [bit] NULL,
	[is_copy_only] [bit] NULL,
	[first_recovery_fork_guid] [uniqueidentifier] NULL,
	[last_recovery_fork_guid] [uniqueidentifier] NULL,
	[fork_point_lsn] [numeric](25, 0) NULL,
	[database_guid] [uniqueidentifier] NULL,
	[family_guid] [uniqueidentifier] NULL,
	[differential_base_lsn] [numeric](25, 0) NULL,
	[differential_base_guid] [uniqueidentifier] NULL,
	[compressed_backup_size] [numeric](20, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[backup_set_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [backupsetDate]    Script Date: 5/15/2018 12:02:54 PM ******/
CREATE NONCLUSTERED INDEX [backupsetDate] ON [dbo].[backupset]
(
	[backup_finish_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [backupsetuuid]    Script Date: 5/15/2018 12:02:54 PM ******/
CREATE NONCLUSTERED INDEX [backupsetuuid] ON [dbo].[backupset]
(
	[backup_set_uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[backupset]  WITH CHECK ADD FOREIGN KEY([media_set_id])
REFERENCES [dbo].[backupmediaset] ([media_set_id])
/****** Object:  Trigger [dbo].[trig_backupset_delete]    Script Date: 5/15/2018 12:02:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER trig_backupset_delete ON msdb.dbo.backupset FOR DELETE AS
BEGIN
  DELETE FROM msdb.dbo.logmarkhistory from deleted
  WHERE (msdb.dbo.logmarkhistory.database_name = deleted.database_name)
    AND (msdb.dbo.logmarkhistory.lsn >= deleted.first_lsn)
    AND (msdb.dbo.logmarkhistory.lsn < deleted.last_lsn)
END

GO
