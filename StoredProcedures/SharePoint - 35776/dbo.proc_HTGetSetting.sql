/****** Object:  StoredProcedure [dbo].[proc_HTGetSetting]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_HTGetSetting
    @settingKey nchar(10)
AS
SELECT [value]
FROM HT_Settings
WHERE [key] = @settingKey

GO
