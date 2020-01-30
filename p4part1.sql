CREATE TABLE TIMES (
Sale_Day date NOT NULL,
Day_Type varchar2(10) NOT NULL,
CONSTRAINT Sale_Day_pk PRIMARY KEY (Sale_Day)
);

DECLARE
	CURSOR Sale_Day_cursor is
		SELECT DISTINCT sale_date FROM SALES;
	Day_Type_Data varchar2(10);
BEGIN
	FOR i in Sale_Day_cursor LOOP
		IF i.sale_date = to_date('01-jan-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('20-jan-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('18-feb-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('25-may-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('4-jul-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('7-sep-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('12-oct-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('11-nov-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('28-nov-98')
			THEN Day_Type_Data := 'Holiday';
		ELSIF i.sale_date = to_date('25-dec-98')
			THEN Day_Type_Data := 'Holiday';
	ELSIF to_char(i.sale_date, 'dy') in ('sat', 'sun')
		THEN Day_Type_Data := 'Weekend';
	ELSE Day_Type_Data := 'Weekday';
    END IF;
		INSERT INTO TIMES (Sale_Day, Day_Type)
			VALUES(i.sale_date, Day_Type_Data);
	END LOOP;
END;
/

SELECT Day_Type,
	COUNT(*), MIN(Sale_Day), MAX(Sale_Day)
    FROM TIMES
		GROUP BY Day_Type
        ORDER BY Day_Type;

