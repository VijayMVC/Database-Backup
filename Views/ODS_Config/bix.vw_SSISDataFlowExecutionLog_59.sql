/****** Object:  View [bix].[vw_SSISDataFlowExecutionLog_59]    Script Date: 5/15/2018 12:14:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [bix].[vw_SSISDataFlowExecutionLog_59]
AS
(
    SELECT 
        [id],
        [event],
        [computer],
        [operator],
        [source],
        [sourceid],
        [executionid],
        [starttime],
        [endtime],
        [datacode],
        [databytes],
        [message]
    FROM [dbo].[SSISDataFlowExecutionLog]
)
GO
