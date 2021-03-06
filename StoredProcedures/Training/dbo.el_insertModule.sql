/****** Object:  StoredProcedure [dbo].[el_insertModule]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE el_insertModule

(	@Title varchar(50),
	@Description varchar(1000),
	@Duration varchar(20),
	@Audience varchar(25),
	@Download bit,
	@Email varchar(50),
	@Header varchar(50)
)

AS

INSERT INTO eLearningModules
	(Title, 	
	Description,
	Duration,
	Audience,
	Download,
	Email,
	AW, 
	Header)
	VALUES
	(@Title, 
	@Description, 
	@Duration, 
	@Audience, 
	@Download, 
	@Email, 
	0, 
	@Header)

GO
