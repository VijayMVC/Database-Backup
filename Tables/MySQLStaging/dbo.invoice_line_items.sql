/****** Object:  Table [dbo].[invoice_line_items]    Script Date: 5/15/2018 12:04:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[invoice_line_items](
	[invoice_line_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[invoice_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[type] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[quantity] [int] NULL,
	[price] [decimal](12, 2) NULL,
	[ext_price] [decimal](12, 2) NULL,
	[discount] [decimal](12, 2) NOT NULL,
	[tax] [decimal](12, 2) NULL,
	[tax_rate] [decimal](6, 3) NULL,
	[amount_due] [decimal](12, 2) NULL,
	[amount_paid] [decimal](12, 2) NOT NULL,
	[date_paid] [datetime2](0) NULL,
	[date_placed] [datetime2](0) NULL,
	[date_unplaced] [datetime2](0) NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_on] [datetime2](0) NULL,
 CONSTRAINT [PK_invoice_line_items_invoice_line_item_id] PRIMARY KEY CLUSTERED 
(
	[invoice_line_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IDX_Inv_Line_Item_Date_Paid]    Script Date: 5/15/2018 12:04:12 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Inv_Line_Item_Date_Paid] ON [dbo].[invoice_line_items]
(
	[date_paid] ASC
)
INCLUDE ( 	[invoice_line_item_id],
	[invoice_id],
	[amount_due]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_invoice_line_items_type_created_by_includes]    Script Date: 5/15/2018 12:04:12 PM ******/
CREATE NONCLUSTERED INDEX [idx_invoice_line_items_type_created_by_includes] ON [dbo].[invoice_line_items]
(
	[type] ASC,
	[created_by] ASC
)
INCLUDE ( 	[invoice_line_item_id],
	[invoice_id],
	[quantity],
	[discount],
	[tax],
	[amount_due],
	[amount_paid],
	[date_paid],
	[created_on],
	[last_modified_by],
	[last_modified_on]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [invoice_id]    Script Date: 5/15/2018 12:04:12 PM ******/
CREATE NONCLUSTERED INDEX [invoice_id] ON [dbo].[invoice_line_items]
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__quant__24E777C3]  DEFAULT (NULL) FOR [quantity]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__price__25DB9BFC]  DEFAULT (NULL) FOR [price]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__ext_p__26CFC035]  DEFAULT (NULL) FOR [ext_price]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__disco__27C3E46E]  DEFAULT ((0.00)) FOR [discount]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_lin__tax__28B808A7]  DEFAULT (NULL) FOR [tax]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__tax_r__29AC2CE0]  DEFAULT (NULL) FOR [tax_rate]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__amoun__2AA05119]  DEFAULT (NULL) FOR [amount_due]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__amoun__2B947552]  DEFAULT ((0.00)) FOR [amount_paid]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__date___2C88998B]  DEFAULT (NULL) FOR [date_paid]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__creat__2D7CBDC4]  DEFAULT (NULL) FOR [created_by]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__creat__2E70E1FD]  DEFAULT (NULL) FOR [created_on]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__last___2F650636]  DEFAULT (NULL) FOR [last_modified_by]
ALTER TABLE [dbo].[invoice_line_items] ADD  CONSTRAINT [DF__invoice_l__last___30592A6F]  DEFAULT (NULL) FOR [last_modified_on]
GO
