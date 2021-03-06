/****** Object:  StoredProcedure [dbo].[proc_GetItemCountPerInstance]    Script Date: 5/15/2018 12:12:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetItemCountPerInstance(
    @ListID uniqueidentifier,
    @InstanceID int,
    @@ItemCount int output)
AS
    SET NOCOUNT ON
    SELECT 
        @@ItemCount = COUNT(*)
    FROM
        UserData
    WHERE
        tp_ListID = @ListID AND tp_RowOrdinal = 0 AND 
        (tp_InstanceID IS NULL OR tp_InstanceID = @InstanceID)

GO
