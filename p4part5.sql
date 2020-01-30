CREATE OR REPLACE FUNCTION Vehicles_By_Vehicle_Type (V_Autodesc varchar2)
	RETURN varchar2
IS
	V_SOLD varchar2 (20);
BEGIN
	SELECT NVL(SUM (Vehicles_Sold), 0)
		INTO V_SOLD
		FROM VEHICLES V , SALES_FACTS SF
	WHERE V.Vehicle_Code = SF.Vehicle_Code and V.Description = V_Autodesc;
  
	RETURN V_SOLD;
    
EXCEPTION
	WHEN OTHERS
    THEN
		RETURN 0;
END;
/

SELECT Vehicles_By_Vehicle_Type('truck') Vehicles_Sold FROM DUAL;