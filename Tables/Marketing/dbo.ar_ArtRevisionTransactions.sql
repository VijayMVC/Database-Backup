/****** Object:  Table [dbo].[ar_ArtRevisionTransactions]    Script Date: 5/15/2018 12:02:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ar_ArtRevisionTransactions](
	[TransactionNumber] [int] IDENTITY(1,1) NOT NULL,
	[WebNumber] [int] NOT NULL,
	[ArtType] [int] NOT NULL,
	[ArtRevisionStatus] [int] NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ar_ArtRevisionTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
