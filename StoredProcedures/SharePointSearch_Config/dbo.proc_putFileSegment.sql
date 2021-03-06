/****** Object:  StoredProcedure [dbo].[proc_putFileSegment]    Script Date: 5/15/2018 12:13:07 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_putFileSegment
(
    @Pointer binary(16),
    @Offset int,
    @Bytes image
) AS
    SET NOCOUNT ON
    IF (TEXTVALID('Binaries.FileImage', @Pointer) = 1)
    BEGIN
        UPDATETEXT Binaries.FileImage @Pointer @Offset 0 @Bytes 
    END
    ELSE
    BEGIN
        RETURN 1
    END

GO
