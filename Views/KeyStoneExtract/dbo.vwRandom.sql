/****** Object:  View [dbo].[vwRandom]    Script Date: 5/15/2018 12:14:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.vwRandom
AS
SELECT RAND() as RandomValue;


GO
