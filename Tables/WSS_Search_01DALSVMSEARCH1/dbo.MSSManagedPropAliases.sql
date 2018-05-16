/****** Object:  Table [dbo].[MSSManagedPropAliases]    Script Date: 5/15/2018 12:09:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSManagedPropAliases](
	[PID] [int] NOT NULL,
	[AliasHash]  AS (binary_checksum([Alias])),
	[Alias] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY]

GO
