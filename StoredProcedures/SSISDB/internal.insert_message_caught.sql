/****** Object:  StoredProcedure [internal].[insert_message_caught]    Script Date: 5/15/2018 12:13:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE [internal].[insert_message_caught] 
    @operation_id       BIGINT
AS
SET NOCOUNT ON

    
    IF ERROR_NUMBER() IS NULL
        RETURN;
    IF @operation_id IS NULL
        RETURN;

    DECLARE 
        @error_severity   INT,
        @message_text    [internal].[adt_message_text];
    SELECT 
        @error_severity = ERROR_SEVERITY(),
        @message_text = ERROR_MESSAGE();

    
    DECLARE @message_type       smallint;
    SET @message_type = 
        CASE  
            WHEN @error_severity > 10 THEN 120 
            ELSE 110 
        END
        
    INSERT INTO [internal].[operation_messages] (
        [operation_id],
        [message_type],
        [message_time],
        [message_source_type],
        [message]
        )
    VALUES (
        @operation_id,
        @message_type,
        SYSDATETIMEOFFSET(),
        10,
        @message_text
        );


GO
