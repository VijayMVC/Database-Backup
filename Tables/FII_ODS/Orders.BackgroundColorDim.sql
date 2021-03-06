/****** Object:  Table [Orders].[BackgroundColorDim]    Script Date: 5/15/2018 11:59:35 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[BackgroundColorDim](
	[BackgroundColorKey] [int] IDENTITY(1,1) NOT NULL,
	[BackgroundColorName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_BackgroundColorKey] PRIMARY KEY CLUSTERED 
(
	[BackgroundColorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Hint_BackgroundColorName]    Script Date: 5/15/2018 11:59:35 AM ******/
CREATE NONCLUSTERED INDEX [Hint_BackgroundColorName] ON [Orders].[BackgroundColorDim]
(
	[BackgroundColorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Orders].[BackgroundColorDim] ADD  CONSTRAINT [DF_BackgroundColor_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
