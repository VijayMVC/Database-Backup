/****** Object:  StoredProcedure [dbo].[proc_ANL_GetNextShadowUserId]    Script Date: 5/15/2018 12:11:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

--
-- Returns the next valid UserId in ANLShadowUser
-- 
CREATE PROCEDURE dbo.proc_ANL_GetNextShadowUserId( @NextId INT OUTPUT )
AS

SELECT @NextId = ISNULL(MAX(UserId)+1,1) FROM ANLShadowUser


GO
