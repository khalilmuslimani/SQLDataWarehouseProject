SELECT Day_Type,
	S.Sale_Day,
    SUM (Vehicles_Sold) AS NOOFVEHICLES,
    SUM (S.Gross_Sales_Amount) AS Total_Sales FROM SALES_FACTS S, TIMES T
		WHERE S.Sale_Day = T.Sale_Day
		GROUP BY Day_Type, S.Sale_Day
	HAVING SUM (S.Gross_Sales_Amount) <= 30000 and SUM (Vehicles_Sold) <= 2;