/****** Object:  Table [dbo].[CenterInfo]    Script Date: 5/15/2018 11:58:41 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CenterInfo](
	[WebNumber] [int] NOT NULL,
	[Email] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxId] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxPercent] [decimal](18, 3) NULL,
	[TaxString] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RegionId] [int] NOT NULL,
 CONSTRAINT [PK_CenterEmails] PRIMARY KEY CLUSTERED 
(
	[WebNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[CenterInfo] ADD  CONSTRAINT [DF_CenterInfo_RegionId]  DEFAULT ((1)) FOR [RegionId]
ALTER TABLE [dbo].[CenterInfo]  WITH CHECK ADD  CONSTRAINT [FK_CenterInfo_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
ALTER TABLE [dbo].[CenterInfo] CHECK CONSTRAINT [FK_CenterInfo_Regions]
GO
