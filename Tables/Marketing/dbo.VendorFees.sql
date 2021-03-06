/****** Object:  Table [dbo].[VendorFees]    Script Date: 5/15/2018 12:02:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[VendorFees](
	[VendorId] [int] NOT NULL,
	[VfConstId] [int] NOT NULL,
	[VfQty] [int] NULL,
	[VfQtyFee] [real] NULL,
	[VfExtraFee] [real] NULL,
 CONSTRAINT [PK_SystemDefinitions] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC,
	[VfConstId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
