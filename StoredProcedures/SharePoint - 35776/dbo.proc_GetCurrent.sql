/****** Object:  StoredProcedure [dbo].[proc_GetCurrent]    Script Date: 5/15/2018 12:12:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetCurrent
AS
    SET NOCOUNT ON
    DECLARE @ChangeNumberCurrent bigint
    SET @ChangeNumberCurrent = IDENT_CURRENT('EventCache')
    SELECT TOP 1 EventTime, Id FROM EventCache WHERE Id <= @ChangeNumberCurrent ORDER BY Id DESC    

GO
