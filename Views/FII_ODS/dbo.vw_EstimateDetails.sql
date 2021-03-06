/****** Object:  View [dbo].[vw_EstimateDetails]    Script Date: 5/15/2018 12:13:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[vw_EstimateDetails]
AS
    SELECT
        Estimate.EstimateDetailFact.EstimateDetailKey ,
        Estimate.EstimateDetailFact.ZW_Franchise_ID ,
        Estimate.EstimateDetailFact.OrderDetailID ,
        Estimate.EstimateDetailFact.OrderID ,
        Estimate.EstimateDetailFact.LineItemNumber ,
        Estimate.EstimateDetailFact.ProductID ,
		PDim.DescriptionName As ProductDescription,
--        Estimate.DescriptionDim.DescriptionName AS ProductDecription ,
        Estimate.ProductCodeDim.ProductCodeName AS ProductCode ,
        Estimate.EstimateDetailFact.Quantity ,
        Estimate.EstimateDetailFact.Sides ,
        Estimate.EstimateDetailFact.Height ,
        Estimate.EstimateDetailFact.Width ,
        Estimate.BackgroundColorDim.BackgroundColorName AS BackgroundColor ,
        Estimate.FontDim.FontName AS Font ,
        Estimate.EstimateDetailFact.BasePrice ,
        Estimate.EstimateDetailFact.BasePriceOverriden ,
        Estimate.EstimateDetailFact.BasePriceCalculated ,
        Estimate.EstimateDetailFact.AVTotal ,
        Estimate.EstimateDetailFact.InstallAmount ,
        Estimate.EstimateDetailFact.DiscountAmount ,
        Estimate.EstimateDetailFact.DiscountPercentage ,
        Estimate.EstimateDetailFact.ItemTotal ,
        Estimate.EstimateDetailFact.UnitPriceOverridden ,
        Estimate.EstimateDetailFact.OverRidden ,
        Estimate.EstimateDetailFact.ItemTotalCalculated ,
        Estimate.EstimateDetailFact.Taxable ,
        Estimate.EstimateDetailFact.AllInstallation ,
        Estimate.DescriptionDim.DescriptionName AS OrderDetailDescription ,
        Estimate.SignTextDim.SignTextName AS SignText ,
        Estimate.EstimateDetailFact.AVAdditionalAmt ,
        Estimate.AVAdditionalDescriptionDim.AVAdditionalDescriptionName AS AVIAdditionalDescription ,
        Estimate.EstimateDetailFact.AVOverridden ,
        Estimate.EstimateDetailFact.AVCalculated ,
        Estimate.EstimateDetailFact.ProductionLocation ,
        Estimate.EstimateDetailFact.ShopTime ,
        Estimate.EstimateDetailFact.FieldTime ,
        Estimate.EstimateDetailFact.FieldCrewSize ,
        Estimate.EstimateDetailFact.MaterialCost ,
        Estimate.EstimateDetailFact.HeightAboveGround ,
        Estimate.EstimateDetailFact.ProductionCat3Sales ,
        Estimate.EstimateDetailFact.OtherInstallConsideration ,
        Estimate.EstimateDetailFact.SpecialEquipment1 ,
        Estimate.EstimateDetailFact.SpecialEquipment2 ,
        Estimate.EstimateDetailFact.SpecialEquipment3 ,
        Estimate.EstimateDetailFact.SpecialEquipmentOther ,
        Estimate.EstimateDetailFact.SpecialEquipmentOtherAmou ,
        Estimate.EstimateDetailFact.EstimatedInstallCharge ,
        Estimate.EstimateDetailFact.AccountCode ,
        Estimate.EstimateDetailFact.Hidden ,
        Estimate.EstimateDetailFact.PMsAnswered ,
        Estimate.EstimateDetailFact.ParentItemNumber ,
        Estimate.EstimateDetailFact.StateSalesTax ,
        Estimate.EstimateDetailFact.StateSalesTaxRate ,
        Estimate.EstimateDetailFact.BaseCost ,
        Estimate.ProductionNotesDim.ProductionNotesName AS ProductionNotes
    FROM
        Estimate.EstimateDetailFact   WITH ( NOLOCK ) 
--		LEFT JOIN Product.ProductFact ON Estimate.EstimateDetailFact.ProductKey = Product.ProductFact.ProductKey
        LEFT JOIN Estimate.DescriptionDim   WITH ( NOLOCK ) ON Estimate.EstimateDetailFact.DescriptionKey = Estimate.DescriptionDim.DescriptionKey
        LEFT JOIN Estimate.BackgroundColorDim   WITH ( NOLOCK ) ON Estimate.EstimateDetailFact.BackgroundColorKey = Estimate.BackgroundColorDim.BackgroundColorKey
        LEFT JOIN Estimate.FontDim   WITH ( NOLOCK ) ON Estimate.EstimateDetailFact.FontKey = Estimate.FontDim.FontKey
 --       LEFT JOIN Estimate.DescriptionDim DescriptionDim1 ON Estimate.EstimateDetailFact.DescriptionKey = DescriptionDim1.DescriptionKey
        LEFT JOIN Estimate.SignTextDim   WITH ( NOLOCK ) ON Estimate.EstimateDetailFact.SignTextKey = Estimate.SignTextDim.SignTextKey
        LEFT JOIN Estimate.AVAdditionalDescriptionDim   WITH ( NOLOCK ) ON Estimate.EstimateDetailFact.AVAdditionalDescriptionKey = Estimate.AVAdditionalDescriptionDim.AVAdditionalDescriptionKey
        LEFT JOIN Estimate.ProductionNotesDim   WITH ( NOLOCK ) ON Estimate.EstimateDetailFact.ProductionNotesKey = Estimate.ProductionNotesDim.ProductionNotesKey
        LEFT JOIN Estimate.ProductCodeDim   WITH ( NOLOCK ) ON Estimate.EstimateDetailFact.ProductCodeKey = Estimate.ProductCodeDim.ProductCodeKey
   Left Join Product.ProductFact   WITH ( NOLOCK ) On Estimate.EstimateDetailFact.ProductID = Product.ProductFact.ProductID And Estimate.EstimateDetailFact.ZW_Franchise_ID = Product.ProductFact.ZW_Franchise_ID
   Left Join Product.DescriptionDim PDim   WITH ( NOLOCK ) ON Product.ProductFact.DescriptionKey = PDim.DescriptionKey



GO
