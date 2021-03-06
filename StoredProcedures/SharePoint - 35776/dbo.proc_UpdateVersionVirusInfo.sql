/****** Object:  StoredProcedure [dbo].[proc_UpdateVersionVirusInfo]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateVersionVirusInfo(
    @DocSiteId uniqueidentifier,
    @DocId uniqueidentifier,
    @Version int,
    @VirusVendorID int,
    @VirusStatus int,
    @VirusInfo nvarchar(255))
AS
    SET NOCOUNT ON
    UPDATE
        DocVersions
    SET
        VirusVendorID=@VirusVendorID,
        VirusStatus=@VirusStatus,
        VirusInfo=@VirusInfo
    WHERE
        SiteId = @DocSiteId AND
        Id = @DocId AND
        Version = @Version
    RETURN 0

GO
