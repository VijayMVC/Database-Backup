/****** Object:  View [dbo].[Visit_Tracking]    Script Date: 5/15/2018 12:13:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE VIEW [dbo].[Visit_Tracking]
AS 
-- Visit_Tracking View for use by Visit Tracking Reports

SELECT     accountno, uv1type AS uvtype, uv1sem AS uvsem, uv1schdt AS
uvschdt, uv1schby AS uvschby, uv1compdt AS uvcompdt, uv1compby AS uvcompby,
                      '1' AS flag
FROM         contact2
WHERE     isnull(uv1type, '') <> ''
UNION
SELECT     accountno, uv2type AS uvtype, uv2sem AS uvsem, uv2schdt AS
uvschdt, uv2schby AS uvschby, uv2compdt AS uvcompdt, uv2compby AS uvcompby,
                      '2' AS flag
FROM         contact2
WHERE     isnull(uv2type, '') <> ''
UNION
SELECT     accountno, uv3type AS uvtype, uv3sem AS uvsem, uv3schdt AS
uvschdt, uv3schby AS uvschby, uv3compdt AS uvcompdt, uv3compby AS uvcompby,
                      '3' AS flag
FROM         contact2
WHERE     isnull(uv3type, '') <> ''
UNION
SELECT     accountno, uv4type AS uvtype, uv4sem AS uvsem, uv4schdt AS
uvschdt, uv4schby AS uvschby, uv4compdt AS uvcompdt, uv4compby AS uvcompby,
                      '4' AS flag
FROM         contact2
WHERE     isnull(uv4type, '') <> ''
UNION
SELECT     accountno, uv5type AS uvtype, uv5sem AS uvsem, uv5schdt AS
uvschdt, uv5schby AS uvschby, uv5compdt AS uvcompdt, uv5compby AS uvcompby,
                      '5' AS flag
FROM         contact2
WHERE     isnull(uv5type, '') <> ''





GO
