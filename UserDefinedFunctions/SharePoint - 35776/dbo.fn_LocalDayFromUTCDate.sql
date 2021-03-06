/****** Object:  UserDefinedFunction [dbo].[fn_LocalDayFromUTCDate]    Script Date: 5/15/2018 12:15:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_LocalDayFromUTCDate(
    @dtUTC datetime,
    @BiasMinutes int,
    @Dlt_m int,
    @Dlt_nwd int,
    @Dlt_wd int,
    @Dlt_h int,
    @Std_m int,
    @Std_nwd int,
    @Std_wd int,
    @Std_h int)
RETURNS datetime
AS
BEGIN
    DECLARE @bDlt bit
    DECLARE @dtLocal datetime
    SET @dtLocal = DATEADD(minute,-@BiasMinutes,@dtUTC)
    IF (DATEPART(hour,@dtLocal) < 23)
        RETURN @dtLocal
    IF (@Dlt_m < @Std_m)
    BEGIN
        SET @bDlt =
            CASE
                WHEN
                    dbo.fn_CompareTZTransitionDate(@dtLocal, @Dlt_m, @Dlt_nwd, @Dlt_wd, @Dlt_h) = 1 AND
                    dbo.fn_CompareTZTransitionDate(@dtLocal, @Std_m, @Std_nwd, @Std_wd, @Std_h) = 0
                THEN 1
                ELSE 0
            END
    END
    ELSE IF (@Std_m < @Dlt_m)
    BEGIN
        SET @bDlt =
            CASE
                WHEN
                    dbo.fn_CompareTZTransitionDate(@dtLocal, @Std_m, @Std_nwd, @Std_wd, @Std_h) = 1 AND
                    dbo.fn_CompareTZTransitionDate(@dtLocal, @Dlt_m, @Dlt_nwd, @Dlt_wd, @Dlt_h) = 0
                THEN 0
                ELSE 1
            END
    END
    ELSE
    BEGIN
        SET @bDlt =0
    END
    IF (@bDlt = 1)
        SET @dtLocal = DATEADD(minute,60,@dtLocal)
    RETURN @dtLocal
END

GO
