/* Synthesize data for customers table with 100000 rows*/

BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO customers VALUES(
         i,
         'Customer_' || i,
         CASE
            WHEN MOD(i,10) = 0 THEN 'RARE_REGION'       /*skewness to further slow down fetching of data*/
            ELSE 'COMMON_REGION'                        /* 1 in 10 regions are rare regions*/
         END,
         TRUNC(SYSDATE - DBMS_RANDOM.VALUE(1,3000))
      );
    END LOOP;
    COMMIT;
   END;
/

/* Synthesize data for orders table with 1000000 rows */
BEGIN
    FOR i IN 1..1000000 LOOP
        INSERT INTO orders VALUES(
            i,
            MOD(i,100000) +1,
            TRUNC(SYSDATE - DBMS_RANDOM.VALUE(1,1000)),    /*Provides dates of past 3 years (1000 days ago)*/
            CASE
                WHEN MOD(1,5)=0 THEN 'CANCELLED'        /* 1 in 5 orders are cancelled*/
                ELSE 'COMPLETED'
            END,
            DBMS_RANDOM.VALUE(100,5000)
            );
            END LOOP;
            COMMIT;
            END;
/

/* Synthesize data for order_items table with 3000000 rows */            
BEGIN 
    FOR i IN  1..3000000 LOOP
        INSERT INTO order_items VALUES(
           i,
           MOD(i,1000000) +1,
           MOD(i,50000),
           MOD(i,5)+1,
           DBMS_RANDOM.VALUE(50,500)            
          );
         END LOOP;
         COMMIT;
     END;
/
