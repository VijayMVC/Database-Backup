/****** Object:  Table [dbo].[Audit_EFW]    Script Date: 5/15/2018 11:58:34 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Audit_EFW](
	[Type] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TableName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PK] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldValue] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewValue] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UserName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
