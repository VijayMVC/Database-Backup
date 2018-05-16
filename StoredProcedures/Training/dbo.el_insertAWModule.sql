/****** Object:  StoredProcedure [dbo].[el_insertAWModule]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE el_insertAWModule

(	@Title varchar(50),
	@Description varchar(1000),
	@Duration varchar(20),
	@Audience varchar(25),
	@Path varchar(50),
	@Email varchar(50),
	@Header varchar(50)
)

AS

 INSERT INTO eLearningModules
	(Title,
	Description,
	Duration,
	Audience,
	Email,
	AW,
	ModuleName,
	Download,
	Header)
	VALUES
	(@Title,
	@Description,
	@Duration,
	@Audience,
	@Email,
	1,
	@Path,
	0,
	@Header)

GO
