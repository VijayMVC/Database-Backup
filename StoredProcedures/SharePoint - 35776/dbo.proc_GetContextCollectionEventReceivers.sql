/****** Object:  StoredProcedure [dbo].[proc_GetContextCollectionEventReceivers]    Script Date: 5/15/2018 12:12:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetContextCollectionEventReceivers(
    @SiteId uniqueidentifier,
    @ContextCollectionId uniqueidentifier,
    @ContextType uniqueidentifier = NULL)
AS
    SET NOCOUNT ON
    SELECT
        Id, Name, SiteId, WebId, HostId, HostType, ItemId, DirName, LeafName, Type, SequenceNumber, Assembly, Class, Data, Filter, SourceId, SourceType, Credential, ContextType, ContextEventType, ContextId, ContextObjectId, ContextCollectionId
    FROM
        EventReceivers
    WHERE
        SiteId = @SiteId AND
        ContextCollectionId = @ContextCollectionId AND
        (@ContextType IS NULL OR
            ContextType = @ContextType)
    ORDER BY
        SiteId, WebId, HostId, Type, HostType, SequenceNumber, Assembly

GO
