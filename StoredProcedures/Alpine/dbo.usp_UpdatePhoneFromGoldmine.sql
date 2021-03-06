/****** Object:  StoredProcedure [dbo].[usp_UpdatePhoneFromGoldmine]    Script Date: 5/15/2018 12:09:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/* 
Notes:


*/
CREATE PROC [dbo].[usp_UpdatePhoneFromGoldmine]
    @intStoreNumber INT ,
    @Phone VARCHAR(50)
AS
    DECLARE
        @AlpineStoreID INT ,
        @AlpinePhoneID INT
    DECLARE @temptable TABLE ( ReturnINT INT )
    DECLARE
        @AlpineType INT ,
        @StorePhoneLinkID INT
    SELECT
        @AlpineStoreID = StoreID
    FROM
        COR_STORES
    WHERE
        StoreNumber = @intStoreNumber
    -- Add new phone as needed
    SELECT
        @AlpinePhoneID = PhoneID
    FROM
        COR_PHONES
    WHERE
        PhoneNumber = @Phone
    IF @AlpinePhoneID IS NULL
        BEGIN
            INSERT  INTO dbo.COR_PHONES
                    ( PhoneNumber ,
                      PhoneType ,
					  Extension,
                      AuditID ,
                      Status ,
                      GoldMinePlacement
                    )
            OUTPUT  INSERTED.PhoneID
                    INTO @temptable
            VALUES
                    ( @Phone , -- PhoneNumber - varchar(50)
                      1005 , -- PhoneType - bigint
					  '', -- Ext
                      0 , -- AuditID - bigint
                      1 , -- Status - bigint
                      1  -- GoldMinePlacement - bigint
                    )
            SELECT
                @AlpinePhoneID = ReturnINT
            FROM
                @temptable

            INSERT  INTO dbo.COR_STORES_PHONES_LINK
                    ( StoreID, PhoneID )
            VALUES
                    ( @AlpineStoreID, -- StoreID - bigint
                      @AlpinePhoneID  -- PhoneID - bigint
                      )
        END  

 



GO
