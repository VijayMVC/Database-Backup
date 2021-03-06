/****** Object:  StoredProcedure [dbo].[proc_AddAuditEntryUrl]    Script Date: 5/15/2018 12:11:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddAuditEntryUrl(
    @SiteId             uniqueidentifier,
    @DirName            nvarchar(256),
    @LeafName           nvarchar(128),
    @ItemType           smallint,
    @UserId             int,
    @MachineName        nvarchar(128) = NULL,
    @MachineIp          nvarchar(20) = NULL,
    @Location           nvarchar(260) = NULL,
    @LocationType       tinyint = NULL,
    @Occurred           datetime,
    @Event              int,
    @EventName          nvarchar(128) = NULL,
    @EventSource        tinyint,
    @SourceName         nvarchar(256) = NULL,
    @EventData          ntext = NULL,
    @EventFlag          int = 0)
AS
    SET NOCOUNT ON
    DECLARE @Id uniqueidentifier
    DECLARE @AuditFlags int
    DECLARE @InheritAuditFlags int
    DECLARE @GlobalAuditMask int
    DECLARE @TrueAuditMask int
    EXEC proc_GetAuditMaskOutput 
                @ItemType, 
                @SiteId, 
                @DirName, 
                @LeafName, 
                @Id OUTPUT, 
                @AuditFlags OUTPUT, 
                @InheritAuditFlags OUTPUT,
                @GlobalAuditMask OUTPUT
    SET @TrueAuditMask = 0 
    IF NOT @AuditFlags IS NULL
        SET @TrueAuditMask = @TrueAuditMask | @AuditFlags 
    IF NOT @InheritAuditFlags IS NULL
        SET @TrueAuditMask = @TrueAuditMask | @InheritAuditFlags 
    IF NOT @GlobalAuditMask IS NULL
        SET @TrueAuditMask = @TrueAuditMask | @GlobalAuditMask
    IF ((@EventFlag = 0) OR ((@TrueAuditMask & @EventFlag) <> 0))    
        BEGIN
            DECLARE @NewLocation nvarchar(260)
            EXEC proc_GetGoodItemLocation 
                @ItemType,
                @SiteId,
                @DirName,
                @LeafName,
                @Location,
                @NewLocation OUTPUT
            EXEC proc_AddAuditEntry
                @SiteId,
                @Id,
                @ItemType,
                @UserId,
                @MachineName,
                @MachineIp,
                @NewLocation,
                @LocationType,
                @Occurred,
                @Event,
                @EventName,
                @EventSource,
                @SourceName,
                @EventData
        END
     RETURN 0

GO
