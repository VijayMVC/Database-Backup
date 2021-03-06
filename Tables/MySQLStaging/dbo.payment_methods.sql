/****** Object:  Table [dbo].[payment_methods]    Script Date: 5/15/2018 12:04:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[payment_methods](
	[payment_method_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[display_order] [smallint] NOT NULL,
	[active] [smallint] NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NULL,
	[modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modified_on] [datetime2](0) NULL,
 CONSTRAINT [PK_payment_methods_payment_method_id] PRIMARY KEY CLUSTERED 
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[payment_methods] ADD  CONSTRAINT [DF__payment_m__displ__54D68207]  DEFAULT ((0)) FOR [display_order]
ALTER TABLE [dbo].[payment_methods] ADD  CONSTRAINT [DF__payment_m__activ__55CAA640]  DEFAULT ((0)) FOR [active]
GO
