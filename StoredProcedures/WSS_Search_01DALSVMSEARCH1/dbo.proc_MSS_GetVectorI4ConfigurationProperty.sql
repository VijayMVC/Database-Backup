/****** Object:  StoredProcedure [dbo].[proc_MSS_GetVectorI4ConfigurationProperty]    Script Date: 5/15/2018 12:13:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetVectorI4ConfigurationProperty
(
    @Name nvarchar(64)
)
AS
    SELECT
        CAST(Value as int)
    FROM
        dbo.MSSConfiguration WITH(NOLOCK)
    WHERE
        Name = @Name

GO
