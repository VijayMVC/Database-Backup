/****** Object:  Table [dbo].[sysmail_send_retries]    Script Date: 5/15/2018 12:03:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmail_send_retries](
	[conversation_handle] [uniqueidentifier] NOT NULL,
	[mailitem_id] [int] NOT NULL,
	[send_attempts] [int] NOT NULL,
	[last_send_attempt_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[conversation_handle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysmail_send_retries] ADD  DEFAULT ((1)) FOR [send_attempts]
ALTER TABLE [dbo].[sysmail_send_retries] ADD  DEFAULT (getdate()) FOR [last_send_attempt_date]
ALTER TABLE [dbo].[sysmail_send_retries]  WITH CHECK ADD  CONSTRAINT [FK_mailitems_mailitem_id] FOREIGN KEY([mailitem_id])
REFERENCES [dbo].[sysmail_mailitems] ([mailitem_id])
ON DELETE CASCADE
ALTER TABLE [dbo].[sysmail_send_retries] CHECK CONSTRAINT [FK_mailitems_mailitem_id]
GO
