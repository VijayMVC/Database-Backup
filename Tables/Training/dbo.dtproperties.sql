/****** Object:  Table [dbo].[dtproperties]    Script Date: 5/15/2018 12:07:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[dtproperties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[objectid] [int] NULL,
	[property] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[value] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[uvalue] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lvalue] [image] NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [pk_dtproperties] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[property] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[dtproperties] ADD  DEFAULT (0) FOR [version]
GO
