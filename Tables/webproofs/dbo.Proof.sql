/****** Object:  Table [dbo].[Proof]    Script Date: 5/15/2018 12:09:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Proof](
	[ProofId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OriginalFilename] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProofStateId] [bigint] NOT NULL,
	[SignImage] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignImageWatermark] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignImageThumb] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignType] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignHeight] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignWidth] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Annotations] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comment] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobId] [bigint] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[Estimate] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quantity] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImageRatio] [float] NULL,
 CONSTRAINT [PK_Proof_Id] PRIMARY KEY CLUSTERED 
(
	[ProofId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_Proof_33_512720879__K14_K1_K5_2_3_4_6_7_8_9_10_11_12_13_15_16_17_18_1912]    Script Date: 5/15/2018 12:09:02 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Proof_33_512720879__K14_K1_K5_2_3_4_6_7_8_9_10_11_12_13_15_16_17_18_1912] ON [dbo].[Proof]
(
	[JobId] ASC,
	[ProofId] ASC,
	[ProofStateId] ASC
)
INCLUDE ( 	[DateModified],
	[ModifiedBy],
	[OriginalFilename],
	[SignImage],
	[SignImageWatermark],
	[SignImageThumb],
	[SignType],
	[SignHeight],
	[SignWidth],
	[Annotations],
	[Comment],
	[RowVersion],
	[Estimate],
	[Quantity],
	[ImageRatio]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_Proof_58_512720879__K14_K1_K5_2_3_4_6_7_8_9_10_11_12_13_15_16_17]    Script Date: 5/15/2018 12:09:02 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Proof_58_512720879__K14_K1_K5_2_3_4_6_7_8_9_10_11_12_13_15_16_17] ON [dbo].[Proof]
(
	[JobId] ASC,
	[ProofId] ASC,
	[ProofStateId] ASC
)
INCLUDE ( 	[DateModified],
	[ModifiedBy],
	[OriginalFilename],
	[SignImage],
	[SignImageWatermark],
	[SignImageThumb],
	[SignType],
	[SignHeight],
	[SignWidth],
	[Annotations],
	[Comment],
	[RowVersion],
	[Estimate],
	[Quantity]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Proof]  WITH CHECK ADD  CONSTRAINT [FK_Proof_ProofGroup] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([JobId])
ALTER TABLE [dbo].[Proof] CHECK CONSTRAINT [FK_Proof_ProofGroup]
ALTER TABLE [dbo].[Proof]  WITH CHECK ADD  CONSTRAINT [FK_Proof_ProofState] FOREIGN KEY([ProofStateId])
REFERENCES [dbo].[ProofState] ([ProofStateId])
ALTER TABLE [dbo].[Proof] CHECK CONSTRAINT [FK_Proof_ProofState]
GO
