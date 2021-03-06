/****** Object:  View [dbo].[vw_Report_Portal]    Script Date: 5/15/2018 12:14:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vw_Report_Portal] AS 
Select
  FII.fs_report_type.fs_report_type_id As fs_report_type_id1,
  FII.fs_report_type.fs_report_type_name,
  FII.fs_report.fs_report_id As fs_report_id1,
  FII.fs_report.fs_report_title,
  FII.fs_report.fs_report_description,
  FII.fs_report.fs_report_path,
  FII.fs_role.fs_role_name,
  FII.fs_role.display_order,
  FII.fs_report_permissions.fs_role_id,
  FII.fs_report_permissions.fs_center_id As fs_center_id1,
  FII.fs_report_permissions.fs_report_report_type_id As
  fs_report_report_type_id1,
  FII.fs_center.fs_center_id,
  FII.fs_center.center_number
From
  FII.fs_report Inner Join
  FII.fs_report_report_type On FII.fs_report_report_type.fs_report_id =
    FII.fs_report.fs_report_id Inner Join
  FII.fs_report_type On FII.fs_report_report_type.fs_report_type_id =
    FII.fs_report_type.fs_report_type_id Inner Join
  FII.fs_report_permissions
    On FII.fs_report_report_type.fs_report_report_type_id =
    FII.fs_report_permissions.fs_report_report_type_id Inner Join
  FII.fs_role On FII.fs_role.fs_role_id = FII.fs_report_permissions.fs_role_id
  Inner Join
  FII.fs_center On FII.fs_report_permissions.fs_center_id =
    FII.fs_center.fs_center_id

GO
