/****** Object:  StoredProcedure [dbo].[sp_sysutility_ucp_create]    Script Date: 5/15/2018 12:10:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 
CREATE PROCEDURE [dbo].[sp_sysutility_ucp_create]
WITH EXECUTE AS OWNER
AS
BEGIN
    /* Validate that the UCP can be created on the local instance. */
    EXEC [dbo].[sp_sysutility_ucp_validate_prerequisites]
END 

GO
