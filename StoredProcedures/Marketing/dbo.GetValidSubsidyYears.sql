/****** Object:  StoredProcedure [dbo].[GetValidSubsidyYears]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.GetValidSubsidyYears AS
SELECT DISTINCT SubDCalanderYear FROM SubsidyDtl
ORDER BY SubDCalanderYear


GO
