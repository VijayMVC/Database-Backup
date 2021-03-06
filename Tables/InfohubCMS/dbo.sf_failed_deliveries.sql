/****** Object:  Table [dbo].[sf_failed_deliveries]    Script Date: 5/15/2018 12:01:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_failed_deliveries](
	[subscriber_resolve_key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subscriber_id] [uniqueidentifier] NULL,
	[job_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[failure_reason] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fail_time] [datetime] NOT NULL,
	[description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[delivery_address] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_failed_deliveries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
