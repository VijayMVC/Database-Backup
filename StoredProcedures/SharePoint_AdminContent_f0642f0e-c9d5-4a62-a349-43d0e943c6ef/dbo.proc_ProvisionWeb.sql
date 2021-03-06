/****** Object:  StoredProcedure [dbo].[proc_ProvisionWeb]    Script Date: 5/15/2018 12:12:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ProvisionWeb(
    @SiteId       uniqueidentifier,
    @WebId        uniqueidentifier,
    @WebFullUrl  nvarchar(260)
)
AS
    SET NOCOUNT ON
    EXEC proc_CreateDir @SiteId, @WebId, @WebFullUrl, N'_private', 1, 0,
        0, 0, NULL, NULL, NULL, NULL
    EXEC proc_CreateDir @SiteId, @WebId, @WebFullUrl, N'images', 1, 0,
        0, 0, NULL, NULL, NULL, NULL
    EXEC proc_CreateDir @SiteId, @WebId, @WebFullUrl, N'_vti_pvt', 1, 0,
        0, 0, NULL, NULL, NULL, NULL
    RETURN 0

GO
