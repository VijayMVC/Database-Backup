/****** Object:  StoredProcedure [dbo].[usp_UpdateOwnersFromGoldmine]    Script Date: 5/15/2018 12:09:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/* 
Notes:
Delete each as needed 1st.
Director: GM Placement 8
		  Type 2006
FBC:	  GM Placement 7
		  Type 2005
Owner:    Placement (Owner number 1-6)
			Type 2001
			Ownership percentage must = 1.00 Add up all to find %

*/
CREATE PROC [dbo].[usp_UpdateOwnersFromGoldmine]
    (
      @intStoreNumber INT ,
      @Owner1 VARCHAR(50) ,
      @Owner1Percent FLOAT ,
      @Owner2 VARCHAR(50) = NULL ,
      @Owner2Percent FLOAT = 0 ,
      @Owner3 VARCHAR(50) = NULL ,
      @Owner3Percent FLOAT = 0 ,
      @Owner4 VARCHAR(50) = NULL ,
      @Owner4Percent FLOAT = 0 ,
      @Owner5 VARCHAR(50) = NULL ,
      @Owner5Percent FLOAT = 0 ,
      @Owner6 VARCHAR(50) = NULL ,
      @Owner6Percent FLOAT = 0 
    )
AS 
    DECLARE
        @AlpineStoreID INT ,
        @AlpinePersonID INT ,
        @LName VARCHAR(50) ,
        @FName VARCHAR(50) ,
        @Name VARCHAR(50) ,
        @Owner1ID INT ,
        @Owner2ID INT ,
        @Owner3ID VARCHAR(50) ,
        @Owner4ID VARCHAR(50) ,
        @Owner5ID VARCHAR(50) ,
        @Owner6ID VARCHAR(50) ,
        @OwnerSum DECIMAL

    DECLARE @temptable TABLE ( ReturnINT INT )
    DECLARE
        @AlpineType INT ,
        @StorePersonsLinkID INT
    SET @AlpineType = 2001
    SELECT
        @AlpineStoreID = StoreID
    FROM
        COR_STORES
    WHERE
        StoreNumber = @intStoreNumber
    PRINT @AlpineStoreID
    IF @AlpineStoreID IS NULL 
        BEGIN
            INSERT  INTO GoldmineToAlpineLog
                    ( Process ,
                      ErrorMessage 
                    )
            VALUES
                    ( 'GM2AlpineLoader' , -- Process - varchar(50)
                      'Bad Store Number ' + STR(@intStoreNumber)
                    -- ErrorMessage - varchar(200)
	                )
            RETURN 0
        END

    SELECT
        @OwnerSum = SUM(OwnershipPercent)
    FROM
        [COR_STORES_PERSONS_LINK]
    WHERE
        storeid = @AlpineStoreID

    IF @OwnerSum < .98
        OR @OwnerSum > 1.02 
        INSERT  INTO GoldmineToAlpineLog
                ( Process ,
                  ErrorMessage 
                    
                )
        VALUES
                ( 'GM2AlpineLoader' , -- Process - varchar(50)
                  'Bad Owner % in Store ' + STR(@intStoreNumber)
                  + ' attempting repair'  -- ErrorMessage - varchar(200)
	                
                )
		      
    DELETE FROM
        COR_STORES_PERSONS_LINK
    WHERE
        StoreID = @AlpineStoreID
        AND GoldMinePlacement < 7
  
--    IF @Owner1Percent > 0 
--        BEGIN
    EXEC usp_InsertOwnerID 
        @OwnerName = @Owner1
    SELECT
        @Owner1ID = dbo.udf_GetOwnerID(@Owner1)

		
    INSERT  INTO COR_STORES_PERSONS_LINK
            ( StoreID ,
              PersonID ,
              Status ,
              GoldMinePlacement ,
              OwnershipPercent ,
              AuditID 
            )
    VALUES
            ( @AlpineStoreID ,
              @Owner1ID ,
              1 ,
              0 , -- Goldmine Placement
              @Owner1Percent ,
              0
                         
                    
            )    
--        END
    IF @Owner2Percent > 0 
        BEGIN
            EXEC usp_InsertOwnerID 
                @OwnerName = @Owner2
            SELECT
                @Owner2ID = dbo.udf_GetOwnerID(@Owner2)

	
            INSERT  INTO COR_STORES_PERSONS_LINK
                    ( StoreID ,
                      PersonID ,
                      Status ,
                      GoldMinePlacement ,
                      OwnershipPercent ,
                      AuditID  
                      
                    )
            VALUES
                    ( @AlpineStoreID ,
                      @Owner2ID ,
                      1 ,
                      1 , -- Goldmine Placement
                      @Owner2Percent ,
                      0
                         
                    )   
        END
    IF @Owner3Percent <> 0 
        BEGIN
            EXEC usp_InsertOwnerID 
                @OwnerName = @Owner3
            SELECT
                @Owner3ID = dbo.udf_GetOwnerID(@Owner3)
            INSERT  INTO COR_STORES_PERSONS_LINK
                    ( StoreID ,
                      PersonID ,
                      Status ,
                      GoldMinePlacement ,
                      OwnershipPercent ,
                      AuditID  
                      
                    )
            VALUES
                    ( @AlpineStoreID ,
                      @Owner3ID ,
                      1 ,
                      2 , -- Goldmine Placement
                      @Owner3Percent ,
                      0
                         
                    )   
        END
    IF @Owner4Percent <> 0 
        BEGIN
            EXEC usp_InsertOwnerID 
                @OwnerName = @Owner4
            SELECT
                @Owner4ID = dbo.udf_GetOwnerID(@Owner4)
            INSERT  INTO COR_STORES_PERSONS_LINK
                    ( StoreID ,
                      PersonID ,
                      Status ,
                      GoldMinePlacement ,
                      OwnershipPercent ,
                      AuditID 
                      
                    )
            VALUES
                    ( @AlpineStoreID ,
                      @Owner4ID ,
                      1 ,
                      3 , -- Goldmine Placement
                      @Owner4Percent ,
                      0
                         
                    )   
        END
    IF @Owner5Percent <> 0 
        BEGIN
            EXEC usp_InsertOwnerID 
                @OwnerName = @Owner5
            SELECT
                @Owner5ID = dbo.udf_GetOwnerID(@Owner5)
            INSERT  INTO COR_STORES_PERSONS_LINK
                    ( StoreID ,
                      PersonID ,
                      Status ,
                      GoldMinePlacement ,
                      OwnershipPercent ,
                      AuditID 
                      
                    )
            VALUES
                    ( @AlpineStoreID ,
                      @Owner5ID ,
                      1 ,
                      4 , -- Goldmine Placement
                      @Owner5Percent ,
                      0
                         
                    )   
        END
    IF @Owner6Percent <> 0 
        BEGIN
            EXEC usp_InsertOwnerID 
                @OwnerName = @Owner6
            SELECT
                @Owner6ID = dbo.udf_GetOwnerID(@Owner6)
            INSERT  INTO COR_STORES_PERSONS_LINK
                    ( StoreID ,
                      PersonID ,
                      Status ,
                      GoldMinePlacement ,
                      OwnershipPercent ,
                      AuditID 
                      
                    )
            VALUES
                    ( @AlpineStoreID ,
                      @Owner6ID ,
                      1 ,
                      5 , -- Goldmine Placement
                      @Owner6Percent ,
                      0
                         
                    )   
        END
 
  --  SELECT
  --      @StorePersonsLinkID = StorePersonsLinkID
  --  FROM
  --      COR_STORES_PERSONS_LINK
  --  WHERE
  --      StoreID = @AlpineStoreID
  --      AND PersonID = @AlpinePersonID
  --      AND GoldMinePlacement = 0 -- Code for placement
		--AND OwnershipPercent = @Owner1Percent

    SELECT
        @OwnerSum = SUM(OwnershipPercent)
    FROM
        [COR_STORES_PERSONS_LINK]
    WHERE
        storeid = @AlpineStoreID
    
    IF @OwnerSum < .98
        OR @OwnerSum > 1.02 
        INSERT  INTO GoldmineToAlpineLog
                ( Process ,
                  ErrorMessage 
                )
        VALUES
                ( 'GM2AlpineLoader' , -- Process - varchar(50)
                  'Bad Owner % in Store ' + STR(@intStoreNumber)
                  + ' Not able to repair'  -- ErrorMessage - varchar(200)
	            )


 

GO
