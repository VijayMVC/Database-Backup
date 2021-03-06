/****** Object:  Table [dbo].[proofs_old]    Script Date: 5/15/2018 12:04:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[proofs_old](
	[proof_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[image_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sent_on] [datetime2](0) NULL,
	[accepted_on] [datetime2](0) NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_proofs_old_proof_id] PRIMARY KEY CLUSTERED 
(
	[proof_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[proofs_old] ADD  DEFAULT (NULL) FOR [name]
ALTER TABLE [dbo].[proofs_old] ADD  DEFAULT (N'PENDING') FOR [status]
ALTER TABLE [dbo].[proofs_old] ADD  DEFAULT (NULL) FOR [sent_on]
ALTER TABLE [dbo].[proofs_old] ADD  DEFAULT (NULL) FOR [accepted_on]
GO
