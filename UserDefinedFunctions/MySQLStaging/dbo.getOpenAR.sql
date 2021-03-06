/****** Object:  UserDefinedFunction [dbo].[getOpenAR]    Script Date: 5/15/2018 12:15:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- From AccountsModel.php
-- function getOpenAR($accountId)
-- Description:	returns the OpenArBalance for an Account
-- =============================================
CREATE FUNCTION getOpenAR ( @accountId VARCHAR(32) )
RETURNS MONEY
AS 
    BEGIN
        DECLARE @total_ar MONEY
	
        SELECT
            @total_ar = SUM(amount_due + ISNULL(j.tax, 0) - amount_paid)
        FROM
            job_line_item_view j
            JOIN job_entities je ON j.job_id = je.job_id
                                    AND role_id = 1
        WHERE
            je.account_id = @accountId
            AND phase_id NOT IN ( 'c46653c8d3896d54367940f57f6228ec',
                                  'b368fef7f99e21ee4bba6760a0d92349' )
        GROUP BY
            je.account_id

        RETURN @total_ar

    END

GO
