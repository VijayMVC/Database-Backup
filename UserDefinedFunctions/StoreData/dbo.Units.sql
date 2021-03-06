/****** Object:  UserDefinedFunction [dbo].[Units]    Script Date: 5/15/2018 12:15:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION Units ()
   RETURNS @myTable TABLE (UnitID int, UnitText Varchar(25), UnitAbbreviation Varchar(15),UnitType int, ConversionUnit float)
as
Begin 

declare @InchToCM float;
declare @QuartToLiter float;
declare @PoundToKg float;

set @InchToCM = 2.54;
set @QuartToLiter = 0.9460737938;
set @PoundToKg = 0.4535923701;

insert into @myTable values (1,'Each','ea',1,1)
insert into @myTable values (2,'Inch','in',3,@InchToCM)
insert into @myTable values (3,'Foot','ft',3,12*@InchToCM)
insert into @myTable values (4,'Yard','yd',3,3*12*@InchToCM)
insert into @myTable values (5,'Meter','m',3,100)
insert into @myTable values (6,'Centimeter','cm',3,1)
insert into @myTable values (7,'Millimeter','mm',3,0.1)
insert into @myTable values (8,'Sqr. Inch','sq in',4,@InchToCM*@InchToCM)
insert into @myTable values (9,'Sqr. Foot','sq ft',4,(12*@InchToCM)*(12*@InchToCM))
insert into @myTable values (10,'Sqr. Yard','sq yd',4,(3*12*@InchToCM)*(3*12*@InchToCM))
insert into @myTable values (11,'Sqr. Meter','sq m',4,100*100)
insert into @myTable values (12,'Sqr. Centimeter','sq cm',4,1)
insert into @myTable values (13,'Sqr. Millimeter','sq mm',4,.01)
insert into @myTable values (14,'Cubic Inch','cu in',5,@InchToCM*@InchToCM*@InchToCM)
insert into @myTable values (15,'Cubic Foot','cu ft',5,(12*@InchToCM)*(12*@InchToCM))
insert into @myTable values (16,'Cubic Yard','cu yd',5,(3*12*@InchToCM)*(3*12*@InchToCM))
insert into @myTable values (17,'Cubic Meter','cu m',5,100*100*100)
insert into @myTable values (18,'Cubic Centimeter','cu cm',5,1)
insert into @myTable values (19,'Cubic Millimeter','cu mm',5,.001)
insert into @myTable values (20,'Milliliter','ml',5,1)
insert into @myTable values (21,'Liter','l',5,1000)
insert into @myTable values (22,'Gallon','gal',5,@QuartToLiter*4*1000)
insert into @myTable values (23,'Quart','qt',5,@QuartToLiter*1000)
insert into @myTable values (24,'Pint','pt',5,@QuartToLiter*1000/2)
insert into @myTable values (25,'Cup','cup',5,@QuartToLiter*1000/4)
insert into @myTable values (26,'Fluid Ounce','fl oz',5,@QuartToLiter*1000/4)
insert into @myTable values (27,'Milligram','mg',2,.001)
insert into @myTable values (28,'Gram','g',2,1)
insert into @myTable values (29,'Kilogram','kg',2,1000)
insert into @myTable values (30,'Ounce','oz',2,@PoundToKg*1000/16)
insert into @myTable values (31,'Pound','lb',2,@PoundToKg*1000)
insert into @myTable values (32,'Ton','tn',2,@PoundToKg*1000*2000)
insert into @myTable values (33,'Second','s',6,1)
insert into @myTable values (34,'Minute','min',6,60)
insert into @myTable values (35,'Hour','hr',6,60*60)
insert into @myTable values (36,'Day','day',6,60*60*24)
insert into @myTable values (37,'Square Feet per Hour','sq ft per hr',7,((12*@InchToCM)*(12*@InchToCM))/(60*60))
insert into @myTable values (38,'Feet per Hour','ft per hr',0,(12*@InchToCM)/(60*60))
insert into @myTable values (39,'per 10','10',1,1/10)
insert into @myTable values (40,'per 100','100',1,1/100)
insert into @myTable values (41,'per 1000','1000',1,1/1000)
insert into @myTable values (42,'per 10000','10000',1,1/10000)
insert into @myTable values (50,'Piece','pc',1,1)
insert into @myTable values (51,'Sheet','Sheet',1,1)
insert into @myTable values (52,'Page','pg',1,1)
insert into @myTable values (53,'Impression','imp',1,1)
insert into @myTable values (54,'Roll','roll',1,1)
insert into @myTable values (55,'Package','Pkg',1,1)
insert into @myTable values (56,'Box','Box',1,1)

	
	   return 
end

GO
