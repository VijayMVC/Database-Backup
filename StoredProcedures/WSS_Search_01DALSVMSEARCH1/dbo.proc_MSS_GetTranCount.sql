/****** Object:  StoredProcedure [dbo].[proc_MSS_GetTranCount]    Script Date: 5/15/2018 12:13:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetTranCount
AS
    IF @@TRANCOUNT> 0
        RETURN 1
    RETURN 2

GO
