/****** Object:  Table [dbo].[OriginType]    Script Date: 5/15/2018 12:06:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OriginType](
	[CustomerTypeID] [int] NOT NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OriginTypeName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsValid] [bit] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[OriginType] ADD  CONSTRAINT [DF_OriginType_IsValid]  DEFAULT ((1)) FOR [IsValid]
GO
