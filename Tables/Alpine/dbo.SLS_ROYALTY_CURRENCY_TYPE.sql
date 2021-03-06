/****** Object:  Table [dbo].[SLS_ROYALTY_CURRENCY_TYPE]    Script Date: 5/15/2018 11:58:39 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SLS_ROYALTY_CURRENCY_TYPE](
	[RoyaltyCurrencyType] [bigint] NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Symbol] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
	[CurrencyCode] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DecimalUnicode] [bigint] NOT NULL,
	[CountryISOcode] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_SLS_ROYALTY_CURRENCY_TYPE] PRIMARY KEY CLUSTERED 
(
	[RoyaltyCurrencyType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

GO
