/****** Object:  UserDefinedFunction [dbo].[fn_IsOverQuotaOrWriteLocked]    Script Date: 5/15/2018 12:15:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_IsOverQuotaOrWriteLocked(@SiteId uniqueidentifier)
RETURNS int
AS
BEGIN
    DECLARE @status int
    SELECT @status = 0
    SELECT
        @status = CASE
            WHEN (BitFlags & 1 = 1) AND 
                DiskQuota > 0 AND DiskUsed > DiskQuota THEN 3
            WHEN DiskQuota > 0 AND DiskUsed > DiskQuota THEN 1
            WHEN (BitFlags & 1 = 1) THEN 2
            ELSE 0
        END
    FROM
        Sites WITH(NOLOCK)   
    WHERE
        Id = @SiteId
    RETURN @status
END

GO
