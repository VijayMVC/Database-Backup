/****** Object:  StoredProcedure [dbo].[proc_MSS_UpgradePropertySchema]    Script Date: 5/15/2018 12:11:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_UpgradePropertySchema
AS
   set nocount on

   select
      p.PropertyUri,
      p.DisplayName,
      p.PropertyType,
      p.Flags,
      m.PropertyUri,
      m.DisplayName,
      m.Flags
   from
      dbo.MX_Properties p
   left outer join
      dbo.MX_Properties m
   on    (p.MappedPropertyId = m.PropertyId)
   where (p.IsDeleted = 0)
     and (p.PropertyId > 370)
   order by
      p.PropertyUri

   if (@@error != 0)
      return 1 

   return 0 

GO
