/****** Object:  StoredProcedure [dbo].[md_VideoInsert]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE md_VideoInsert 
(
	@Title varchar (75),
	@Description varchar (1000),
	@Length varchar(10),
	@EventTitle varchar(75),
	@EventDate DateTime,
	@MovRefUploadDate DateTime


)
AS
INSERT INTO md_Videos
(
	Title,
	Description,
	Length,
	EventTitle,
	EventDate,
	MovRefUploadDate
)
VALUES
(
	@Title,
	@description,
	@Length,
	@EventTitle,
	@EventDate,
	@MovRefUploadDate
)

RETURN @@IDENTITY
GO
