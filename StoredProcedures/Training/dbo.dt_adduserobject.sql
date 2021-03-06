/****** Object:  StoredProcedure [dbo].[dt_adduserobject]    Script Date: 5/15/2018 12:13:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
**	Add an object to the dtproperties table
*/
create procedure dbo.dt_adduserobject
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity

GO
