/****** Object:  View [dbo].[vw_ReportPortal]    Script Date: 5/15/2018 12:14:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [vw_ReportPortal] AS 
SELECT  [user_role_id] AS fs_role_id
      ,[user_role] AS fs_role
      ,[report_title] AS fs_report_title
      ,[report_path] AS fs_report_path
      ,[report_desc] AS fs_report_description
      ,[center_no] AS fs_center_number
      ,[report_type] AS fs_report_type
  FROM [MySQLStaging].[system].[keystone_report_links]
GO
