/****** Object:  StoredProcedure [dbo].[proc_DeleteAllItemJunctionsVersions]    Script Date: 5/15/2018 12:12:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_DeleteAllItemJunctionsVersions(
    @ListId uniqueidentifier, 
    @ItemId int,
    @DeleteOp int,
    @DeleteTransactionId varbinary(16)
    )
AS
    SET NOCOUNT ON

GO
