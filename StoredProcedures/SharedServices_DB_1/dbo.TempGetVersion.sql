/****** Object:  StoredProcedure [dbo].[TempGetVersion]    Script Date: 5/15/2018 12:11:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
/*****************************************************************************/

CREATE PROCEDURE dbo.TempGetVersion
    @ver      char(10) OUTPUT
AS
    SELECT @ver = "2"
    RETURN 0

GO
