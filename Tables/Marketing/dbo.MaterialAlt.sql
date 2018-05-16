/****** Object:  Table [dbo].[MaterialAlt]    Script Date: 5/15/2018 12:02:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MaterialAlt](
	[MatId] [int] NOT NULL,
	[MatAltId] [int] NOT NULL,
	[MatAltOrder] [smallint] NULL,
 CONSTRAINT [PK_MaterialAlt] PRIMARY KEY CLUSTERED 
(
	[MatId] ASC,
	[MatAltId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
