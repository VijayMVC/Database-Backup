/****** Object:  Table [dbo].[AdRotator]    Script Date: 5/15/2018 11:58:44 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AdRotator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image] [image] NOT NULL,
	[url] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Order] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[createdDate] [datetime] NULL,
	[modifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modifiedDate] [datetime] NULL,
 CONSTRAINT [PK_AdRotator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[AdRotator] ADD  CONSTRAINT [DF_AdRotator_Order]  DEFAULT ((999)) FOR [Order]
ALTER TABLE [dbo].[AdRotator] ADD  CONSTRAINT [DF_AdRotator_isActive]  DEFAULT ((0)) FOR [isActive]
GO
