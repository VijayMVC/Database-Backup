/****** Object:  View [dbo].[Web_Repl_view]    Script Date: 5/15/2018 12:14:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE VIEW [dbo].[Web_Repl_view]
AS
SELECT c1.KEY1, c2.UWEBNUMBER, c1.ADDRESS1, 
    c1.ADDRESS2, c1.CITY, c1.STATE, c1.ZIP, c1.COUNTRY, 
    c1.PHONE1, c1.FAX, c2.uemc, c1.KEY5, c3.NOTES, c4.LAT, 
    c4.LONG, t1.dst, t1.tz
FROM CONTACT1 c1 INNER JOIN
    CONTACT2 c2 ON (c1.ACCOUNTNO = c2.ACCOUNTNO) LEFT 
    JOIN
    MQ_Geo_Data c4 ON (c1.key1 = c4.store_num) LEFT JOIN
    CONTSUPP c3 ON (c1.ACCOUNTNO = c3.ACCOUNTNO AND 
    c3.rectype = 'P' AND c3.contact LIKE '%YP%') LEFT JOIN
    timezone t1 ON (c1.zip + c1.city = t1.zip + t1.city)
WHERE ISNUMERIC(c1.U_KEY1) = 1 AND LEFT(c1.U_KEY4, 6) 
    <> 'CLOSED' AND UPPER(c2.USTORETYPE) 
    NOT IN ('MASTER', 'CLOSED')



GO
