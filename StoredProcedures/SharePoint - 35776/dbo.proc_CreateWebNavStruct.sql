/****** Object:  StoredProcedure [dbo].[proc_CreateWebNavStruct]    Script Date: 5/15/2018 12:11:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CreateWebNavStruct(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier)
AS
    SET NOCOUNT ON
    INSERT INTO NavNodes (
        SiteId,
        WebId,
        Eid,
        EidParent,
        NumChildren,
        RankChild,
        ElementType,
        Url,
        DocId,
        Name,
        DateLastModified,
        NodeMetainfo,
        NonNavPage,
        NavSequence,
        ChildOfSequence)
    VALUES (
        @SiteId,
        @WebId,
        0, 
        -1, 
        0, 
        0, 
        0, 
        N'', 
        NULL, 
        N'', 
        dbo.fn_RoundDateToNearestSecond(GETUTCDATE()), 
        NULL, 
        0, 
        0, 
        0) 

GO
