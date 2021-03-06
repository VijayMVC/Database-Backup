/****** Object:  Table [Store].[AltAddressDim]    Script Date: 5/15/2018 11:59:43 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Store].[AltAddressDim](
	[StoreNumber] [int] NOT NULL,
	[RecID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ADDRESS1] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS2] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CITY] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COUNTRY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_AltAddressDim] PRIMARY KEY CLUSTERED 
(
	[StoreNumber] ASC,
	[RecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Store].[AltAddressDim] ADD  CONSTRAINT [DF_AltAddressDim_IsValid]  DEFAULT ((1)) FOR [IsValid]
GO
