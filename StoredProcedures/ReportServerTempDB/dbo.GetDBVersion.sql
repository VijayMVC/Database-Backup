/****** Object:  StoredProcedure [dbo].[GetDBVersion]    Script Date: 5/15/2018 12:11:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

    CREATE PROCEDURE [dbo].[GetDBVersion]
    @DBVersion nvarchar(32) OUTPUT
    AS
    SET @DBVersion = (select top(1) [DbVersion]  from [dbo].[DBUpgradeHistory])
GO
