/****** Object:  StoredProcedure [dbo].[usp_UpdateFBCDirFromGoldmine]    Script Date: 5/15/2018 12:09:16 PM ******/
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
CREATE PROC [dbo].[usp_UpdateFBCDirFromGoldmine]
    @intStoreNumber INT ,
    @varcharType VARCHAR(3) ,
    @Name VARCHAR(50)
AS 
    DECLARE
        @AlpineStoreID INT ,
        @AlpinePersonID INT ,
        @LName VARCHAR(50) ,
        @FName VARCHAR(50) 
    DECLARE @temptable TABLE ( ReturnINT INT )
    DECLARE
        @AlpineType INT ,
        @StorePersonsLinkID INT
    SET @Name = RTRIM(ISNULL(@Name, ''))
    SELECT
        @FName = CASE WHEN NOT ( @Name = ''
                                 OR @Name LIKE '%Director%'
                                 OR @Name LIKE '%Training%'
                                 OR @Name LIKE '%FBC%'
                                 OR @Name LIKE '%TBD%'
                               )
                      THEN SUBSTRING(ISNULL(@Name, ''), 1,
                                     CHARINDEX(' ', ISNULL(@Name, '')) - 1)
                      ELSE 'TBD'
                 END ,
        @LName = CASE WHEN NOT ( @Name = ''
                                 OR @Name LIKE '%Director%'
                                 OR @Name LIKE '%Training%'
                                 OR @Name LIKE '%FBC%'
                                 OR @Name LIKE '%TBD%'
                               )
                      THEN SUBSTRING(ISNULL(@Name, ''),
                                     CHARINDEX(' ', ISNULL(@Name, '')) + 1,
                                     LEN(ISNULL(@Name, '')))
                      ELSE 'TBD'
                 END 
    SELECT
        @AlpineType = CASE @varcharType
                        WHEN 'FBC' THEN 2005
                        WHEN 'DIR' THEN 2006
                        ELSE 2001
                      END 
    SELECT
        @AlpineStoreID = StoreID
    FROM
        COR_STORES
    WHERE
        StoreNumber = @intStoreNumber
    -- Add new preson as needed
    SELECT
        @AlpinePersonID = PersonID
    FROM
        COR_PERSONS
    WHERE
        FirstName = @FName
        AND LastName = @LName
		AND PersonType = @AlpineType
    IF @AlpinePersonID IS NULL 
        BEGIN
            INSERT  INTO dbo.COR_PERSONS
                    ( FirstName ,
                      LastName ,
                      PersonType ,
                      AuditID 
                    )
            OUTPUT  INSERTED.PersonID
                    INTO @temptable
            VALUES
                    ( @FName ,
                      @LName ,
                      @AlpineType ,
                      0
                    ) 
            SELECT
                @AlpinePersonID = ReturnINT
            FROM
                @temptable
        END  
	
    IF @AlpineType = 2005
        OR @AlpineType = 2006
	-- FBC or DIrector
        BEGIN 
            SELECT
                @StorePersonsLinkID = StorePersonsLinkID
            FROM
                COR_STORES_PERSONS_LINK
            WHERE
                StoreID = @AlpineStoreID
                AND PersonID = @AlpinePersonID
                AND GoldMinePlacement = ( @AlpineType - 1998 ) -- Code for placement
            IF @StorePersonsLinkID IS NULL 
                BEGIN
                    DELETE FROM
                        COR_STORES_PERSONS_LINK
                    WHERE
                        StoreID = @AlpineStoreID
                        AND GoldMinePlacement = ( @AlpineType - 1998 ) -- Code for placement
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
                              @AlpinePersonID ,
                              1 ,
                              ( @AlpineType - 1998 ) ,
                              0 ,
                              0
                            )    
                END 
        END 
 



GO
