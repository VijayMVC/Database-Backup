/****** Object:  Table [Contact].[AlternateAddressDim]    Script Date: 5/15/2018 11:59:21 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[AlternateAddressDim](
	[AlternateAddressKey] [int] IDENTITY(1,1) NOT NULL,
	[AlternateAddressName] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_AlternateAddressKey] PRIMARY KEY CLUSTERED 
(
	[AlternateAddressKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [Contact].[AlternateAddressDim] ADD  CONSTRAINT [DF_AlternateAddress_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
