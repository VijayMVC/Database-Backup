/****** Object:  Table [Utility].[IndustryMapping]    Script Date: 5/15/2018 11:59:58 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Utility].[IndustryMapping](
	[SourceIndustryType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatchingIndustryKey] [int] NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_IndustryMapping_1]    Script Date: 5/15/2018 11:59:58 AM ******/
CREATE CLUSTERED INDEX [IX_IndustryMapping_1] ON [Utility].[IndustryMapping]
(
	[SourceIndustryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Utility].[IndustryMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerIndustryMapping_CustomerIndustryDim] FOREIGN KEY([MatchingIndustryKey])
REFERENCES [dbo].[CustomerIndustryDim] ([IndustryKey])
ALTER TABLE [Utility].[IndustryMapping] CHECK CONSTRAINT [FK_CustomerIndustryMapping_CustomerIndustryDim]
GO
