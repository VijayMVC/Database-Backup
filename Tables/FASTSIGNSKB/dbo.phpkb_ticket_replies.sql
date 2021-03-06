/****** Object:  Table [dbo].[phpkb_ticket_replies]    Script Date: 5/15/2018 11:59:19 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_ticket_replies](
	[reply_id] [int] IDENTITY(1,1) NOT NULL,
	[ticket_id] [int] NOT NULL,
	[reply_datetime] [smalldatetime] NOT NULL,
	[member_id] [int] NOT NULL,
	[content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[reply_read] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[replier_type] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [reply_id] PRIMARY KEY CLUSTERED 
(
	[reply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_ticket_replies] ADD  DEFAULT ((0)) FOR [member_id]
ALTER TABLE [dbo].[phpkb_ticket_replies] ADD  DEFAULT ('no') FOR [reply_read]
ALTER TABLE [dbo].[phpkb_ticket_replies] ADD  DEFAULT ('Member') FOR [replier_type]
ALTER TABLE [dbo].[phpkb_ticket_replies]  WITH CHECK ADD  CONSTRAINT [fk___ticketid_replies] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[phpkb_tickets] ([ticket_id])
ALTER TABLE [dbo].[phpkb_ticket_replies] CHECK CONSTRAINT [fk___ticketid_replies]
ALTER TABLE [dbo].[phpkb_ticket_replies]  WITH CHECK ADD CHECK  (([replier_type]='Member' OR [replier_type]='Admin'))
ALTER TABLE [dbo].[phpkb_ticket_replies]  WITH CHECK ADD CHECK  (([reply_read]='no' OR [reply_read]='yes'))
GO
