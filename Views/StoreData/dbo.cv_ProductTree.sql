/****** Object:  View [dbo].[cv_ProductTree]    Script Date: 5/15/2018 12:14:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW cv_ProductTree AS SELECT 
  ROW_NUMBER() Over(ORDER BY FormattedPath) AS Row,
  SPACE(4 * (Depth-1)) + NodeName AS FormattedName,
  *
FROM
    ( SELECT 
          Coalesce(Product.ID,          Level5.ID,          Level4.ID,          Level3.ID,          Level2.ID,          Level1.ID         ) AS NodeID,
          Coalesce(Product.ClassTypeID, Level5.ClassTypeID, Level4.ClassTypeID, Level3.ClassTypeID, Level2.ClassTypeID, Level1.ClassTypeID) AS NodeClassTypeID,
          Coalesce(Product.IsActive,    Level5.IsActive,     Level4.IsActive,    Level3.IsActive,    Level2.IsActive,    Level1.IsActive   ) AS IsActive,
          IsCategory,
          coalesce(Level5.ID - Level5.ID + 5, Level4.ID - Level4.ID + 4, Level3.ID - Level3.ID + 3, Level2.ID - Level2.ID + 2, Level1.ID - Level1.ID + 1, 0) 
           + coalesce(Product.ID - Product.ID + 1, 0) AS Depth,  -- Depth is equal to the tree level + 1 for the product
 
          Coalesce(Product.ItemName,    Level5.ElementName, Level4.ElementName, Level3.ElementName, Level2.ElementName, Level1.ElementName) AS NodeName,
          Coalesce(Product.CategoryID,  Level5.ParentID,     Level4.ParentID,    Level3.ParentID,    Level2.ParentID,    Level1.ParentID   ) AS ParentID,
          Coalesce(Product.CategoryClassTypeID, Level5.ParentClassTypeID, Level4.ParentClassTypeID, Level3.ParentClassTypeID, Level2.ParentClassTypeID, Level1.ParentClassTypeID) AS ParentClassTypeID,
 
          Level1.ElementName AS LevelName,
          Level2.ElementName AS Level2Name,
          Level3.ElementName AS Level3Name,
          Level4.ElementName AS Level4Name,
          Level5.ElementName AS Level5Name,
          Product.ItemName AS ProductCode,
 
          Level1.ID AS Level1ID,
          Level2.ID AS Level2ID,
          Level3.ID AS Level3ID,
          Level4.ID AS Level4ID,
          Level5.ID AS Level5ID,
          Product.ID AS ProductID,
 
          coalesce(Level1.ElementName + '\', '') +
            coalesce(Level2.ElementName + '\', '') + 
            coalesce(Level3.ElementName + '\', '') +
            coalesce(Level4.ElementName + '\', '') +
            coalesce(Level5.ElementName + '\', '') +
            coalesce(' '+Product.ItemName, '')
            as FormattedPath
 
        from PricingElement as Level1
        JOIN (SELECT 1 AS IsLevel1 UNION SELECT 0) Temp1 ON 1=1 -- create two rows for each of the above
 
        left join PricingElement as Level2 on Level2.ParentID = Level1.ID and Level2.ClassTypeID = 12020 and IsLevel1 = 0
        JOIN (SELECT 1 AS IsLevel2 UNION SELECT 0) Temp2 ON 1=1 
 
        left join PricingElement as Level3 on Level3.ParentID = Level2.ID and Level3.ClassTypeID = 12020 and IsLevel1 = 0 and IsLevel2 = 0
        JOIN (SELECT 1 AS IsLevel3 UNION SELECT 0) Temp3 ON 1=1 
 
        left join PricingElement as Level4 on Level4.ParentID = Level3.ID and Level4.ClassTypeID = 12020 and IsLevel1 = 0 and IsLevel2 = 0 and IsLevel3 = 0
        JOIN (SELECT 1 AS IsLevel4 UNION SELECT 0) Temp4 ON 1=1 
 
        left join PricingElement as Level5 on Level5.ParentID = Level4.ID and Level5.ClassTypeID = 12020 and IsLevel1 = 0 and IsLevel2 = 0 and IsLevel3 = 0 and IsLevel4 = 0
        JOIN (SELECT 1 AS IsLevel5 UNION SELECT 0) Temp5 ON 1=1 
 
        JOIN (SELECT 1 AS IsCategory UNION SELECT 0) Temp6 ON 1=1 
 
        left join CustomerGoodsItem as Product on Product.CategoryID = coalesce(Level5.ID, Level4.ID, Level3.ID, Level2.ID, Level1.ID) 
                                          and Product.ID > 0 
                                          and IsCategory = 0
 
 
        where Level1.ClassTypeID = 12020 and Level1.ParentID IS NULL and Level1.ID > 0
              and (IsLevel1 + IsLevel2 + IsLevel3 +IsLevel4 + IsLevel5 = 1)
 
              and (   (IsLevel1=1 and Level1.ID is not NULL and Level2.ID is NULL)
                   or (IsLevel2=1 and Level2.ID is not null and Level3.ID is NULL)
                   or (IsLevel3=1 and Level3.ID is not null and Level4.ID is NULL)
                   or (IsLevel4=1 and Level4.ID is not null and Level5.ID is NULL)
                   or (IsLevel5=1 and Level5.ID is not null )
                  ) 
 
              and (   (IsCategory = 1 and Product.ID IS NULL)
                   or (IsCategory = 0 and Product.ID IS NOT NULL)
                   )
 
    ) ProductTree

GO
