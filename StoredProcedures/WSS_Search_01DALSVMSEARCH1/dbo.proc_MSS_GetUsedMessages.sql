/****** Object:  StoredProcedure [dbo].[proc_MSS_GetUsedMessages]    Script Date: 5/15/2018 12:13:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetUsedMessages
AS
SELECT ErrorId, ErrorMsg, hrresult, ErrorLevel from MSSCrawlErrorList with (nolock) where ErrorId in 
(SELECT ErrorId from MSSCrawlUrl with (nolock) union 
SELECT ErrorId from MSSCrawlDeletedUrl with (nolock))

GO
