/****** Object:  StoredProcedure [dbo].[proc_FetchWelcomeNames]    Script Date: 5/15/2018 12:12:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_FetchWelcomeNames
AS
    SET NOCOUNT ON
    SELECT 
        LeafName
    FROM
        WelcomeNames
    ORDER BY
        Rank

GO
