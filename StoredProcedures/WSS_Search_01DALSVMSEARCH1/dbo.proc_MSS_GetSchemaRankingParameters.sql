/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSchemaRankingParameters]    Script Date: 5/15/2018 12:13:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetSchemaRankingParameters
AS
select ParamName, IsString, strValue, fltValue from MSSSchemaParameters
    WHERE ParamName IN 
    ('k1', 'Kqir', 'Wqir', 'Kud', 'Wud', 'LanguagePrior', 'FileTypePriorHtml', 'FileTypePriorDoc', 
        'FileTypePriorPpt', 'FileTypePriorXls', 'FileTypePriorXml', 'FileTypePriorTxt', 'FileTypePriorListItems', 'FileTypePriorMessage'
    )

GO
