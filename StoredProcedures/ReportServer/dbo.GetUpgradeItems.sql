/****** Object:  StoredProcedure [dbo].[GetUpgradeItems]    Script Date: 5/15/2018 12:11:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetUpgradeItems]
AS
SELECT 
    [Item],
    [Status]
FROM 
    [UpgradeInfo]

GO
