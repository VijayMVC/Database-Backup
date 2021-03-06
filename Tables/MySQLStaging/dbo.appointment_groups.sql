/****** Object:  Table [dbo].[appointment_groups]    Script Date: 5/15/2018 12:03:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[appointment_groups](
	[appointment_group_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[module] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[field] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[default] [smallint] NOT NULL,
 CONSTRAINT [PK_appointment_groups_appointment_group_id] PRIMARY KEY CLUSTERED 
(
	[appointment_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[appointment_groups] ADD  DEFAULT (N'') FOR [module]
ALTER TABLE [dbo].[appointment_groups] ADD  DEFAULT ((0)) FOR [default]
GO
