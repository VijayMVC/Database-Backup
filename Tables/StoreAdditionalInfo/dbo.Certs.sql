/****** Object:  Table [dbo].[Certs]    Script Date: 5/15/2018 12:06:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Certs](
	[StoreAdditionalInfo_Id] [bigint] NOT NULL,
	[AppID] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date1] [datetime] NULL,
	[Date2] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Person] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CertTypes_Id] [bigint] NULL,
	[Certs_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Certs_Id] PRIMARY KEY CLUSTERED 
(
	[Certs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Certs]  WITH CHECK ADD  CONSTRAINT [FK_Certs_CertTypes] FOREIGN KEY([CertTypes_Id])
REFERENCES [dbo].[CertTypes] ([CertTypes_Id])
ALTER TABLE [dbo].[Certs] CHECK CONSTRAINT [FK_Certs_CertTypes]
ALTER TABLE [dbo].[Certs]  WITH CHECK ADD  CONSTRAINT [FK_Certs_StoreAdditionalInfo] FOREIGN KEY([StoreAdditionalInfo_Id])
REFERENCES [dbo].[StoreAdditionalInfo] ([StoreAdditionalInfo_Id])
ALTER TABLE [dbo].[Certs] CHECK CONSTRAINT [FK_Certs_StoreAdditionalInfo]
GO
