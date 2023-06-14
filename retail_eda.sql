-- Data Exploration of Retail Dataset 
SELECT * FROM retail.samplesuperstore LIMIT 10;

-- Some Insights 

-- 1 Which is the most preferred shipment mode ? 
-- Standard Class 
SELECT 
	Ship_Mode,
    COUNT(*) AS shipment_count
FROM retail.samplesuperstore 
GROUP BY Ship_Mode
ORDER BY shipment_count DESC
LIMIT 10;

-- 2 Which shipment generates the most profit and sales ?
-- Standard Class 
SELECT 
	Ship_Mode,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM retail.samplesuperstore 
GROUP BY Ship_Mode
ORDER BY Sales DESC
LIMIT 10;
 
-- 3 Difference between profit and sales per shipment mode ? 
-- The company should work at increasing the revenue from same day 
WITH retail_cte AS (
SELECT 
	Ship_Mode,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM retail.samplesuperstore 
GROUP BY Ship_Mode
)
SELECT 
	Ship_Mode,
    ROUND(Sales - Profit, 1) AS difference
FROM retail_cte
GROUP BY Ship_Mode
ORDER BY difference DESC; 

-- 4 Which shipment mode is preffered most by each segment ?
-- Standard class  
SELECT DISTINCT 
	segment,
    Ship_Mode,
    COUNT(Ship_Mode) AS shipment_count
FROM retail.samplesuperstore
GROUP BY segment, Ship_Mode
ORDER BY shipment_count DESC
LIMIT 3;

-- 5 Which segment gives the highest sales and profit ?
-- Consumer Segment
SELECT 
	segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM retail.samplesuperstore
GROUP BY segment
ORDER BY 
	total_profit,
    total_sales;

-- 6 Which category has the highest volume of goods ordered ? 
-- Office supplies 
SELECT 
	Category,
    SUM(Quantity) AS volume
FROM retail.samplesuperstore
GROUP BY 
	Category
ORDER BY 
	volume DESC ;

-- 7 Which sub-category was ordered the most ?
-- Binders
SELECT 
	SubCategory,
    SUM(Quantity) AS volume
FROM retail.samplesuperstore
GROUP BY 
	SubCategory
ORDER BY 
	volume DESC;

-- 8 Which category offers the maximum amount of discount ? 
-- Office Supplies
SELECT 
	Category,
    -- COUNT(Discount) AS discount
    Discount
FROM retail.samplesuperstore
GROUP BY 
	Category,
    Discount
ORDER BY 
	Discount DESC;

-- 9 Which subcategory offers the maximum amount of discount ? 
-- Appliances
SELECT 
	SubCategory,
    -- COUNT(Discount) AS discount
    Discount
FROM retail.samplesuperstore
GROUP BY 
	SubCategory,
    Discount
ORDER BY 
	Discount DESC;
    
-- 10 Which region generates the most amount of sales ? 
-- West 
SELECT 
	Region,
    ROUND(SUM(Sales), 2) AS Sales 
FROM retail.samplesuperstore
GROUP BY Region 
ORDER BY 
	Sales DESC;

-- 11 Which region generates the most amount of profit ? 
-- West 
SELECT 
	Region,
    ROUND(SUM(Profit), 2) AS Profit 
FROM retail.samplesuperstore
GROUP BY Region 
ORDER BY 
	Profit DESC;