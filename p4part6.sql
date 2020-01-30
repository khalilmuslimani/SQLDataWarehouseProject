CREATE OR REPLACE FUNCTION Dollars_By_Vehicle_Type (V_Autodesc varchar2)
	RETURN varchar2
IS
	V_AMT varchar2(20);
BEGIN
	SELECT NVL (SUM (Gross_Sales_Amount), 0)
		INTO V_AMT
        FROM VEHICLES V, SALES_FACTS SF
	WHERE V.Vehicle_Code = SF.Vehicle_Code and V.Description = V_Autodesc;
    
    RETURN V_AMT;
EXCEPTION
	WHEN OTHERS
    THEN
		RETURN 0;
END;
/

SELECT Dollars_By_Vehicle_Type('truck') GROSSAMOUNT FROM DUAL;