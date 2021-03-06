/****** Object:  Table [dbo].[Personalization]    Script Date: 5/15/2018 12:06:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Personalization](
	[tp_SiteId] [uniqueidentifier] NOT NULL,
	[tp_WebPartID] [uniqueidentifier] NOT NULL,
	[tp_PageUrlID] [uniqueidentifier] NOT NULL,
	[tp_UserID] [int] NOT NULL,
	[tp_PartOrder] [int] NULL,
	[tp_ZoneID] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[tp_IsIncluded] [bit] NOT NULL,
	[tp_FrameState] [tinyint] NOT NULL,
	[tp_PerUserProperties] [image] NULL,
	[tp_Cache] [image] NULL,
	[tp_Size] [bigint] NOT NULL,
	[tp_Deleted] [bit] NOT NULL,
 CONSTRAINT [Personalization_PK] PRIMARY KEY CLUSTERED 
(
	[tp_SiteId] ASC,
	[tp_PageUrlID] ASC,
	[tp_UserID] ASC,
	[tp_WebPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Personalization_UserID]    Script Date: 5/15/2018 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [Personalization_UserID] ON [dbo].[Personalization]
(
	[tp_SiteId] ASC,
	[tp_UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Personalization_ZoneID]    Script Date: 5/15/2018 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [Personalization_ZoneID] ON [dbo].[Personalization]
(
	[tp_SiteId] ASC,
	[tp_PageUrlID] ASC,
	[tp_ZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[Personalization] ADD  DEFAULT ((0)) FOR [tp_Deleted]
/****** Object:  Trigger [dbo].[trigger_OnDeletePersonalization]    Script Date: 5/15/2018 12:06:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER trigger_OnDeletePersonalization ON Personalization AFTER DELETE
As
    DECLARE @siteId uniqueidentifier
    DECLARE @cbDelta bigint
    DECLARE @cSave int
    SELECT
        @SiteId = tp_SiteId,
        @cbDelta = -(SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT)))
    FROM
        Deleted
    WHERE
        tp_Deleted = 0
    GROUP BY
        tp_SiteId
    SET @cSave = @@ROWCOUNT
    IF (1 = @cSave)
    BEGIN
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 0
    END

GO
