/****** Object:  StoredProcedure [dbo].[proc_TranslateTempEid]    Script Date: 5/15/2018 12:13:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_TranslateTempEid(
    @EidTemp int,
    @EidBase int,
    @EidHome int,
    @@EidReal int OUTPUT)
AS
    IF @EidTemp > 0 AND @EidTemp < 1000
    BEGIN
        SET @@EidReal = @EidTemp + @EidBase
    END
    ELSE
    BEGIN
        SET @@EidReal = @EidTemp
    END
    IF @@EidReal = @EidHome
    BEGIN
        SET @@EidReal = 1000
    END

GO
