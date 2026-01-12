SELECT * from order_items;

/* Lets run an intentionally slow/expensive query */

SELECT c.region, COUNT(o.order_id), SUM(o.order_amount)
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
WHERE c.region = 'RARE_REGION'
AND o.order_status = 'COMPLETED'
GROUP BY c.region;

EXPLAIN PLAN FOR
SELECT c.region,
       COUNT(o.order_id),
       SUM(o.order_amount)
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.region = 'RARE_REGION'
AND o.order_status = 'COMPLETED'
GROUP BY c.region;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

/* Displays a classic inefficient plan due to TABLE ACCESS FULL */
/* Reads million rows just to dispay 1 row */
/* Due to WHERE clause only 10% of rows are qualified to be searched but Oracle ends up doing full scans */
/* JOINS and other filters are done post scanning which isnt optimal*/
