/****** Object:  View [catalog].[catalog_properties]    Script Date: 5/15/2018 12:14:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [catalog].[catalog_properties]
AS
SELECT     [property_name], 
           [property_value]
FROM       [internal].[catalog_properties]

GO
