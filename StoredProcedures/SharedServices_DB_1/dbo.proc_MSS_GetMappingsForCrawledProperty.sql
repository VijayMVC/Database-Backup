/****** Object:  StoredProcedure [dbo].[proc_MSS_GetMappingsForCrawledProperty]    Script Date: 5/15/2018 12:11:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetMappingsForCrawledProperty
@Propset uniqueidentifier,
@PropertyName nvarchar(440),
@VariantType int
AS
DECLARE @CrawledPropertyId int Select @CrawledPropertyId = 0

Select @CrawledPropertyId = CrawledPropertyId from MSSCrawledProperties 
                                              where Propset = @Propset
                                                and PropertyName = @PropertyName
                                                and VariantType = @VariantType
if @CrawledPropertyId = 0 return 100

select FriendlyName
    From MSSSchemaPropertyMappings as m
    Inner Join MSSManagedProperties as MP
     on m.PID = MP.PID
    Where m.crawledPropertyId= @crawledPropertyId
    Order By MP.FriendlyName

GO
