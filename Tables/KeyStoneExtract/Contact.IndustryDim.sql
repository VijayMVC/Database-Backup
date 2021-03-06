/****** Object:  Table [Contact].[IndustryDim]    Script Date: 5/15/2018 12:02:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[IndustryDim](
	[IndustryKey] [int] IDENTITY(1,1) NOT NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IndustryTypeID] [int] NULL,
	[IndustryTypeKey] [int] NULL,
	[ActiveType] [bit] NULL,
	[SICCode] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
 CONSTRAINT [PK_IndustryDim] PRIMARY KEY CLUSTERED 
(
	[IndustryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
