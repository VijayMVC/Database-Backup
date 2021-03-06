/****** Object:  StoredProcedure [dbo].[proc_getSiteCount]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_getSiteCount
(   
    @DatabaseId uniqueidentifier = NULL
) AS
    SET NOCOUNT ON
    DECLARE @retval int
    BEGIN TRAN
    SELECT
        @retval = SUM(NumSites)
    FROM
        SiteCounts
    WHERE
        (@DatabaseId IS NULL OR DatabaseId = @DatabaseId)
    IF (@retval IS NULL)
    BEGIN
        SET @retval = 0
        IF (@DatabaseId IS NOT NULL)
            INSERT INTO SiteCounts 
                (DatabaseId, NumSites) 
            VALUES
                (@DatabaseId, 0)
    END
    SELECT @retval
    COMMIT TRAN

GO
