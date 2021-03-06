/****** Object:  UserDefinedFunction [dbo].[udf_FM_LastOrderDate]    Script Date: 5/15/2018 12:14:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex Montminy
-- Create date: 1/25/2013
-- Description:   Calculates customer's Last Order Date For FastMail use
-- =============================================
CREATE FUNCTION [dbo].[udf_FM_LastOrderDate] ( @ContactID INT )
RETURNS DATETIME
AS 
    BEGIN
      -- Declare the return variable here
        DECLARE @LastOrderDate DATETIME;
      

      -- Add the T-SQL statements to compute the return value here
      
        SELECT
            @LastOrderDate = MAX(SaleDate)
    --, AC.zw_franchise_id,ContactID
        FROM
            dbo.TransHeader TH WITH (NOLOCK) 
            INNER JOIN AccountContact AC WITH (NOLOCK) ON AC.ID = TH.ContactID
                                            AND AC.zw_franchise_id = TH.zw_franchise_id

        WHERE
            ContactID = @ContactID
        GROUP BY
            AC.zw_franchise_id ,
            ContactID

        RETURN @LastOrderDate

    END

GO
