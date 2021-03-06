/****** Object:  Table [dbo].[COR_ADDRESSES]    Script Date: 5/15/2018 11:58:34 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_ADDRESSES](
	[AddressID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AddressType] [bigint] NOT NULL,
	[Address1] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostalCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PoliticalDivisionID] [bigint] NULL,
	[Latitude] [numeric](18, 0) NULL,
	[Longitude] [numeric](18, 0) NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
	[GoldMinePlacement] [bigint] NULL,
 CONSTRAINT [PK_COR_ADDRESSES] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
