/* Gather Statistics */

BEGIN 
DBMS_STATS.GATHER_TABLE_STATS(
ownname => 'PERF_TUNING',
tabname => 'CUSTOMERS',
cascade => TRUE
);

DBMS_STATS.GATHER_TABLE_STATS(
ownname => 'PERF_TUNING',
tabname => 'ORDERS',
cascade => TRUE
);
END;
/

/* We see here that even after using INDEXs Oracle tends 
to perform full table scans due to it being less expensive as compared to only using indexes*/

/* So what Oracle does is in this case it uses 1 index and then uses default table scans for the ORDERS table */
  
/* Lets create a histogram to view skewness and uniform distribution of frequency */
BEGIN
DBMS_STATS.GATHER_TABLE_STATS(
ownname => 'PERF_TUNING',
tabname =>  'ORDERS',
method_opt => 'FOR COLUMNS SIZE 254 order_status',
cascade => TRUE 
);
END;
/
