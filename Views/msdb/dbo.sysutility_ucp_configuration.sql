/****** Object:  View [dbo].[sysutility_ucp_configuration]    Script Date: 5/15/2018 12:14:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[sysutility_ucp_configuration]
AS
    SELECT     
        name,
        current_value
    FROM [dbo].[sysutility_ucp_configuration_internal]

GO
