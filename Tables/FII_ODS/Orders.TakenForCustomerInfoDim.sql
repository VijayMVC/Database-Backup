/****** Object:  Table [Orders].[TakenForCustomerInfoDim]    Script Date: 5/15/2018 11:59:38 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[TakenForCustomerInfoDim](
	[TakenForCustomerInfoKey] [int] IDENTITY(1,1) NOT NULL,
	[TakenForCustomerInfoName] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_TakenForCustomerInfoKey] PRIMARY KEY CLUSTERED 
(
	[TakenForCustomerInfoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Orders].[TakenForCustomerInfoDim] ADD  CONSTRAINT [DF_TakenForCustomerInfo_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
