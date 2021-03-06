/****** Object:  StoredProcedure [dbo].[proc_AUD_LogEvent]    Script Date: 5/15/2018 12:11:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AUD_LogEvent
(
    @Source tinyint,
    @ResourceId uniqueidentifier,
    @SubResourceId uniqueidentifier,
    @UserName nvarchar(40),
    @UserMachineName varchar(128),
    @UserIp varchar(20),
    @Operation tinyint,
    @Result tinyint,
    @EventTime smalldatetime,
    @RequestUrl varchar(4000)
) AS
    SET NOCOUNT ON

    INSERT INTO dbo.AUDEvent
    (
        Source,
        ResourceId,
        SubResourceId,
        UserName,
        UserMachineName,
        UserIp,
        Operation,
        Result,
        EventTime,
        RequestUrl
    )
    VALUES
    (
        @Source,
        @ResourceId,
        @SubResourceId,
        @UserName,
        @UserMachineName,
        @UserIp,
        @Operation,
        @Result,
        @EventTime,
        @RequestUrl
    )

GO
