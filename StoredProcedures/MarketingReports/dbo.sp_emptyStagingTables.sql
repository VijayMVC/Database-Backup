/****** Object:  StoredProcedure [dbo].[sp_emptyStagingTables]    Script Date: 5/15/2018 12:10:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_emptyStagingTables]

AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int
	select @intReturnCode = 0

--truncate table dbo.Metro
--truncate table dbo.WebnumberMetro
--truncate table dbo.WebnumberPhone

	select @intReturnCode = @@error
	return @intReturnCode
END

GO
