/****** Object:  StoredProcedure [dbo].[proc_VerifyUpdateConditions]    Script Date: 5/15/2018 12:13:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_VerifyUpdateConditions(
    @dbVersion int,
    @dbAuthor int,
    @Version int,
    @UserId int,
    @NeedsAuthorRestriction bit)
AS
    DECLARE @ReturnCode int
    IF (@dbVersion <> @Version AND @Version IS NOT NULL)
    BEGIN
        SET @ReturnCode = 1150
    END
    ELSE IF (@NeedsAuthorRestriction = 1 AND @dbAuthor <> @UserID)
    BEGIN
        SET @ReturnCode = 5
    END
    ELSE
    BEGIN
        SET @ReturnCode = 0
    END
    RETURN @ReturnCode

GO
