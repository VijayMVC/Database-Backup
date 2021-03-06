/****** Object:  View [dbo].[Constants]    Script Date: 5/15/2018 12:14:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.Constants
AS
SELECT TOP 100 PERCENT dbo.ConstDescGroup.ConstGroupId, dbo.ConstDescGroup.Description AS GroupDescription, dbo.ConstDesc.ConstId, 
               dbo.ConstDesc.Description AS ConstDescription
FROM  dbo.ConstDesc INNER JOIN
               dbo.ConstDescGroup ON dbo.ConstDesc.ConstGroupId = dbo.ConstDescGroup.ConstGroupId
ORDER BY dbo.ConstDescGroup.Description, dbo.ConstDesc.ConstId

GO
