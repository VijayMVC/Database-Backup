/****** Object:  StoredProcedure [dbo].[GetDataSourceForUpgrade]    Script Date: 5/15/2018 12:09:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetDataSourceForUpgrade]
@CurrentVersion int
AS
SELECT 
    [DSID]
FROM 
    [DataSource]
WHERE
    [Version] != @CurrentVersion

GO
