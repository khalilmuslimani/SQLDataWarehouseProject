SELECT Sale_Day
	FROM TIMES
    WHERE Sale_Day IN (SELECT Sale_Day
							FROM ( SELECT T.Sale_Day,
									RANK () OVER ( ORDER BY SUM (SF.Gross_Sales_Amount) DESC) DAY_RANK
										FROM TIMES T, SALES_FACTS SF
									WHERE T.Sale_Day = SF.Sale_Day
										AND Day_Type = 'Holiday'
									GROUP BY T.Sale_Day)
								WHERE Day_Rank = 1);

