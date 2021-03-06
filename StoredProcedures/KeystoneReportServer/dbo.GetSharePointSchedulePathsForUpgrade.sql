/****** Object:  StoredProcedure [dbo].[GetSharePointSchedulePathsForUpgrade]    Script Date: 5/15/2018 12:10:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROC [dbo].[GetSharePointSchedulePathsForUpgrade]
AS
BEGIN
SELECT DISTINCT [Path], LEN([Path])
  FROM [Schedule]
  WHERE [Path] IS NOT NULL AND [Path] NOT LIKE '/{%'
  ORDER BY LEN([Path]) DESC
END

GO
