/****** Object:  Table [dbo].[MIPVersion]    Script Date: 5/15/2018 12:05:11 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MIPVersion](
	[VersionId] [int] NOT NULL,
	[Version] [bigint] NOT NULL,
 CONSTRAINT [PK_MIPVersion] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
