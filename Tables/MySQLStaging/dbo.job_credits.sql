/****** Object:  Table [dbo].[job_credits]    Script Date: 5/15/2018 12:04:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[job_credits](
	[job_credit_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[payment_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[amount] [decimal](11, 2) NOT NULL,
	[created_on] [datetime2](0) NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modified_on] [datetime2](0) NOT NULL,
	[modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_job_credits_job_credit_id] PRIMARY KEY CLUSTERED 
(
	[job_credit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [job_id]    Script Date: 5/15/2018 12:04:13 PM ******/
CREATE NONCLUSTERED INDEX [job_id] ON [dbo].[job_credits]
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [payment_id]    Script Date: 5/15/2018 12:04:13 PM ******/
CREATE NONCLUSTERED INDEX [payment_id] ON [dbo].[job_credits]
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[job_credits] ADD  DEFAULT ((0.00)) FOR [amount]
GO
