/****** Object:  Table [dbo].[phpkb_groups]    Script Date: 5/15/2018 11:59:17 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[creation_date] [smalldatetime] NOT NULL,
	[group_type] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [group_id] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_groups] ADD  DEFAULT ('frontend') FOR [group_type]
GO
