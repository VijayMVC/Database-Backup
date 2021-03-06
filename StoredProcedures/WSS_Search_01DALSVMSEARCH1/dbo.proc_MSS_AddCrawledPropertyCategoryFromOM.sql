/****** Object:  StoredProcedure [dbo].[proc_MSS_AddCrawledPropertyCategoryFromOM]    Script Date: 5/15/2018 12:13:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AddCrawledPropertyCategoryFromOM
@CategoryName         nvarchar(64),
@Propset              uniqueidentifier
as
DECLARE @DiscoverNewProperties bit   select @DiscoverNewProperties = 0
DECLARE @MapToContents bit          select @MapToContents = 0
DECLARE @FullTextQueriable bit      select @FullTextQueriable = 0
DECLARE @Retrievable bit            select @Retrievable = 0
DECLARE @RetVal int                 select @RetVal = 0
BEGIN TRANSACTION
       exec  @RetVal = proc_MSS_AddCrawledPropertyCategory @Propset, @DiscoverNewProperties, @MapToContents, @FullTextQueriable,  @Retrievable,  @CategoryName, ' ', ' '
       if 0 <> @RetVal  BEGIN
                ROLLBACK TRANSACTION
                return @RetVal
       END
COMMIT TRANSACTION

GO
