/****** Object:  StoredProcedure [dbo].[proc_InsertJunction]    Script Date: 5/15/2018 12:12:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_InsertJunction(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @FieldId uniqueidentifier,
    @Id int,
    @Ordinal int,
    @Level tinyint = 1,
    @UIVersion int = 512,
    @IsCurrentVersion bit = 1,
    @CalculatedVersion int = 0,
    @DeleteTransactionId varbinary(16) = 0x
    )
AS
    SET NOCOUNT ON
    INSERT INTO
        AllUserDataJunctions (
            tp_SiteId,
            tp_DeleteTransactionId,
            tp_IsCurrentVersion,
            tp_DirName,
            tp_LeafName,
            tp_FieldId,
            tp_CalculatedVersion,
            tp_Level,
            tp_UIVersion,
            tp_Id,
            tp_Ordinal
            )
        VALUES (
            @SiteId,
            @DeleteTransactionId,
            @IsCurrentVersion,
            @DirName,
            @LeafName,
            @FieldId,
            @CalculatedVersion,
            @Level,
            @UIVersion,
            @Id,
            @Ordinal
            )    

GO
