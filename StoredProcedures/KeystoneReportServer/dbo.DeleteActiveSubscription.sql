/****** Object:  StoredProcedure [dbo].[DeleteActiveSubscription]    Script Date: 5/15/2018 12:09:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[DeleteActiveSubscription]
@ActiveID uniqueidentifier
AS

delete from ActiveSubscriptions where ActiveID = @ActiveID

GO
