/****** Object:  Table [dbo].[Software]    Script Date: 5/15/2018 12:06:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Software](
	[Version] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SoftwareMake_Id] [bigint] NULL,
	[SoftwareType_Id] [bigint] NULL,
	[Software_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Software_Id] PRIMARY KEY CLUSTERED 
(
	[Software_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Software]  WITH CHECK ADD  CONSTRAINT [FK_Software_SoftwareMake] FOREIGN KEY([SoftwareMake_Id])
REFERENCES [dbo].[SoftwareMake] ([SoftwareMake_Id])
ALTER TABLE [dbo].[Software] CHECK CONSTRAINT [FK_Software_SoftwareMake]
ALTER TABLE [dbo].[Software]  WITH CHECK ADD  CONSTRAINT [FK_Software_SoftwareType] FOREIGN KEY([SoftwareType_Id])
REFERENCES [dbo].[SoftwareType] ([SoftwareType_Id])
ALTER TABLE [dbo].[Software] CHECK CONSTRAINT [FK_Software_SoftwareType]
GO
