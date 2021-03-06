/****** Object:  Table [dbo].[phpkb_login_attempts]    Script Date: 5/15/2018 11:59:18 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_login_attempts](
	[attempt_id] [int] IDENTITY(1,1) NOT NULL,
	[author_username] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[machine_IP] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[attempt_date_time] [smalldatetime] NOT NULL,
	[attempt_count] [int] NOT NULL,
 CONSTRAINT [attempt_id] PRIMARY KEY CLUSTERED 
(
	[attempt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_login_attempts] ADD  DEFAULT ('0') FOR [attempt_count]
GO
