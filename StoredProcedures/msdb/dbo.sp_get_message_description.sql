/****** Object:  StoredProcedure [dbo].[sp_get_message_description]    Script Date: 5/15/2018 12:10:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE sp_get_message_description
  @error INT
AS
BEGIN
  IF EXISTS (SELECT * FROM master.dbo.sysmessages WHERE (error = @error) AND (msglangid = (SELECT msglangid FROM sys.syslanguages WHERE (langid = @@langid))))
    SELECT description FROM master.dbo.sysmessages WHERE (error = @error) AND (msglangid = (SELECT msglangid FROM sys.syslanguages WHERE (langid = @@langid)))
  ELSE
    SELECT description FROM master.dbo.sysmessages WHERE (error = @error) AND (msglangid = 1033)
END

GO
