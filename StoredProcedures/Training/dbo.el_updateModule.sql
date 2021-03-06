/****** Object:  StoredProcedure [dbo].[el_updateModule]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE el_updateModule

(	@Title varchar(50),
	@Description varchar(1000),
	@Duration varchar(20),
	@Audience varchar(25),
	@Download bit,
	@Email varchar(50),
	@Header varchar(50),
	@ID int, 
	@CurrentModule varchar(50)
)

AS

UPDATE eLearningModules
	SET Title = @Title,
	Description = @Description,
	Duration = @Duration,
	Audience = @Audience,
	Download = @Download,
	Email = @Email,
	Header = @Header,
	ModuleName = @CurrentModule
WHERE ID = @ID
GO
