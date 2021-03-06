/****** Object:  StoredProcedure [dbo].[proc_DeplUpdateWebProperties]    Script Date: 5/15/2018 12:11:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplUpdateWebProperties(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @AlternateCSSUrl nvarchar(260),
    @CustomizedCssFiles nvarchar(260),
    @CustomJSUrl nvarchar(260),
    @ExternalSecurityProvider uniqueidentifier,
    @ThemeComposite nvarchar(64),
    @TimeCreated datetime,
    @WebTemplateId int,
    @ProvisionConfig int)
AS
    SET NOCOUNT ON
    DECLARE @WebUrl nvarchar(260)
    DECLARE @Now datetime
    SET @Now = GETUTCDATE()
    UPDATE
        Webs
    SET
        AlternateCSSUrl =
            CASE
                WHEN @AlternateCSSUrl IS NULL THEN AlternateCSSUrl
                WHEN LEN(@AlternateCSSUrl) = 0 THEN NULL
                ELSE @AlternateCSSUrl
            END,
        CustomizedCss =
            CASE
                WHEN @CustomizedCssFiles IS NULL THEN CustomizedCss
                WHEN LEN(@CustomizedCssFiles) = 0 THEN NULL
                ELSE @CustomizedCssFiles
            END,
        CustomJSUrl =
             CASE
                WHEN @CustomJSUrl IS NULL THEN CustomJSUrl
                WHEN LEN(@CustomJSUrl) = 0 THEN NULL
                ELSE @CustomJSUrl
            END,
        SecurityProvider =
              CASE
                WHEN @ExternalSecurityProvider IS NULL THEN SecurityProvider
                WHEN @ExternalSecurityProvider = '00000000-0000-0000-0000-000000000000' THEN NULL
                ELSE @ExternalSecurityProvider
            END,
        DefTheme =
              CASE
                WHEN
                    @ThemeComposite IS NULL THEN DefTheme
                WHEN LEN(@ThemeComposite) = 0 THEN NULL
                ELSE @ThemeComposite
            END,
        TimeCreated =
              CASE
                WHEN @TimeCreated IS NULL THEN TimeCreated
                ELSE @TimeCreated
            END,
        WebTemplate =
              CASE
                WHEN @WebTemplateId IS NULL THEN WebTemplate
                ELSE @WebTemplateId
            END,
        ProvisionConfig =
              CASE
                WHEN @ProvisionConfig IS NULL THEN ProvisionConfig
                ELSE @ProvisionConfig
           END,
      LastMetadataChange = @Now
    WHERE
        Id = @WebId
    IF @@ROWCOUNT <> 1
    BEGIN
        IF EXISTS (SELECT * FROM Webs WHERE Id = @WebId)
        BEGIN
            RETURN 1150
        END
        ELSE
        BEGIN
            RETURN 3
        END
    END
    RETURN 0

GO
