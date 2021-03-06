/****** Object:  View [dbo].[vw_DailyAmounts]    Script Date: 5/15/2018 12:13:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW vw_DailyAmounts
AS
    Select
  vw_Locations.ZW_Franchise_ID,
  DailyAmounts.ReportType,
  Cast(DateAdd(day, -1, DailyAmounts.LastUpdate) As date) As AsOf,
  DailyAmounts.ReportItem,
  DailyAmounts.CurrentAmount
From
  DailyAmounts
  Inner Join vw_Locations
    On vw_Locations.Value = DailyAmounts.CompanyLocationId
GO
