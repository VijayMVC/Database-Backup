/****** Object:  Table [dbo].[CompaniesLocations]    Script Date: 5/15/2018 11:59:02 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CompaniesLocations](
	[Value] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Label] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZW_Franchise_ID] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CompaniesLocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[CompaniesLocations] ADD  CONSTRAINT [DF_CompaniesLocations_OLTP_InsertDate]  DEFAULT (getdate()) FOR [OLTP_InsertDate]
GO
