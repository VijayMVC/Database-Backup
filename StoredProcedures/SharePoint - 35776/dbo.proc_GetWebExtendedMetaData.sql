/****** Object:  StoredProcedure [dbo].[proc_GetWebExtendedMetaData]    Script Date: 5/15/2018 12:12:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebExtendedMetaData(
    @WebId  uniqueidentifier)
AS
    SELECT
        Webs.TimeCreated,
        (SELECT MAX(tp_Modified) FROM Lists WITH (NOLOCK) WHERE Lists.tp_WebId = Webs.Id)
    FROM
        Webs
    WHERE
        Id = @WebId

GO
