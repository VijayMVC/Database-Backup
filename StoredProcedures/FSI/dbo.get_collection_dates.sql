/****** Object:  StoredProcedure [dbo].[get_collection_dates]    Script Date: 5/15/2018 12:09:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[get_collection_dates]
AS
	exec [zeepipe_meta].[dbo].[get_collection_dates] 'fsi'

GO
