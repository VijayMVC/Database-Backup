/****** Object:  StoredProcedure [dbo].[proc_RenameHostHeaderSite]    Script Date: 5/15/2018 12:12:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RenameHostHeaderSite(
    @SiteId uniqueidentifier,
    @HostHeader nvarchar(128))
AS
    SET NOCOUNT ON
    UPDATE
        Sites
    SET
        HostHeader = @HostHeader
    WHERE
        Id = @SiteId
    EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        32768,  8, NULL

GO
