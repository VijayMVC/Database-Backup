/****** Object:  Table [dbo].[CompaniesLocations_05082018]    Script Date: 5/15/2018 11:59:02 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CompaniesLocations_05082018](
	[Value] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Label] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZW_Franchise_ID] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
