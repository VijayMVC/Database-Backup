/****** Object:  View [dbo].[syspolicy_policy_execution_history_details]    Script Date: 5/15/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[syspolicy_policy_execution_history_details]
AS
    SELECT 
        detail_id,
        history_id,
        target_query_expression,
        execution_date,
        result,
        result_detail,
        exception_message,
        exception
    FROM [dbo].[syspolicy_policy_execution_history_details_internal]

GO
