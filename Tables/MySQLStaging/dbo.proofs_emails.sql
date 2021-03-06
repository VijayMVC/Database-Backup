/****** Object:  Table [dbo].[proofs_emails]    Script Date: 5/15/2018 12:04:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[proofs_emails](
	[proof_email_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[proof_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[entity_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[email] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[status_id] [smallint] NOT NULL,
	[response] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_approval] [smallint] NOT NULL,
	[token] [varbinary](32) NULL,
 CONSTRAINT [PK_proofs_emails_proof_email_id] PRIMARY KEY CLUSTERED 
(
	[proof_email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [proofs_emails$token] UNIQUE NONCLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [entity_id]    Script Date: 5/15/2018 12:04:27 PM ******/
CREATE NONCLUSTERED INDEX [entity_id] ON [dbo].[proofs_emails]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [proof_id]    Script Date: 5/15/2018 12:04:27 PM ******/
CREATE NONCLUSTERED INDEX [proof_id] ON [dbo].[proofs_emails]
(
	[proof_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[proofs_emails] ADD  DEFAULT (NULL) FOR [entity_id]
ALTER TABLE [dbo].[proofs_emails] ADD  DEFAULT ((1)) FOR [status_id]
ALTER TABLE [dbo].[proofs_emails] ADD  DEFAULT ((0)) FOR [has_approval]
ALTER TABLE [dbo].[proofs_emails] ADD  DEFAULT (NULL) FOR [token]
GO
