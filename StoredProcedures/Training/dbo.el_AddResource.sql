/****** Object:  StoredProcedure [dbo].[el_AddResource]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE el_AddResource 
(   @URL varchar(100),
    @Description varchar(100)   )


AS

INSERT INTO Resources
 ( URL,
   Description )
VALUES
 ( @URL,
   @Description )

GO
