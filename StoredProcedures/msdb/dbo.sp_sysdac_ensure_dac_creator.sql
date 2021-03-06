/****** Object:  StoredProcedure [dbo].[sp_sysdac_ensure_dac_creator]    Script Date: 5/15/2018 12:10:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.sp_sysdac_ensure_dac_creator
as
BEGIN
    -- only users that can create a dac can add parts
    IF (dbo.fn_sysdac_is_dac_creator() != 1)
    BEGIN
        RAISERROR(36010, -1, -1);
        RETURN(1); -- failure
    END
END

GO
