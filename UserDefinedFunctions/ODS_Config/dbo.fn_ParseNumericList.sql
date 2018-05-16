/****** Object:  UserDefinedFunction [dbo].[fn_ParseNumericList]    Script Date: 5/15/2018 12:15:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: fn_ParseNumericList
 * --------------------------------------------------------------
 * Created By: Jeremiah Nazaruk - 1/14/2013
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * Purpose : 
 *     - Parses a comma separated BIGINT or Int64 or long list
 * --------------------------------------------------------------
*/
CREATE FUNCTION [dbo].[fn_ParseNumericList]
(
   @List NVARCHAR(MAX)
)
RETURNS TABLE
WITH SCHEMABINDING AS
RETURN
  WITH E1(N)        AS ( SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1),
       E2(N)        AS (SELECT 1 FROM E1 a CROSS JOIN E1 b),
       E4(N)        AS (SELECT 1 FROM E2 a CROSS JOIN E2 b),
       E42(N)       AS (SELECT 1 FROM E4 a CROSS JOIN E2 b),
       cteTally(N)  AS (SELECT 0 
                        UNION ALL
                        SELECT TOP (DATALENGTH(ISNULL(@List, 1))) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) 
                          FROM E42),
       cteStart(N1) AS (SELECT t.N + 1
                          FROM cteTally t
                         WHERE (SUBSTRING(@List,t.N,1) = ',' OR t.N = 0)),
       substrings(Item) AS (SELECT SUBSTRING(@List, s.N1, ISNULL(NULLIF(CHARINDEX(',',@List,s.N1),0) - s.N1, 8000))
                            FROM cteStart s),
       numericIds(NumericId) AS (SELECT CONVERT(bigint, [Item])
                                 FROM substrings
                                 WHERE IsNumeric([Item] + '.0e0') = 1)

SELECT [NumericId] FROM [numericIds];                                

GO
