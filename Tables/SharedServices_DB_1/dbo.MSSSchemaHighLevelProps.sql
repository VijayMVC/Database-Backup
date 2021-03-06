/****** Object:  Table [dbo].[MSSSchemaHighLevelProps]    Script Date: 5/15/2018 12:05:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSchemaHighLevelProps](
	[pid] [int] NOT NULL,
	[LastCategoryName] [int] NOT NULL,
	[LastCatChange] [datetime] NOT NULL,
	[LastCPDelete] [datetime] NOT NULL,
	[LastCPAddsBenignModified] [datetime] NOT NULL,
	[LastURIAdds] [datetime] NOT NULL,
	[LastURIModifiedDeleted] [datetime] NOT NULL,
	[LastManagedProp] [datetime] NOT NULL,
	[LastGlobalProps] [datetime] NOT NULL,
	[LastManagedPropDeleted] [datetime] NOT NULL,
	[LastSmpDelete] [datetime] NOT NULL,
	[LastAliasAdd] [datetime] NOT NULL,
	[LastAliasOther] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastCatChange]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastCPDelete]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastCPAddsBenignModified]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastURIAdds]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastURIModifiedDeleted]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastManagedProp]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastGlobalProps]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastManagedPropDeleted]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastSmpDelete]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastAliasAdd]
ALTER TABLE [dbo].[MSSSchemaHighLevelProps] ADD  DEFAULT (getdate()) FOR [LastAliasOther]
GO
