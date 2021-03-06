/****** Object:  Table [dbo].[Customer]    Script Date: 5/15/2018 12:09:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Customer](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerNumber] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobId] [bigint] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[CGUID] [uniqueidentifier] NOT NULL,
	[IsApprover] [bit] NOT NULL,
 CONSTRAINT [PK_CenterCustomer_Id] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_Customer_33_1332199796__K5_K1_2_3_4_6_7_8_9987]    Script Date: 5/15/2018 12:09:01 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Customer_33_1332199796__K5_K1_2_3_4_6_7_8_9987] ON [dbo].[Customer]
(
	[JobId] ASC,
	[CustomerId] ASC
)
INCLUDE ( 	[Name],
	[Email],
	[CustomerNumber],
	[RowVersion],
	[CGUID],
	[IsApprover]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_Customer_33_1332199796__K5_K1_K7_2_3_4_6_8]    Script Date: 5/15/2018 12:09:01 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Customer_33_1332199796__K5_K1_K7_2_3_4_6_8] ON [dbo].[Customer]
(
	[JobId] ASC,
	[CustomerId] ASC,
	[CGUID] ASC
)
INCLUDE ( 	[Name],
	[Email],
	[CustomerNumber],
	[RowVersion],
	[IsApprover]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_Customer_33_1332199796__K7_K1_K5_2_3_4_6_8_1771]    Script Date: 5/15/2018 12:09:01 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Customer_33_1332199796__K7_K1_K5_2_3_4_6_8_1771] ON [dbo].[Customer]
(
	[CGUID] ASC,
	[CustomerId] ASC,
	[JobId] ASC
)
INCLUDE ( 	[Name],
	[Email],
	[CustomerNumber],
	[RowVersion],
	[IsApprover]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_Customer_JobID]    Script Date: 5/15/2018 12:09:01 PM ******/
CREATE NONCLUSTERED INDEX [idx_Customer_JobID] ON [dbo].[Customer]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [UI_Customer_CGUID]    Script Date: 5/15/2018 12:09:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UI_Customer_CGUID] ON [dbo].[Customer]
(
	[CGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CGUID]  DEFAULT (newid()) FOR [CGUID]
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_IsApprover]  DEFAULT ((1)) FOR [IsApprover]
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_CenterCustomer_ProofGroup] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([JobId])
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_CenterCustomer_ProofGroup]
GO
