/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSPID]    Script Date: 5/15/2018 12:11:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetSPID
AS
    RETURN @@SPID

GO
