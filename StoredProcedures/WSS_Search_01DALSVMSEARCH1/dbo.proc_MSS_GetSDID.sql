/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSDID]    Script Date: 5/15/2018 12:13:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetSDID
        @sdCheckSum INT
AS
    SELECT SDID, SD FROM MSSSecurityDescriptors WHERE SDHash = @sdCheckSum
    RETURN
    SET ANSI_NULLS ON

GO
