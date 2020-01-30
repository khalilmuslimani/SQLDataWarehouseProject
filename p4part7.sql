CREATE OR REPLACE PROCEDURE Stats_By_Vehicle_Type (
	V_Autodesc IN varchar2,
    V_Stats	OUT varchar2)
IS
	V_Amt varchar2(20);
    V_Sold varchar2(20);
BEGIN
	V_Sold := Vehicles_By_Vehicle_Type (V_Autodesc);
    V_Amt := Dollars_By_Vehicle_Type (V_Autodesc);
    V_Stats := 'Total Sold: ' || V_Sold || ' Total Gross Sales: ' || V_Amt;
    
EXCEPTION
	WHEN OTHERS
    THEN
		raise_application_error ( -20001, 'error - '|| SQLCODE || ' -ERROR- ' || SQLERRM);
END;
/

DECLARE
	outStats varchar2(200);
    inVeh varchar2(20);
BEGIN
	inVeh := 'honda civic';
    Stats_By_Vehicle_Type (inVeh, outStats);
    DBMS_OUTPUT.PUT_LINE(outStats);
END;
/
