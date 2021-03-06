/****** Object:  Table [dbo].[sub_Qualifiers]    Script Date: 5/15/2018 12:02:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sub_Qualifiers](
	[QualifierID] [int] IDENTITY(1,1) NOT NULL,
	[SubsidyID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Active] [bit] NOT NULL,
	[RequiresOrderID] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProviderID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QualifierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
