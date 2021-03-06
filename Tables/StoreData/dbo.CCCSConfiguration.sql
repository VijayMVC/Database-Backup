/****** Object:  Table [dbo].[CCCSConfiguration]    Script Date: 5/15/2018 12:06:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CCCSConfiguration](
	[ConfigurationID] [uniqueidentifier] NOT NULL,
	[RegistrationKey] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankNumber] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TerminalNumber] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VendorID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HostName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProcessorType] [int] NULL,
	[ProcessorTypeText] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MarketSegment] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyKey] [varbinary](50) NULL,
	[ProcessToken] [varbinary](50) NULL,
 CONSTRAINT [PK_CCCSConfiguration] PRIMARY KEY CLUSTERED 
(
	[ConfigurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
