/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteFromSession]    Script Date: 5/15/2018 12:13:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteFromSession
                    @nCatalogId SMALLINT,
                    @docid int
AS
    DECLARE @ret INT
    SET @ret = 0
    EXEC @ret = proc_MSS_OnDocDelete @nCatalogId, @docid
    RETURN @ret

GO
