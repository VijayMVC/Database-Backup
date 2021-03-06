/****** Object:  View [dbo].[systargetservers_view]    Script Date: 5/15/2018 12:14:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE VIEW systargetservers_view
AS
SELECT server_id,
       server_name,
       enlist_date,
       last_poll_date
FROM msdb.dbo.systargetservers
UNION
SELECT 0,
       CONVERT(sysname, SERVERPROPERTY('ServerName')),
       CONVERT(DATETIME, N'19981113', 112),
       CONVERT(DATETIME, N'19981113', 112)

GO
