CREATE TABLE SALES_FACTS (
Sale_Day date NOT NULL,
Vehicle_Code number(10) NOT NULL,
plan_id number(10) NOT NULL,
Dealer_ID number(10) NOT NULL, 
Vehicles_Sold number(10),
Gross_Sales_Amount number(8,2),
CONSTRAINT SALES_FACTS_pk PRIMARY KEY (Sale_Day, Vehicle_Code, plan_id, Dealer_ID),
CONSTRAINT Sales_Day_fk FOREIGN KEY (Sale_Day) references TIMES(Sale_Day),
CONSTRAINT Vehicle_Code_fk FOREIGN KEY (Vehicle_Code) references VEHICLES(Vehicle_Code),
CONSTRAINT plan_id_fk FOREIGN KEY (plan_id) references FINANCING_PLANS(plan_id),
CONSTRAINT Dealer_ID_fk FOREIGN KEY (Dealer_ID) references DEALERSHIPS(Dealer_ID)
)
/

DESCRIBE SALES_FACTS;