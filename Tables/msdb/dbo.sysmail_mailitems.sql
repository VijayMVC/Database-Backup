/****** Object:  Table [dbo].[sysmail_mailitems]    Script Date: 5/15/2018 12:03:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmail_mailitems](
	[mailitem_id] [int] IDENTITY(1,1) NOT NULL,
	[profile_id] [int] NOT NULL,
	[recipients] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[copy_recipients] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[blind_copy_recipients] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subject] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[from_address] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reply_to] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[body] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[body_format] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[importance] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sensitivity] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[file_attachments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attachment_encoding] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[query] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[execute_query_database] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attach_query_result_as_file] [bit] NULL,
	[query_result_header] [bit] NULL,
	[query_result_width] [int] NULL,
	[query_result_separator] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[exclude_query_output] [bit] NULL,
	[append_query_error] [bit] NULL,
	[send_request_date] [datetime] NOT NULL,
	[send_request_user] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sent_account_id] [int] NULL,
	[sent_status] [tinyint] NULL,
	[sent_date] [datetime] NULL,
	[last_mod_date] [datetime] NOT NULL,
	[last_mod_user] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [sysmail_mailitems_id_MustBeUnique] PRIMARY KEY CLUSTERED 
(
	[mailitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[sysmail_mailitems] ADD  DEFAULT (getdate()) FOR [send_request_date]
ALTER TABLE [dbo].[sysmail_mailitems] ADD  DEFAULT (suser_sname()) FOR [send_request_user]
ALTER TABLE [dbo].[sysmail_mailitems] ADD  DEFAULT ((0)) FOR [sent_status]
ALTER TABLE [dbo].[sysmail_mailitems] ADD  DEFAULT (getdate()) FOR [last_mod_date]
ALTER TABLE [dbo].[sysmail_mailitems] ADD  DEFAULT (suser_sname()) FOR [last_mod_user]
ALTER TABLE [dbo].[sysmail_mailitems]  WITH CHECK ADD  CONSTRAINT [sysmail_OutMailAttachmentEncodingMustBeValid] CHECK  (([attachment_encoding]='UUENCODE' OR [attachment_encoding]='BINHEX' OR [attachment_encoding]='S/MIME' OR [attachment_encoding]='MIME'))
ALTER TABLE [dbo].[sysmail_mailitems] CHECK CONSTRAINT [sysmail_OutMailAttachmentEncodingMustBeValid]
ALTER TABLE [dbo].[sysmail_mailitems]  WITH CHECK ADD  CONSTRAINT [sysmail_OutMailImportanceMustBeValid] CHECK  (([importance]='HIGH' OR [importance]='NORMAL' OR [importance]='LOW'))
ALTER TABLE [dbo].[sysmail_mailitems] CHECK CONSTRAINT [sysmail_OutMailImportanceMustBeValid]
ALTER TABLE [dbo].[sysmail_mailitems]  WITH CHECK ADD  CONSTRAINT [sysmail_OutMailMustHaveAtleastOneRecipient] CHECK  ((NOT ([recipients] IS NULL AND [copy_recipients] IS NULL AND [blind_copy_recipients] IS NULL)))
ALTER TABLE [dbo].[sysmail_mailitems] CHECK CONSTRAINT [sysmail_OutMailMustHaveAtleastOneRecipient]
ALTER TABLE [dbo].[sysmail_mailitems]  WITH CHECK ADD  CONSTRAINT [sysmail_OutMailRecipientCannotBeEmpty] CHECK  ((((datalength(isnull([recipients],''))+datalength(isnull([copy_recipients],'')))+datalength(isnull([blind_copy_recipients],'')))<>(0)))
ALTER TABLE [dbo].[sysmail_mailitems] CHECK CONSTRAINT [sysmail_OutMailRecipientCannotBeEmpty]
ALTER TABLE [dbo].[sysmail_mailitems]  WITH CHECK ADD  CONSTRAINT [sysmail_OutMailSensitivityMustBeValid] CHECK  (([sensitivity]='CONFIDENTIAL' OR [sensitivity]='PRIVATE' OR [sensitivity]='PERSONAL' OR [sensitivity]='NORMAL'))
ALTER TABLE [dbo].[sysmail_mailitems] CHECK CONSTRAINT [sysmail_OutMailSensitivityMustBeValid]
/****** Object:  Trigger [dbo].[trig_sysmail_mailitems]    Script Date: 5/15/2018 12:03:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE TRIGGER trig_sysmail_mailitems
ON msdb.dbo.sysmail_mailitems
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_mailitems'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_mailitems 
      SET last_mod_date = GETDATE(), last_mod_user = SUSER_SNAME() 
      FROM sysmail_mailitems m, inserted i
      WHERE m.mailitem_id = i.mailitem_id
   END
END

GO
