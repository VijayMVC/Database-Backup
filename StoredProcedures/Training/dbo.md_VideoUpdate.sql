/****** Object:  StoredProcedure [dbo].[md_VideoUpdate]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE md_VideoUpdate
(
	@videoID int,
	@title varchar (75),
	@description varchar (1000),
             @length varchar(10),
	@eventTitle varchar(75),
	@eventDate DateTime,
	@movRefUploadDate DateTime
)
 AS

UPDATE
	 md_videos
SET
	title = @title,
	description = @description,
	length = @length,
             eventTitle = @eventTitle,
	eventDate = @eventDate,
	movRefUploadDate = @movRefUploadDate

WHERE
	videoID = @videoID
GO
