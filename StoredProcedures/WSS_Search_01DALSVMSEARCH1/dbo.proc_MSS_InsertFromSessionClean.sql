/****** Object:  StoredProcedure [dbo].[proc_MSS_InsertFromSessionClean]    Script Date: 5/15/2018 12:13:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_InsertFromSessionClean
                    @docid INT,
                    @nIsAlt INT
AS
SET XACT_ABORT ON 
BEGIN TRANSACTION
    declare @strCommand nvarchar(4000)
    declare @strDocid nvarchar(128)    
    declare @strAlt nvarchar(128)
    select @strAlt = ''
    if(@nIsAlt = 1)
    begin
        select @strAlt = 'Alt'
    end
    declare @strSessionDocProps nvarchar(128)
    select @strSessionDocProps = 'MSSSessionDocProps' + @strAlt
    declare @strSessionDefinitions nvarchar(128)
    select @strSessionDefinitions = 'MSSSessionDefinitions' + @strAlt
    declare @strSessionDocSdids nvarchar(128)
    select @strSessionDocSdids = 'MSSSessionDocSdids' + @strAlt
    declare @strSessionDocSignatures nvarchar(128)
    select @strSessionDocSignatures = 'MSSSessionDocSignatures' + @strAlt
    declare @strSessionDupliateHashes nvarchar(128)
    select @strSessionDupliateHashes = 'MSSSessionDuplicateHashes' + @strAlt
    declare @strSessionExistingDocs nvarchar(128)
    select @strSessionExistingDocs = 'MSSSessionExistingDocs' + @strAlt
    if(@docid > 0)
    begin
        select @strDocid = convert(nvarchar(128), @docid)
        select @strCommand = 'DELETE ' + @strSessionDocProps + ' FROM ' + @strSessionDocProps + 
                             ' WHERE DocId = ' + @strDocid
        exec(@strCommand)
        select @strCommand = 'DELETE ' + @strSessionDefinitions + ' FROM ' + @strSessionDefinitions + 
                             ' WHERE DocId = ' + @strDocid
        exec(@strCommand)
        select @strCommand = 'DELETE ' + @strSessionDocSdids + ' FROM ' + @strSessionDocSdids + 
                             ' WHERE DocId = ' + @strDocid
        exec(@strCommand)
        select @strCommand = 'DELETE ' + @strSessionDocSignatures + ' FROM ' + @strSessionDocSignatures + 
                             ' WHERE DocId = ' + @strDocid
        exec(@strCommand)
        select @strCommand = 'DELETE ' + @strSessionDupliateHashes + ' FROM ' + @strSessionDupliateHashes + 
                             ' WHERE DocId = ' + @strDocid
        exec(@strCommand)
        select @strCommand = 'DELETE ' + @strSessionExistingDocs + ' FROM ' + @strSessionExistingDocs + 
                             ' WHERE DocId = ' + @strDocid
        exec(@strCommand)
    end
    else
    begin
        select @strCommand = 'TRUNCATE TABLE ' + @strSessionDocProps
        exec(@strCommand)
        select @strCommand = 'TRUNCATE TABLE ' + @strSessionDefinitions
        exec(@strCommand)
        select @strCommand = 'TRUNCATE TABLE ' + @strSessionDocSdids
        exec(@strCommand)
        select @strCommand = 'TRUNCATE TABLE ' + @strSessionDocSignatures
        exec(@strCommand)
        select @strCommand = 'TRUNCATE TABLE ' + @strSessionDupliateHashes
        exec(@strCommand)
        select @strCommand = 'TRUNCATE TABLE ' + @strSessionExistingDocs
        exec(@strCommand)
    end
    COMMIT TRANSACTION
    RETURN 0

GO
