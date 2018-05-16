/****** Object:  StoredProcedure [dbo].[integration_log_error]    Script Date: 5/15/2018 12:09:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[integration_log_error](
@occurred datetime = [getdate()],
@sender varchar(100) = NULL,
@error_message varchar(max) = NULL
)
AS
SET NOCOUNT ON

INSERT INTO _zw_ExactTargetLog(occurred, sender, logEntry)
VALUES(@occurred, @sender, @error_message)


GO
