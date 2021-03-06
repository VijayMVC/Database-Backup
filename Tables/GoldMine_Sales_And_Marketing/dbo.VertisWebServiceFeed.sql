/****** Object:  Table [dbo].[VertisWebServiceFeed]    Script Date: 5/15/2018 12:01:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[VertisWebServiceFeed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Webnumber] [int] NOT NULL,
	[Storenumber] [int] NOT NULL,
	[LastName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Contact] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Shareholder1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[State] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Zip] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Country] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CenterWebURL] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CenterEmail] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FranchiseeEmail] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[A1Zip] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldFBC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OfficeFBC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MSM] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Region] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OpeningDate] [datetime] NOT NULL,
 CONSTRAINT [PK_VertisWebServiceFeed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
