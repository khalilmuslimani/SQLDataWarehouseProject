DECLARE
CURSOR sales_data
IS
 SELECT VIN, sale_date, SF.plan_id, SP.dealer_id, 
 COUNT(*) AS Vehicles_Sold, SUM(S.gross_sale_price) AS Gross_Sales_Amount
 FROM SALES S, SALE_FINANCINGS SF, SALESPERSONS SP, VEHICLES V
 WHERE S.sale_id = SF.sale_id AND S.VIN = V.Vehicle_Code
 GROUP BY VIN, sale_date, SF.plan_id, SP.dealer_ID
 HAVING COUNT(*) > 0;

BEGIN
FOR record IN sales_data
LOOP
    INSERT INTO SALES_FACTS (Sale_Day,Vehicle_Code,plan_id,Dealer_ID,Vehicles_Sold, Gross_Sales_Amount)
    VALUES (record.sale_date,record.VIN,record.plan_id,record.Dealer_ID,record.Vehicles_Sold,record.Gross_Sales_Amount);
END LOOP;
END;
/

SELECT COUNT(*) FROM SALES_FACTS;
SELECT SUM(Vehicles_Sold) FROM SALES_FACTS;
