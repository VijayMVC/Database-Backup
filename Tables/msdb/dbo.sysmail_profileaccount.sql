/****** Object:  Table [dbo].[sysmail_profileaccount]    Script Date: 5/15/2018 12:03:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmail_profileaccount](
	[profile_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[sequence_number] [int] NULL,
	[last_mod_datetime] [datetime] NOT NULL,
	[last_mod_user] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [SYSMAIL_ACCOUNT_ProfileAccountMustBeUnique] PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysmail_profileaccount] ADD  DEFAULT (getdate()) FOR [last_mod_datetime]
ALTER TABLE [dbo].[sysmail_profileaccount] ADD  DEFAULT (suser_sname()) FOR [last_mod_user]
ALTER TABLE [dbo].[sysmail_profileaccount]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[sysmail_account] ([account_id])
ON DELETE CASCADE
/****** Object:  Trigger [dbo].[trig_sysmail_profileaccount]    Script Date: 5/15/2018 12:03:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE TRIGGER trig_sysmail_profileaccount
ON msdb.dbo.sysmail_profileaccount
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_profileaccount'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_profileaccount 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_profileaccount p, inserted i
      WHERE p.profile_id = i.profile_id and p.account_id = i.account_id
   END
END

GO
