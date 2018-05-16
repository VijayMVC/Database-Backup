/****** Object:  StoredProcedure [dbo].[proc_gettemplate]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_gettemplate
(
    @ObjId uniqueidentifier = NULL
) AS
    SELECT FileImage
    FROM dbo.Binaries
    WHERE
        (@ObjId IS NULL OR ObjectId = @ObjId)

GO
