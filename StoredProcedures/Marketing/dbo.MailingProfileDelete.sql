/****** Object:  StoredProcedure [dbo].[MailingProfileDelete]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MailingProfileDelete
(
	@MalPId int
)
AS
	DELETE FROM MailingProfile WHERE MalPId=@MalPId;
RETURN @@Rowcount;


GO
