/****** Object:  Table [dbo].[sysmail_principalprofile]    Script Date: 5/15/2018 12:03:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmail_principalprofile](
	[profile_id] [int] NOT NULL,
	[principal_sid] [varbinary](85) NOT NULL,
	[is_default] [bit] NOT NULL,
	[last_mod_datetime] [datetime] NOT NULL,
	[last_mod_user] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [SYSMAIL_PRINCIPALPROFILE_ProfilePrincipalMustBeUnique] PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC,
	[principal_sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysmail_principalprofile] ADD  DEFAULT ((0)) FOR [is_default]
ALTER TABLE [dbo].[sysmail_principalprofile] ADD  DEFAULT (getdate()) FOR [last_mod_datetime]
ALTER TABLE [dbo].[sysmail_principalprofile] ADD  DEFAULT (suser_sname()) FOR [last_mod_user]
ALTER TABLE [dbo].[sysmail_principalprofile]  WITH CHECK ADD FOREIGN KEY([profile_id])
REFERENCES [dbo].[sysmail_profile] ([profile_id])
ON DELETE CASCADE
/****** Object:  Trigger [dbo].[trig_principalprofile]    Script Date: 5/15/2018 12:03:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE TRIGGER trig_principalprofile
ON msdb.dbo.sysmail_principalprofile
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_principalprofile'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_principalprofile 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_principalprofile p, inserted i
      WHERE p.profile_id = i.profile_id and p.principal_sid = i.principal_sid
   END
END

GO
