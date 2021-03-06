/****** Object:  Table [dbo].[ComMd]    Script Date: 5/15/2018 12:05:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ComMd](
	[SiteId] [uniqueidentifier] NOT NULL,
	[DocId] [uniqueidentifier] NOT NULL,
	[Id] [int] NOT NULL,
	[ParentId] [int] NULL,
	[CommentId] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Bookmark] [nvarchar](127) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Author] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[UserId] [int] NULL,
	[Subject] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Created] [datetime] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Comment] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Size] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [ComMd_SiteIdDocIdId]    Script Date: 5/15/2018 12:05:33 PM ******/
CREATE UNIQUE CLUSTERED INDEX [ComMd_SiteIdDocIdId] ON [dbo].[ComMd]
(
	[SiteId] ASC,
	[DocId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[ComMd] ADD  DEFAULT ((0)) FOR [Size]
/****** Object:  Trigger [dbo].[trigger_OnDeleteDiscussions]    Script Date: 5/15/2018 12:05:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER trigger_OnDeleteDiscussions
    ON ComMd
    AFTER DELETE
AS
    DECLARE @SiteId uniqueidentifier
    DECLARE @cbDelta bigint
    SELECT
        @SiteId = SiteId,
        @cbDelta = -(SUM(CAST((ISNULL(Size, 0)) AS BIGINT)))
    FROM
        DELETED
    GROUP BY
        SiteId
    IF @@ROWCOUNT = 1
    BEGIN
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
            @SiteId,
            @cbDelta,
            0
    END

GO
