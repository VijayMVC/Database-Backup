/****** Object:  View [dbo].[sysutility_ucp_mi_cpu_utilizations]    Script Date: 5/15/2018 12:14:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[sysutility_ucp_mi_cpu_utilizations]
AS
SELECT svr.Name AS server_instance_name, 
   10 AS under_utilization, 
   CAST(svr.ProcessorUsage AS INT) AS current_utilization, 
   70 AS over_utilization
FROM	msdb.dbo.sysutility_ucp_instances AS svr;

GO
