/****** Object:  View [dbo].[sysdatatypemappings]    Script Date: 5/15/2018 12:14:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE VIEW dbo.sysdatatypemappings AS SELECT * FROM sys.fn_helpdatatypemap('%', '%', '%', '%', '%', '%', 0)
GO
