/****** Object:  Table [dbo].[tblAssets]    Script Date: 5/15/2018 12:01:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tblAssets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[vcLocation] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[dtmDateModified] [datetime] NOT NULL,
	[dtmDateCreated] [datetime] NOT NULL,
	[bActive] [bit] NOT NULL,
	[dtmDateExpires] [datetime] NULL,
	[dtmReviewDate] [datetime] NULL,
	[nTypeID] [int] NULL,
	[nDocID] [int] NULL,
	[vcCreatedBy] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vcCountry] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vcLastModifiedBy] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_DigitalAssets.tblAssets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[tblAssets]  WITH CHECK ADD  CONSTRAINT [FK_DigitalAssets.tblAssets_DigitalAssets.tblAssets] FOREIGN KEY([nTypeID])
REFERENCES [dbo].[tblTypes] ([ID])
ALTER TABLE [dbo].[tblAssets] CHECK CONSTRAINT [FK_DigitalAssets.tblAssets_DigitalAssets.tblAssets]
/****** Object:  Trigger [dbo].[trFAQsDateMod]    Script Date: 5/15/2018 12:01:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trFAQsDateMod] --ALTER
   ON  [dbo].[tblAssets]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF (SELECT nTypeID FROM INSERTED) = 19
	BEGIN
		DECLARE @dtPreviousMonth DATETIME
		SET @dtPreviousMonth = DATEADD(mm, -1, GETDATE());
		UPDATE tblAssets
		SET dtmDateModified = @dtPreviousMonth
		FROM INSERTED
		WHERE tblAssets.ID = INSERTED.ID
	END
END

GO
