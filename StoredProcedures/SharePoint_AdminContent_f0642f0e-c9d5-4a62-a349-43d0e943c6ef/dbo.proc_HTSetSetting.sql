/****** Object:  StoredProcedure [dbo].[proc_HTSetSetting]    Script Date: 5/15/2018 12:12:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_HTSetSetting(
    @settingKey nchar(10),
    @newValue int
)
AS
    UPDATE HT_Settings
    SET value = @newValue
    WHERE [key] = @settingKey

GO
