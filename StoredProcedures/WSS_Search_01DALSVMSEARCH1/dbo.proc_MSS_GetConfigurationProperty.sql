/****** Object:  StoredProcedure [dbo].[proc_MSS_GetConfigurationProperty]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetConfigurationProperty
(
    @Name nvarchar(64),
    @Value sql_variant OUTPUT 
)
AS
 SELECT @Value = Value
 FROM   dbo.MSSConfiguration WITH(NOLOCK)
 WHERE  Name = @Name

GO
