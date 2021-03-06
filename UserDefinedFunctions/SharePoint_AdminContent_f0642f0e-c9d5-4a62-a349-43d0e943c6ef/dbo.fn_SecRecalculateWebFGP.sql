/****** Object:  UserDefinedFunction [dbo].[fn_SecRecalculateWebFGP]    Script Date: 5/15/2018 12:15:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_SecRecalculateWebFGP(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier)
RETURNS int
AS
BEGIN
    DECLARE @UserlistScopeId uniqueidentifier
    DECLARE @WebUrl nvarchar(260)
    DECLARE @Flags int
    SELECT 
        @UserlistScopeId = tp_ScopeId 
    FROM 
        lists 
    INNER JOIN
        sites 
    ON
        sites.RootWebId = Lists.tp_WebId AND
        sites.UserInfoListId = Lists.tp_Id 
    WHERE
        sites.Id = @SiteId
    SELECT 
        @WebUrl = fullurl,
        @Flags = Flags
    FROM 
        webs 
    WHERE
        id = @WebId
    IF (EXISTS (SELECT * 
        FROM 
            perms 
        WHERE
            SiteId = @SiteId AND
            DelTransId = 0x AND
            WebId = @WebId AND
            ScopeId <> @UserlistScopeId AND
            ScopeUrl <> @WebUrl)
        OR EXISTS (SELECT *
        FROM
            lists
        WHERE 
            tp_WebId = @WebId AND
            tp_ReadSecurity = 0x00000002))
        SET @Flags = @Flags | 0x400
    ELSE
        SET @Flags = ~(~@Flags | 0x400)
    RETURN @Flags
END

GO
