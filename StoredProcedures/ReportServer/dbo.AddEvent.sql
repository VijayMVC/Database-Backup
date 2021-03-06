/****** Object:  StoredProcedure [dbo].[AddEvent]    Script Date: 5/15/2018 12:11:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[AddEvent] 
@EventType nvarchar (260),
@EventData nvarchar (260)
AS

insert into [Event] 
    ([EventID], [EventType], [EventData], [TimeEntered], [ProcessStart], [BatchID]) 
values
    (NewID(), @EventType, @EventData, GETUTCDATE(), NULL, NULL)

GO
