/****** Object:  Table [Orders].[PaymentMethodDim]    Script Date: 5/15/2018 11:59:37 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[PaymentMethodDim](
	[PaymentMethodKey] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_PaymentMethodKey] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Orders].[PaymentMethodDim] ADD  CONSTRAINT [DF_PaymentMethod_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
