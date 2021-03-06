/****** Object:  Table [dbo].[sysmail_server]    Script Date: 5/15/2018 12:03:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmail_server](
	[account_id] [int] NOT NULL,
	[servertype] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[servername] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[port] [int] NOT NULL,
	[username] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[credential_id] [int] NULL,
	[use_default_credentials] [bit] NOT NULL,
	[enable_ssl] [bit] NOT NULL,
	[flags] [int] NOT NULL,
	[timeout] [int] NULL,
	[last_mod_datetime] [datetime] NOT NULL,
	[last_mod_user] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [SYSMAIL_ACCOUNT_AccountServerTypeMustBeUnique] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[servertype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysmail_server] ADD  DEFAULT ((25)) FOR [port]
ALTER TABLE [dbo].[sysmail_server] ADD  DEFAULT ((0)) FOR [use_default_credentials]
ALTER TABLE [dbo].[sysmail_server] ADD  DEFAULT ((0)) FOR [enable_ssl]
ALTER TABLE [dbo].[sysmail_server] ADD  DEFAULT ((0)) FOR [flags]
ALTER TABLE [dbo].[sysmail_server] ADD  DEFAULT (getdate()) FOR [last_mod_datetime]
ALTER TABLE [dbo].[sysmail_server] ADD  DEFAULT (suser_sname()) FOR [last_mod_user]
ALTER TABLE [dbo].[sysmail_server]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[sysmail_account] ([account_id])
ON DELETE CASCADE
ALTER TABLE [dbo].[sysmail_server]  WITH CHECK ADD FOREIGN KEY([servertype])
REFERENCES [dbo].[sysmail_servertype] ([servertype])
/****** Object:  Trigger [dbo].[trig_sysmail_server]    Script Date: 5/15/2018 12:03:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE TRIGGER trig_sysmail_server
ON msdb.dbo.sysmail_server
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_server'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_server 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_server s, inserted i
      WHERE s.account_id = i.account_id and s.servertype = i.servertype
   END
END

GO
