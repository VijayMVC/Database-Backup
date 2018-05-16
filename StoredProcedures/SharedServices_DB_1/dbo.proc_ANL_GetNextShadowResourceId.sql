/****** Object:  StoredProcedure [dbo].[proc_ANL_GetNextShadowResourceId]    Script Date: 5/15/2018 12:11:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

--
-- Returns the next valid ResourceId in ANLShadowResource
-- 
CREATE PROCEDURE dbo.proc_ANL_GetNextShadowResourceId( @NextId INT OUTPUT )
AS

SELECT @NextId = ISNULL(MAX(ResourceId)+1,1) FROM ANLShadowResource


GO
