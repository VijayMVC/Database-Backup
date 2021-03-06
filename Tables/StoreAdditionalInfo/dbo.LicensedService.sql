/****** Object:  Table [dbo].[LicensedService]    Script Date: 5/15/2018 12:06:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[LicensedService](
	[StoreAdditionalInfo_Id] [bigint] NOT NULL,
	[InstallDate] [datetime] NULL,
	[ServiceName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LicensedService_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_LicensedService_Id] PRIMARY KEY CLUSTERED 
(
	[LicensedService_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[LicensedService]  WITH CHECK ADD  CONSTRAINT [FK_LicensedService_StoreAdditionalInfo] FOREIGN KEY([StoreAdditionalInfo_Id])
REFERENCES [dbo].[StoreAdditionalInfo] ([StoreAdditionalInfo_Id])
ALTER TABLE [dbo].[LicensedService] CHECK CONSTRAINT [FK_LicensedService_StoreAdditionalInfo]
GO
