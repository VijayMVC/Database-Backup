/****** Object:  View [dbo].[SSIS_OrderDetailFact_StageLoad]    Script Date: 5/15/2018 12:13:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





CREATE VIEW [dbo].[SSIS_OrderDetailFact_StageLoad]
AS
    SELECT
        Staging.dbo.OrderDetailFact.OrderDetailID ,
        Staging.dbo.OrderDetailFact.zw_franchise_id ,
        Staging.dbo.OrderDetailFact.LineItemNumber ,
        Staging.dbo.OrderDetailFact.OrderID ,
        Staging.dbo.OrderDetailFact.ProductID ,
        Staging.dbo.OrderDetailFact.ProductCode ,
        Staging.dbo.OrderDetailFact.Quantity ,
        Staging.dbo.OrderDetailFact.Sides ,
        Staging.dbo.OrderDetailFact.Height ,
        Staging.dbo.OrderDetailFact.Width ,
        Staging.dbo.OrderDetailFact.ForegroundColor ,
        Staging.dbo.OrderDetailFact.BackgroundColor ,
        Staging.dbo.OrderDetailFact.Font ,
        Staging.dbo.OrderDetailFact.BasePrice ,
        Staging.dbo.OrderDetailFact.BasePriceOverriden ,
        Staging.dbo.OrderDetailFact.BasePriceCalculated ,
        Staging.dbo.OrderDetailFact.AVTotal ,
        Staging.dbo.OrderDetailFact.InstallAmount ,
        Staging.dbo.OrderDetailFact.DiscountPercentage ,
        Staging.dbo.OrderDetailFact.DiscountAmount ,
        Staging.dbo.OrderDetailFact.ItemTotal ,
        Staging.dbo.OrderDetailFact.UnitPriceOverridden ,
        Staging.dbo.OrderDetailFact.OverRidden ,
        Staging.dbo.OrderDetailFact.ItemTotalCalculated ,
        Staging.dbo.OrderDetailFact.Taxable ,
        Staging.dbo.OrderDetailFact.AllInstallation ,
        Staging.dbo.OrderDetailFact.Description ,
        Staging.dbo.OrderDetailFact.SignText ,
        Staging.dbo.OrderDetailFact.AVAdditionalAmt ,
        Staging.dbo.OrderDetailFact.AVAdditionalDescription ,
        Staging.dbo.OrderDetailFact.AVOverridden ,
        Staging.dbo.OrderDetailFact.AVCalculated ,
        Staging.dbo.OrderDetailFact.ProductionLocation ,
        Staging.dbo.OrderDetailFact.ShopTime ,
        Staging.dbo.OrderDetailFact.FieldTime ,
        Staging.dbo.OrderDetailFact.FieldCrewSize ,
        Staging.dbo.OrderDetailFact.MaterialCost ,
        Staging.dbo.OrderDetailFact.HeightAboveGround ,
        Staging.dbo.OrderDetailFact.OtherInstallConsideration ,
        Staging.dbo.OrderDetailFact.SpecialEquipment1 ,
        Staging.dbo.OrderDetailFact.SpecialEquipment2 ,
        Staging.dbo.OrderDetailFact.SpecialEquipment3 ,
        Staging.dbo.OrderDetailFact.SpecialEquipmentOther ,
        Staging.dbo.OrderDetailFact.SpecialEquipmentOtherAmou ,
        Staging.dbo.OrderDetailFact.EstimatedInstallCharge ,
        Staging.dbo.OrderDetailFact.AccountCode ,
        Staging.dbo.OrderDetailFact.Hidden ,
        Staging.dbo.OrderDetailFact.PMsAnswered ,
        Staging.dbo.OrderDetailFact.ParentItemNumber ,
        Staging.dbo.OrderDetailFact.ChildLevel ,
        Staging.dbo.OrderDetailFact.BaseCost ,
        Staging.dbo.OrderDetailFact.ProductionNotes ,
        Staging.dbo.OrderDetailFact.HasChildren ,
        Staging.dbo.OrderDetailFact.BaseSonsPrice ,
        Staging.dbo.OrderDetailFact.BaseMeAndSonsPrice ,
        Staging.dbo.OrderDetailFact.InstallSonsPrice ,
        Staging.dbo.OrderDetailFact.InstallMeAndSonsPrice ,
        Staging.dbo.OrderDetailFact.DiscountSonsPrice ,
        Staging.dbo.OrderDetailFact.DiscountMeAndSonsPrice ,
        Staging.dbo.OrderDetailFact.ItemTotalSonsPrice ,
        Staging.dbo.OrderDetailFact.ItemTotalMeAndSonsPrice ,
        Staging.dbo.OrderDetailFact.ModifierXML ,
        Staging.dbo.OrderDetailFact.RoyaltyGroupID ,
        Staging.dbo.OrderDetailFact.OLTP_InsertDate ,
        Staging.dbo.OrderDetailFact.OLTP_UpdateDate ,
        Staging.dbo.OrderDetailFact.UpdateCheckSum ,
        Orders.ProductCodeDim.ProductCodeKey ,
        Orders.ForegroundColorDim.ForegroundColorKey ,
        Orders.BackgroundColorDim.BackgroundColorKey ,
        Orders.FontDim.FontKey ,
        Orders.DescriptionDim.DescriptionKey ,
        Orders.SignTextDim.SignTextKey ,
        Orders.AVAdditionalDescriptionDim.AVAdditionalDescriptionKey ,
        Orders.ProductionNotesDim.ProductionNotesKey ,
        Store.StoreFact.CenterKey ,
        Orders.OrderHeaderFact.OrderHeaderKey ,
        Product.ProductFact.ProductKey
    FROM
        Staging.dbo.OrderDetailFact
        LEFT JOIN Orders.ProductCodeDim  ON Orders.ProductCodeDim.ProductCodeName = Staging.dbo.OrderDetailFact.ProductCode
        LEFT JOIN Orders.ForegroundColorDim ON Orders.ForegroundColorDim.ForegroundColorName = Staging.dbo.OrderDetailFact.ForegroundColor
        LEFT JOIN Orders.BackgroundColorDim  ON Orders.BackgroundColorDim.BackgroundColorName = Staging.dbo.OrderDetailFact.BackgroundColor
        LEFT JOIN Orders.FontDim  ON Orders.FontDim.FontName = Staging.dbo.OrderDetailFact.Font
        LEFT JOIN Orders.DescriptionDim  ON Orders.DescriptionDim.DescriptionName = Staging.dbo.OrderDetailFact.Description
        LEFT JOIN Orders.SignTextDim  ON Orders.SignTextDim.SignTextName = Staging.dbo.OrderDetailFact.SignText
        LEFT JOIN Orders.AVAdditionalDescriptionDim  ON Orders.AVAdditionalDescriptionDim.AVAdditionalDescriptionName = Staging.dbo.OrderDetailFact.AVAdditionalDescription
        LEFT JOIN Orders.ProductionNotesDim  ON Orders.ProductionNotesDim.ProductionNotesName = Staging.dbo.OrderDetailFact.ProductionNotes
        INNER JOIN Store.StoreFact  ON Store.StoreFact.ZW_Franchise_ID = Staging.dbo.OrderDetailFact.zw_franchise_id
        JOIN Orders.OrderHeaderFact ON Orders.OrderHeaderFact.CenterKey = Store.StoreFact.CenterKey
                                            AND Staging.dbo.OrderDetailFact.OrderID = Orders.OrderHeaderFact.OrderID
        LEFT JOIN Product.ProductFact ON Product.ProductFact.CenterKey = Store.StoreFact.CenterKey
                                         AND Staging.dbo.OrderDetailFact.ProductID = Product.ProductFact.ProductID




GO
