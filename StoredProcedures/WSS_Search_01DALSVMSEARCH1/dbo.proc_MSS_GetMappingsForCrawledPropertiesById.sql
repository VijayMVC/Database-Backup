/****** Object:  StoredProcedure [dbo].[proc_MSS_GetMappingsForCrawledPropertiesById]    Script Date: 5/15/2018 12:13:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetMappingsForCrawledPropertiesById
@crawledPropertyId int
AS
select pid, mappingorder
    From MSSSchemaPropertyMappings 
    Where crawledPropertyId = @crawledPropertyId

GO
