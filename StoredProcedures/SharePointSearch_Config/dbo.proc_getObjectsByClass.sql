/****** Object:  StoredProcedure [dbo].[proc_getObjectsByClass]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_getObjectsByClass
(
    @ClassId uniqueidentifier,
    @ParentId uniqueidentifier,
    @Name nvarchar(128)
) AS
    SET NOCOUNT ON
    SELECT
        Id
    FROM
        Objects WITH (NOLOCK)
    WHERE
        ((ClassId = @ClassId) AND
         (@ParentId IS NULL OR ParentId = @ParentId) AND
         (@Name IS NULL OR Name = @Name))
    IF (@@ROWCOUNT = 0)
    BEGIN
        IF NOT EXISTS (SELECT * FROM Classes WHERE Id = @ClassId)
        BEGIN
            RETURN 50105 
        END
    END
    RETURN 0 

GO
