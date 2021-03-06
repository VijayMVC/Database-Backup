/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSchemaHighLevelInfo]    Script Date: 5/15/2018 12:13:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetSchemaHighLevelInfo
AS
SELECT TOP 1  LastCatChange,
                    LastCPDelete,
                    LastCPAddsBenignModified,
                    LastURIAdds,
                    LastURIModifiedDeleted,
                    LastManagedProp,
                    LastGlobalProps,
                    LastManagedPropDeleted,
                    LastSmpDelete,
                    LastAliasAdd,
                    LastAliasOther
   FROM MSSSchemaHighLevelProps

GO
