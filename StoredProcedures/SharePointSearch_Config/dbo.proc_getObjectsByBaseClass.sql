/****** Object:  StoredProcedure [dbo].[proc_getObjectsByBaseClass]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_getObjectsByBaseClass
(
    @BaseClassId uniqueidentifier,
    @ParentId uniqueidentifier
) AS
    SET NOCOUNT ON
    DECLARE @SubClasses TABLE (SubClassId uniqueidentifier PRIMARY KEY)
    INSERT INTO @SubClasses (SubClassId) VALUES (@BaseClassId)
    WHILE (@@ROWCOUNT <> 0)
    BEGIN
        INSERT INTO
            @SubClasses
        SELECT
            Id
        FROM
            Classes
        INNER JOIN
            @SubClasses
        ON
            BaseClassId = SubClassId
        WHERE 
            (SELECT COUNT(*) FROM @SubClasses WHERE SubClassId = Id) = 0
    END
    SELECT
        Id
    FROM
        Objects
    INNER JOIN 
        @SubClasses 
    ON 
        ClassId = SubClassId
    WHERE
        @ParentId = NULL OR
        Objects.ParentId = @ParentId
    RETURN 0 

GO
