/****** Object:  StoredProcedure [dbo].[proc_MSS_SetBigConfigurationProperty]    Script Date: 5/15/2018 12:13:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetBigConfigurationProperty
(
    @Name nvarchar(64),
    @Value image,
    @Version int  
)
AS
BEGIN TRANSACTION
IF EXISTS (SELECT * FROM dbo.MSSConfiguration Where @Name = Name AND @Version != Value AND @Version-1 != Value )
BEGIN
    ROLLBACK TRANSACTION
    return 100
END
ELSE
BEGIN
    DELETE 
        dbo.MSSConfiguration
    WHERE
        Name = @Name
    INSERT INTO
        dbo.MSSConfiguration ( Name, Value, BigValue, LastModified )
    VALUES
        ( @Name, @Version, @Value, GETDATE() )
COMMIT TRANSACTION
END
return 0

GO
