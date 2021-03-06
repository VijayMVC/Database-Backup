/****** Object:  StoredProcedure [dbo].[usp_TC_AdvancedLookup]    Script Date: 5/15/2018 12:09:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Josh Steward>
-- Create date: <11/7/2014>
-- Description:	<Center central style lookup for Tasker>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TC_AdvancedLookup]
	-- Add the parameters for the stored procedure here
    @WebNumber INT ,
    @StoreNumber BIGINT ,
    @FirstName VARCHAR(254) ,
    @LastName VARCHAR(254) ,
    @CityName VARCHAR(128) ,
    @StateName VARCHAR(50) ,
    @CountryName VARCHAR(50) ,
    @Phone VARCHAR(25)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

        SELECT
            s.WebNumber ,
            s.StoreNumber ,
            o.OwnerName AS PersonName ,
            s.CityName ,
            s.StateName ,
            s.CountryName,
            s.Phone ,
            s.Email,
            s.FBC
        FROM
            vw_Store s WITH ( NOLOCK )
            INNER JOIN Store.OwnerDim o WITH ( NOLOCK ) ON s.StoreNumber = o.StoreNumber
        WHERE
            --s.OpenStatus NOT LIKE 'closed'
            1 = CASE WHEN ( @WebNumber = '') THEN 1
                         ELSE CASE WHEN ( s.WebNumber = @WebNumber ) THEN 1
                                   ELSE 0
                              END
                    END
            AND 1 = CASE WHEN ( @StoreNumber = '' ) THEN 1
                         ELSE CASE WHEN ( s.StoreNumber = @StoreNumber )
                                   THEN 1
                                   ELSE 0
                              END
                    END
            AND 1 = CASE WHEN ( @FirstName = '' ) THEN 1
                         ELSE CASE WHEN ( o.OwnerName LIKE '%' + @FirstName
                                          + '%' ) THEN 1
                                   ELSE 0
                              END
                    END
            AND 1 = CASE WHEN ( @LastName = '' ) THEN 1
                         ELSE CASE WHEN ( o.OwnerName LIKE '%' + @LastName + '%' )
                                   THEN 1
                                   ELSE 0
                              END
                    END
            AND 1 = CASE WHEN ( @CityName = '' ) THEN 1
                         ELSE CASE WHEN ( s.CityName LIKE '%' + @CityName
                                          + '%' ) THEN 1
                                   ELSE 0
                              END
                    END
            AND 1 = CASE WHEN ( @StateName = '' ) THEN 1
                         ELSE CASE WHEN ( s.StateName = @StateName ) THEN 1
                                   ELSE 0
                              END
                    END
            AND 1 = CASE WHEN ( @CountryName = '' ) THEN 1
                         ELSE CASE WHEN ( s.CountryName = @CountryName ) THEN 1
                                   ELSE 0
                              END
                    END
            AND 1 = CASE WHEN ( @Phone = '' ) THEN 1
                         ELSE CASE WHEN ( CAST(REPLACE(REPLACE(REPLACE(s.Phone,
                                                              '(', ''), ')',
                                                              ''), '-', '') AS VARCHAR) LIKE '%'
                                          + @Phone +'%' ) THEN 1
                                   ELSE 0
                              END
                    END
        ORDER BY
            o.OwnerName
    END

GO
