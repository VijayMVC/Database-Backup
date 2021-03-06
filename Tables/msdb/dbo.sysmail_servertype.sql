/****** Object:  Table [dbo].[sysmail_servertype]    Script Date: 5/15/2018 12:03:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmail_servertype](
	[servertype] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[is_incoming] [bit] NOT NULL,
	[is_outgoing] [bit] NOT NULL,
	[last_mod_datetime] [datetime] NOT NULL,
	[last_mod_user] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [SYSMAIL_SERVERTYPE_TypeMustBeUnique] PRIMARY KEY CLUSTERED 
(
	[servertype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysmail_servertype] ADD  DEFAULT ((0)) FOR [is_incoming]
ALTER TABLE [dbo].[sysmail_servertype] ADD  DEFAULT ((1)) FOR [is_outgoing]
ALTER TABLE [dbo].[sysmail_servertype] ADD  DEFAULT (getdate()) FOR [last_mod_datetime]
ALTER TABLE [dbo].[sysmail_servertype] ADD  DEFAULT (suser_sname()) FOR [last_mod_user]
/****** Object:  Trigger [dbo].[trig_sysmail_servertype]    Script Date: 5/15/2018 12:03:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE TRIGGER trig_sysmail_servertype
ON msdb.dbo.sysmail_servertype
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_servertype'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_servertype 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_servertype s, inserted i
      where s.servertype = i.servertype
   END
END

GO
