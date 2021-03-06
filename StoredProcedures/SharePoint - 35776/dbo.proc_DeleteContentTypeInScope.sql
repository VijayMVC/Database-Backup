/****** Object:  StoredProcedure [dbo].[proc_DeleteContentTypeInScope]    Script Date: 5/15/2018 12:11:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteContentTypeInScope(
    @SiteId uniqueidentifier,
    @Class tinyint,
    @Scope nvarchar(256),
    @ContentTypeId tContentTypeId,
    @IsDeactivatingFeature tinyint = 0)
AS
    DECLARE @Ret int
    EXEC @Ret = proc_DeactivateContentTypeInScope @SiteId, NULL, 0, @Class, @Scope, @ContentTypeId, @IsDeactivatingFeature
    RETURN @Ret

GO
