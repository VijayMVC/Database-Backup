/****** Object:  StoredProcedure [dbo].[proc_GetTargetOrderNumber]    Script Date: 5/15/2018 12:12:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetTargetOrderNumber(
    @SiteId                  uniqueidentifier,
    @WebId                   uniqueidentifier,
    @ListId                  uniqueidentifier,
    @BaseType                int,
    @ItemId                  int,
    @Position                int,
    @OrderNum                float OUTPUT,
    @CallDepth               int, 
    @RootFolderUrl           nvarchar(256) = NULL,
    @fMultipleMtgDataList    bit = 1, 
    @InstanceId              int = -3 )
AS
    IF @Position IS NULL
    BEGIN
        SET @OrderNum = @ItemId * 100.0 
        RETURN 0
    END
    ELSE
    BEGIN
        DECLARE @Items TABLE (ItemPosition int IDENTITY(1,1), Id int, ItemOrder float)
        DECLARE @NumItems int
        DECLARE @Ret int
        IF @BaseType = 1 
        BEGIN
            INSERT INTO @Items(Id, ItemOrder)
                SELECT
                    UserData.tp_ID,
                    UserData.tp_ItemOrder
                FROM
                    UserData
                INNER JOIN 
                    Docs
                ON
                    UserData.tp_ListId = Docs.ListId AND
                    UserData.tp_Id = Docs.DocLibRowId 
                WHERE
                    Docs.SiteId = @SiteId AND
                    Docs.DirName = @RootFolderUrl AND
                    UserData.tp_ListId = @ListId AND
                    UserData.tp_ItemOrder <> N'1.79E+308' AND
                    Docs.Type = 0 AND
                    UserData.tp_RowOrdinal = 0
                ORDER BY
                    UserData.tp_ItemOrder, UserData.tp_ID
            SET @NumItems = @@RowCount
        END 
        ELSE
        BEGIN
            IF @fMultipleMtgDataList <> 1 
                SET @InstanceId = NULL
            ELSE IF @InstanceId = -3
            BEGIN
                SELECT
                    @InstanceId = tp_InstanceID
                FROM
                    UserData
                WHERE
                    tp_ListId = @ListId AND
                    tp_ID = @ItemId AND
                    tp_RowOrdinal = 0
            END
            INSERT INTO @Items(Id, ItemOrder)
                SELECT
                    tp_ID,
                    tp_ItemOrder
                FROM
                    UserData
                WHERE
                    tp_ListId = @ListId AND
                    tp_RowOrdinal = 0 AND
                    ((@InstanceId IS NULL AND tp_InstanceID IS NULL) OR 
                        tp_InstanceID = @InstanceId) AND
                    tp_ItemOrder <> N'1.79E+308'
                ORDER BY
                    tp_ItemOrder, tp_ID
            SET @NumItems = @@RowCount
        END 
        DECLARE @PrevOrder float
        DECLARE @NextOrder float
        IF @Position > @NumItems
        BEGIN
            SELECT 
                @PrevOrder = ISNULL(MAX(ItemOrder), 100.0) 
            FROM 
                @Items 
            SELECT
                @NextOrder = tp_NextAvailableId * 100.0
            FROM
                Lists 
            WHERE
                tp_WebId = @WebId AND                           
                tp_ID = @ListId                            
        END
        ELSE IF @Position <= 1
        BEGIN
            SET @PrevOrder = 0;
            SELECT 
                @NextOrder = ISNULL(MIN(ItemOrder), 100.0) 
            FROM 
                @Items
        END
        ELSE
        BEGIN
            SELECT
                @PrevOrder = ItemOrder
            FROM
                @Items A
            WHERE
                A.ItemPosition = (@Position - 1) 
            SELECT
                @NextOrder = ItemOrder
            FROM
                @Items A
            WHERE
                A.ItemPosition = @Position
        END
        IF @PrevOrder IS NULL OR @NextOrder IS NULL
            RETURN 13
        SET @OrderNum = (@PrevOrder + @NextOrder) / 2
        IF @OrderNum = @PrevOrder OR @OrderNum = @NextOrder
        BEGIN
            IF @CallDepth > 1
                RETURN 13
            SET @CallDepth = @CallDepth + 1
            UPDATE
                UserData
            SET
                tp_ItemOrder = t.ItemPosition * 100.0
            FROM
                UserData 
            INNER JOIN
                @Items as t 
            ON
                UserData.tp_ID = t.Id
            WHERE
                UserData.tp_ListId = @ListId 
            EXEC @Ret = proc_GetTargetOrderNumber 
                @SiteId, 
                @WebId, 
                @ListId,
                @BaseType, 
                @ItemId, 
                @Position, 
                @OrderNum OUTPUT, 
                @CallDepth, 
                @RootFolderUrl, 
                @fMultipleMtgDataList, 
                @InstanceId  
            IF (@Ret <> 0)
            BEGIN
                RETURN @Ret
            END      
        END 
    END
    RETURN 0

GO
