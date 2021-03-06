/****** Object:  StoredProcedure [dbo].[proc_MSS_SetConfigurationProperty]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetConfigurationProperty
(
    @Name nvarchar(64),
    @Value sql_variant  
)
AS
BEGIN TRANSACTION
    DELETE 
        dbo.MSSConfiguration
    WHERE
        Name = @Name

    INSERT INTO
        dbo.MSSConfiguration ( Name, Value, LastModified )
    VALUES
        ( @Name, @Value, GETDATE() )
COMMIT TRANSACTION

GO
