/****** Object:  StoredProcedure [dbo].[proc_dropObject]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_dropObject
(
    @Id uniqueidentifier
) AS
    SET NOCOUNT ON
    BEGIN TRAN
    DECLARE @LastUpdateVersion rowversion
    SELECT 
        @LastUpdateVersion = Version 
    FROM
        LastUpdate WITH (updlock)
    WHERE
        Value = 0
    DELETE 
    FROM
        Objects
    WHERE
        Id 
    IN
        (SELECT ChildId FROM fn_GetChildren(@Id))
    IF (@@ROWCOUNT = 0)
    BEGIN
	ROLLBACK TRAN
        RETURN 1 
    END
    COMMIT TRAN
    RETURN 0 

GO
