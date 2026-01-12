/* Rerun baseline query */

SELECT c.region, COUNT(o.order_id), SUM(o.order_amount)
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
WHERE c.region = 'RARE_REGION'
AND o.order_status = 'COMPLETED'
GROUP BY c.region;

/* Columns to be taken are also the 'INDEX candidates' which are: c.region, o.customer_id, o.order_status */

/* Create INDEX on c.region */
CREATE INDEX idx_customers_region
ON customers(region);
   
/* Create INDEX on o.order_status and JOINS by customer_id */
CREATE INDEX idx_orders_cust_status
ON orders(customer_id, order_status);
