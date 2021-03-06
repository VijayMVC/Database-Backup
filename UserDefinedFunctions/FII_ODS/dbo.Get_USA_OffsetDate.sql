/****** Object:  UserDefinedFunction [dbo].[Get_USA_OffsetDate]    Script Date: 5/15/2018 12:14:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.Get_USA_OffsetDate
(
    @Date datetime
    , @Sign bit
    --0 = UTC to CT
    --1 = CT to UTC
)
RETURNS datetime
AS
BEGIN
    IF @Date = CAST('1753-01-01 00:00:00.000' as datetime) AND @Sign = 0 RETURN @Date;
    IF @Date = CAST('9999-12-31 23:59:59.997' as datetime) AND @Sign = 1 RETURN @Date;
 
 /* Does NOT yet check for DST in the time zone column */
    DECLARE
        @Time tinyint
        , @Datetimeoffset datetimeoffset
        , @BeginDST datetime
        , @EndDST datetime
        , @ReturnDate datetime;
 
    SET @Time = 0;
    SELECT @Datetimeoffset = CAST(@Date as datetimeoffset);
 
    IF YEAR(@Date) >= 2006
        BEGIN
            IF MONTH(@Date) IN (1,2,12) SET @Time = 1; --Not in DST
            IF MONTH(@Date) IN (4,5,6,7,8,9,10) SET @Time = 2; --In DST
        END;
    ELSE
        BEGIN
            IF MONTH(@Date) IN (1,2,3,11,12) SET @Time = 1; --Not in DST
            IF MONTH(@Date) IN (5,6,7,8,9) SET @Time = 2; --In DST
        END;
 
    --Still Need to determin if DST or Not, either a starting or ending month
    IF @Time = 0
        BEGIN
            DECLARE
                @DSTDate date
                , @WeekDay int;
 
            IF YEAR(@Date) >= 2006
                BEGIN
                    --2006 and forward second Sunday in March, clocks are set ahead - 2:00 a.m. becomes 3:00 a.m.
                    SET @DSTDate = CAST(CAST(YEAR(@Date) as varchar(4)) + '-03-01' as Date);
                    SET
                        @WeekDay =
                            CASE DATEPART(WEEKDAY, @DSTDate)
                                WHEN 1 THEN 8
                                WHEN 2 THEN 14
                                WHEN 3 THEN 13
                                WHEN 4 THEN 12
                                WHEN 5 THEN 11
                                WHEN 6 THEN 10
                                WHEN 7 THEN 9
                            END;
                    SELECT @BeginDST = CAST(CAST(@DSTDate as varchar) + ' 02:00:00' as datetime);
 
                    --2005 and before first Sunday in April, clocks are set ahead - 2:00 a.m. becomes 3:00 a.m.
                    SET @DSTDate = CAST(CAST(YEAR(@Date) as varchar(4)) + '-04-01' as Date);
                    SET
                        @WeekDay =
                            CASE DATEPART(WEEKDAY, @DSTDate)
                                WHEN 1 THEN 1
                                WHEN 2 THEN 7
                                WHEN 3 THEN 6
                                WHEN 4 THEN 5
                                WHEN 5 THEN 4
                                WHEN 6 THEN 3
                                WHEN 7 THEN 2
                            END;
                    SELECT @EndDST = CAST(CAST(@DSTDate as varchar) + ' 02:00:00' as datetime);
                END;
            ELSE
                BEGIN
                    --2006 first Sunday in November, clocks are set back - 2:00 a.m. becomes 1:00 a.m.
                    SET @DSTDate = CAST(CAST(YEAR(@Date) as varchar(4)) + '-11-01' as Date);
                    SET
                        @WeekDay =
                            CASE DATEPART(WEEKDAY, @DSTDate)
                                WHEN 1 THEN 1
                                WHEN 2 THEN 7
                                WHEN 3 THEN 6
                                WHEN 4 THEN 5
                                WHEN 5 THEN 4
                                WHEN 6 THEN 3
                                WHEN 7 THEN 2
                            END;
                    SELECT @BeginDST = CAST(CAST(@DSTDate as varchar) + ' 02:00:00' as datetime);
 
                    --2005 last Sunday in October, clocks are set back - 2:00 a.m. becomes 1:00 a.m.
                    SET @DSTDate = CAST(CAST(YEAR(@Date) as varchar(4)) + '-10-31' as Date);
                    SET
                        @WeekDay =
                            Case DATEPART(WEEKDAY, @DSTDate)
                                WHEN 1 THEN 31
                                WHEN 2 THEN 30
                                WHEN 3 THEN 29
                                WHEN 4 THEN 28
                                WHEN 5 THEN 27
                                WHEN 6 THEN 26
                                WHEN 7 THEN 25
                            END;
                    SELECT @EndDST = CAST(CAST(@DSTDate as varchar) + ' 02:00:00' as datetime);
                END;
        END;
 
    SELECT
        @ReturnDate =
            CASE
                --UTC to CT
                WHEN @Sign = 0
                    THEN
                        CASE
                            WHEN (@Datetimeoffset BETWEEN @BeginDST AND @EndDST) OR (@Time = 2)
                                --UTC to CDT
                                THEN
                                    SWITCHOFFSET(@Datetimeoffset, '-05:00')
                                --UTC to CST
                                ELSE
                                    SWITCHOFFSET(@Datetimeoffset, '-06:00')
                        END
                --CT to UTC
                ELSE
                    CASE
                        WHEN (@Datetimeoffset BETWEEN @BeginDST AND @EndDST) OR (@Time = 2)
                            --CDT to UTC
                            THEN
                                SWITCHOFFSET (@Datetimeoffset, '+05:00')
                            --CST to UTC
                            ELSE
                                SWITCHOFFSET (@Datetimeoffset, '+06:00')
                    END
            END;
 
    RETURN @ReturnDate;
END
GO
